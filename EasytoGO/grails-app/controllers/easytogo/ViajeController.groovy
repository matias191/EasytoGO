package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Transactional(readOnly = true)
@Secured(['permitAll'])
class ViajeController {
  def springSecurityService
  def pdfRenderingService

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Viaje.list(params), model:[viajeInstanceCount: Viaje.count()]
  }

  def buscaViaje(String origen1, String destino1){
    //[viajes: Viaje.findAll]
    def now = new Date()
    def v_fecha2
    def v_fecha
    Date fecha_par
    if (params.fecha1){

      v_fecha2 = new Date(params.fecha1)
      v_fecha = v_fecha2.format('yyyy-MM-dd HH:mm:ss')
      fecha_par = Date.parse('yyyy-MM-dd HH:mm:ss', v_fecha)
    }
    def ViajeList = Viaje.createCriteria().list (params) {
      if (params.query || params.query1) {
        ilike("origen", "%${params.query}%")
        ilike("destino", "%${params.query1}%")
        between("fecha_salida", now, now + 20)
        // ge("fecha_salida", fecha_par)
        //"%${params.query}%")
      }
      else
      {
        between("fecha_salida", now-1  , now + 20)
        //gt("fecha_salida", fecha_par)

      }
    }
    //[viajes:Viaje.listOrderByorigen()]
    [viajes: ViajeList]

  }

  def usuarioViaje(){
    //[viajes: Viaje.findAll]}
    def params = sec.loggedInUserInfo(field:'id')

    //def ViajeList = Viaje.createCriteria().list (params) {
    //if ( params.query ) {
    //  ilike("conductor", "%${params.query}%")
    //ilike("destino", "${sec.loggedInUserInfo(field:'id')}") //"%${params.query}%")
    //}
    //}
    //[viajes:Viaje.listOrderByorigen()]
    User usuario = User.findByUsername(sec.loggedInUserInfo(field:'username'))
    [viajes: Viaje.findAllByConductor(usuario), reserva: Reserva.findAllByUsuario(usuario)]

    //[reserva: Reserva.findAllByUsuario(usuario)]

  }

  def pasajeroViaje(int viajeid){

    def usr = sec.loggedInUserInfo(field:'id')
    def usr1 = User.findById(usr) //busco el usuario que califica el usaurio logueado
    Viaje viajes_pas = Viaje.findById(viajeid) //busco el viaje que se esta en el que estuvieron los usuarios
    def reser = Reserva.findByViajesAndUsuario(viajes_pas, usr1)
    def calif = Calificacion.findAllByCalificadorAndViaje_c(usr1, reser) //busco todas las calificaciones realizadas por el usuario calificador osea el logueado
    def calificado = User.findById(calif.calificado.id) //busco todos los usaurios que han sido calificados por el usr logueado
    //def c = Reserva.createCriteria()
    //def reser = c{like("viajes", viajes_pas)
    //and {NotEqual("usuario", calificado)}

    //}
    def ReservaList = Reserva.createCriteria().list() {
      if (calificado){
        eq("viajes", viajes_pas)
        ne("usuario", usr1)
        ne("usuario", calificado) //"%${params.query}%")
      }
      else{
        eq("viajes", viajes_pas)
        ne("usuario", usr1)
      }
    } //creo un criterio para traer los pasajeros que aún no han sido calificados
    def condc = User.findById(viajes_pas.conductor.id)

    Reserva r
    r = reser
    Reserva cond

    def calcond = Calificacion.findAllByCalificadorAndCalificadoAndViaje_c(usr1, condc, reser)
    if (calcond){
      cond = null

    }else{
      cond = r
    }
    //  and {like("usuario",usr)}
    //}
    //[reserva: reser]
    //[reserva: Reserva.findAllByViajesAndUsuarioNotEqualAndUsuarioNotEqual(viajes_pas, usr1, calificado),
    [reserva: ReservaList, calificacion: cond]

    //
  }

  def show(Viaje viajeInstance) {
    respond viajeInstance
  }



  def create() {
    respond new Viaje(params)
  }
  
  def lala(){
    Calendar dob = Calendar.getInstance();
    println dob
   // dob.setTime(dateOfBirth);
    println Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
  }

  @Transactional
  def save(Viaje viajeInstance) {
    if (viajeInstance == null) {
      notFound()
      return
    }
    //Verificacion de la fecha del carnet de conducir. esto no lo ocupo al final
    Calendar cal = Calendar.getInstance();
    
    cal.setTime(viajeInstance.conductor.fecVencCarnet)
    cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
    Date lastDayOfMonth = cal.getTime();
   
    //Guarda el viaje siempre y cuando la fecha de salida no sea menor a la actual
    Date now = new Date()
    Date salida = viajeInstance.fecha_salida
    //si es mejor vuelve a la misma vista con el flashmessage, si esta todo bien sigue y guarda
    if (salida.before(now)){
      flash.message = "Revisa tu fecha de salida ya que no puede ser anterior a la fecha de hoy."
      render(view:'create', model: [viajeInstance: viajeInstance]);

    }
    //Verifica que tenga vechiculo cargado
    else if(viajeInstance.conductor.vehiculos) {
      //Verifica que tenga seguro
      if(viajeInstance.conductor.vehiculos.seguro == [true]){
        //Verifica si tiene cargada alguna fecha de vencimiento ya q era opcional
        if(viajeInstance.conductor.fecVencCarnet == null){
          flash.message = "Debes cargar en tu perfil la fecha de vencimiento de tu carnet de conducir."
          render(view:'create', model: [viajeInstance: viajeInstance]);
          return}
        //Verifica si el carnet esta vencido
        if(viajeInstance.conductor.fecVencCarnet.before(now)){
          flash.message = "Tu carnet de conducir esta vencido. Si ya lo has renovado actualiza la informacion en tu perfil."
          render(view:'create', model: [viajeInstance: viajeInstance]);
          return
        }
        
        if (viajeInstance.hasErrors()) {
          respond viajeInstance.errors, view:'create'
          return
        }

        viajeInstance.save flush:true

        request.withFormat {
          form multipartForm { //flash.message = message(code: 'default.created.message', args: [message(code: 'viaje.label', default: 'Viaje'), viajeInstance.id])
            redirect viajeInstance }
          def sql = """update Viaje viajeInstance
                   set viajeInstance.estado = 'ACTIVO'
                    
                   where viajeInstance.id = '${viajeInstance.id}'"""
          viajeInstance.executeUpdate(sql)
          '*' { respond viajeInstance, [status: CREATED] }
        }
      }else{flash.message = "Tu vehiculo no tiene seguro. Puedes editarlo en tu perfil."
        render(view:'create', model: [viajeInstance: viajeInstance]);}
    }else{
      flash.message = "Para publicar un viaje debes tener un vehiculo cargado en tu perfil."
      render(view:'create', model: [viajeInstance: viajeInstance]);}
  }

  def edit(Viaje viajeInstance) {
    respond viajeInstance
  }

  @Transactional
  def update(Viaje viajeInstance) {
    if (viajeInstance == null) {
      notFound()
      return
    }

    if (viajeInstance.hasErrors()) {
      respond viajeInstance.errors, view:'edit'
      return
    }

    viajeInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [message(code: 'Viaje.label', default: 'Viaje'), viajeInstance.id])
        redirect viajeInstance
      }
      def sql = """update Viaje viajeInstance
                   set viajeInstance.estado = 'ACTIVO'
                    
                   where viajeInstance.id = '${viajeInstance.id}'"""
      '*'{ respond viajeInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(Viaje viajeInstance) {

    if (viajeInstance == null) {
      notFound()
      return
    }

    viajeInstance.delete flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'Viaje.label', default: 'Viaje'), viajeInstance.id])
        redirect action:"index", method:"GET"
      }
      '*'{ render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'viaje.label', default: 'Viaje'), params.id])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }
  def reservar(Viaje viajeInstance) {
    def User user = springSecurityService.currentUser
    def idUser = user.id
    Viaje viajes = Viaje.findById(viajeInstance.id)
    def dateOfBirth = viajeInstance.conductor.getFecNac()
    Calendar dob = Calendar.getInstance();
    dob.setTime(dateOfBirth);
    Calendar today = Calendar.getInstance();
    int age = today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);



    if (today.get(Calendar.MONTH) < dob.get(Calendar.MONTH)) {
      age--;
    } else if (today.get(Calendar.MONTH) == dob.get(Calendar.MONTH)
    && today.get(Calendar.DAY_OF_MONTH) < dob.get(Calendar.DAY_OF_MONTH)) {
      age--;
    }
    render(view:'reservar', model: [viajeInstance: viajeInstance, age: age, idUser: idUser, reserva: Reserva.findAllByViajes(viajes)]);
    //respond viajeInstance
  }
  def reservar = {
    visible = true
    if (isCurrent)
      visible = false
    [disabled, disabled]
  }
  def calificar(int reservaid, int calificadoid, int conductorid) {

    //Reserva reserva = findbyId(reservaid)
    //User usuario	= findbyId(calificadoid)
    [reserva: Reserva.findById(reservaid), usuario: User.findById(calificadoid)]
    //render(view:'misViajes')
  }


  def misViajes(){

    User cond = User.findById(sec.loggedInUserInfo(field:'id'))
    [mviaje: Viaje.findAllByConductor(cond)]
  }

  def reportes(){
    Date now = Calendar.getInstance(TimeZone.getTimeZone('GMT-3')).time
    def formatter = new java.text.SimpleDateFormat('dd/MM/yyyy')
    formatter.timeZone = TimeZone.getTimeZone('GMT-3')
    def fecha= formatter.format(now)
    if (params){
      User cond123 = User.findById(sec.loggedInUserInfo(field:'id'))
      def ViajeReport = Viaje.createCriteria().list (params) {

        ilike("origen", "%${params.origen}%")
        ilike("destino", "%${params.destino}%")
        // between("fecha_salida", "{params.fechadesde}", "${params.fechahasta}")
      }
      def columnas = [['string', 'Origen'], ['number', 'conteo']]
      def datos = []
      def columnas1 = [['string', 'Destino'], ['number', 'conteo']]
      def datos1 = []
      def cant

      def columnas2 = [['string', 'Reserva'], ['number', 'conteo']]
      def datos2 = []
      def columnas3 = [['string', 'Destino'], ['number', 'conteo']]
      def datos3 = []

      Reserva.list().each{est->
        def registro = [est, Reserva.countByEstIlike(est)]
        datos2.add(registro)
      }




      Viaje.list().each{origen->
        def registro = [origen, Viaje.countByOrigen(origen)]
        datos.add(registro)
      }

      Viaje.list().each{destino->
        def registro = [destino.toString(), Viaje.countByDestino(destino)]
        datos1.add(registro)
      }

      def titulo = "Origen de viajes"
      def titulo1 = "Destino de viajes"
      def titulo2 = "Reservas"

      [titulo: titulo, columnas: columnas, datos: datos, viajes1: ViajeReport,
        titulo1: titulo1, columnas1: columnas1, datos1: datos1,
        titulo2: titulo2, columnas2: columnas2, datos2: datos2]

      //new File("C:/Dario/${cond123}.pdf").withOutputStream
      //        def pdf = new ByteArrayOutputStream().withStream  { outputStream ->
      //             pdfRenderingService.render(controller:this, template:"pdfReportes",model:[viajeReport: ViajeReport, fecha: fecha], outputStream).toByteArray()
      //           }
      //        render(file:pdf,contentType: 'application/pdf')
      //        [viajes1: ViajeReport]
    }


  }

  def usuarioViajeCal(){}
}


