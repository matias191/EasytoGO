package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import java.text.SimpleDateFormat



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
  
  def buscaViaje(){
    //[viajes: Viaje.findAll]
    def now = new Date()
    //def v_fecha2
    //def v_fecha
    //println("parametro fecha1 "+ params.fecha1)
    
    //Date d = Date.parse( 'dd/MM/yyyy', date )
    //Date d = Date.DateFormat.parse(date)
    //Date fecha_par
   // Date fecha5 = params.fecha1
    
    //println("fechafea " + fecha5)
    //println("origen1 " + origen1)
   // println("destino1 " + destino1)
    //println("now " + now)
   
  // println("fecha string "+ fecha)
   //println("parseada " + aver)
   // println("fecha5 "+ fecha5)
    
   /* if (params.fecha1){

      v_fecha2 = new Date(params.fecha1)
      v_fecha = v_fecha2.format('yyyy-MM-dd HH:mm:ss')
      fecha_par = Date.parse('yyyy-MM-dd HH:mm:ss', v_fecha)
      
      println("fecha1 "+ params.fecha1)
      println("v_fecha2 " + v_fecha2)
      println("v_fecha " + v_fecha)
      println("fecha_par " + fecha_par)
      
    }*/
    
    def ViajeList = Viaje.createCriteria().list (params) {
      if (params.query || params.query1) {
        if(params.fecha1){
          String fecha = params.fecha1
          def aver = new SimpleDateFormat("dd/MM/yyyy").parse(fecha)
          ilike("origen", "%${params.query}%")
          ilike("destino", "%${params.query1}%")
          ilike("estado", "ACTIVO")
          between("fecha_salida", aver -1 , aver + 1)
          
        }
        else 
        {
        ilike("origen", "%${params.query}%")
        ilike("destino", "%${params.query1}%")
        ilike("estado", "ACTIVO")
        }
       
         
      }
      else  if(params.fecha1){
          String fecha = params.fecha1
          def aver = new SimpleDateFormat("dd/MM/yyyy").parse(fecha)
          between("fecha_salida", aver-1, aver+1)
          ilike("estado", "ACTIVO")
        } else
      {
        between("fecha_salida", now -1 , now + 20)
        ilike("estado", "ACTIVO")
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
    Reserva reser1 = Reserva.findByViajesAndUsuario(viajes_pas, usr1)
    def calif = Calificacion.findAllByCalificadorAndViaje_c(usr1, reser1) //busco todas las calificaciones realizadas por el usuario calificador osea el logueado
    def calificado = User.findById(calif.calificado.id) //busco todos los usaurios que han sido calificados por el usr logueado
    
    
    //Reserva reserv2 = reser1.id
    //println("reserv2 " + reserv2)   
    println("calificado " + calificado)
    println("viajes_pas " + viajes_pas)
    println("usr1 " + usr1)
    println("calif " + calif[0] + calif[1])
    println("reser " + reser1)
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
    r = reser1
    Reserva cond

    def calcond = Calificacion.findAllByCalificadorAndCalificadoAndViaje_c(usr1, condc, reser1)
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
    /*Calendar cal = Calendar.getInstance();
    
    cal.setTime(viajeInstance.conductor.fecVencCarnet)
    cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
    Date lastDayOfMonth = cal.getTime();*/
   
    //Guarda el viaje siempre y cuando la fecha de salida no sea menor a la actual
    Date now = new Date()
    Date salida = viajeInstance.fecha_salida
    //si es menor vuelve a la misma vista con el flashmessage, si esta todo bien sigue y guarda
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
          form multipartForm { flash.message = "Has creado tu viaje correctamente!"
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
      
   if(Reserva.findByViajes(viajeInstance)){
     flash.message = "No puedes eliminar este viaje porque ya tiene reservas hechas. Avisale a tus pasajeros sobre tu inconveniente. Comunicate a easytogo.viajescompartidos@gmail.com ante cualquier duda."
     redirect viajeInstance
     return
   }
  
   

    // viajeInstance.delete flush:true
def sql = """update Viaje viajeInstance
                  set viajeInstance.estado = 'CANCELADO'
                   
                  where viajeInstance.id = '${viajeInstance.id}'"""
 viajeInstance.executeUpdate(sql)


      request.withFormat {
          form multipartForm {
              flash.message = "Has eliminado tu viaje correctamente"
//message(code: 'default.deleted.message', args: [message(code: 'Viaje.label', default: 'Viaje'), viajeInstance.id])
              //redirect action:"index", method:"GET"
render(view:'misViajes')
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

  @Secured(['ROLE_ADMIN'])
 def reportes(){
     Date now = Calendar.getInstance(TimeZone.getTimeZone('GMT-3')).time
     def formatter = new java.text.SimpleDateFormat('dd/MM/yyyy')
     formatter.timeZone = TimeZone.getTimeZone('GMT-3')
     def fecha= formatter.format(now)
     
    def v_fecha2
    def v_fecha3
    def v_fecha_1
    def v_fecha
    Date fecha_des
    Date fecha_has
     
     
         
     if (params){
         User cond123 = User.findById(sec.loggedInUserInfo(field:'id'))
         def ViajeReport = Viaje.createCriteria().list (params) {
             
                 ilike("origen", "%${params.origen}%")
                 ilike("destino", "%${params.destino}%")
                 between("fecha_salida", fecha_des, fecha_has)
             }
         def columnas = [['string', 'Origen'],['number', 'conteo']]
         def datos = []
         def columnas1 = [['string', 'Destino'],['number', 'conteo']]
         def datos1 = []
         def cant
         
         def columnas2 = [['string', 'Reserva'],['number', 'conteo']]
         def datos2 = []
         def columnas3 = [['string', 'Estado'],['number', 'conteo']]
         def datos3 = []
        def columnas4 = [['string', 'Estado'],['number', 'conteo']]
        def datos4 = []
        
    if (params.desde){      
        
        def anio = params.desde.substring(6)
        def mesf = params.desde.substring(3,5)
        def dia = params.desde.substring(0,2)
        def desde = anio+mesf+dia
        
        def anio1 = params.hasta.substring(6)
        def mesf1 = params.hasta.substring(3,5)
        def dia1 = params.hasta.substring(0,2)
        def hasta = anio1+mesf1+dia1
        
        println(anio)
        println(anio1)
                     
        def consulta_reserva = Reserva.executeQuery(
          "select est, count(*) from Reserva group by est")
          
           // "select est, count(*) from (select id,version,cant_plaz,est,estado,substr(fecha_res,7,4)||substr(fecha_res,4,2)||substr(fecha_res,1,2)  fecha_res,usuario_id,viajes_id from Reserva) Reserva where fecha_res between '${desde}' and '${hasta}' group by est")
    consulta_reserva.each { item ->
        def estado = item[0]
        def estadoCount = item[1]
        def registro = [estado, estadoCount]
        datos2.add(registro)
         }
                     
  
     
     
    def consulta_origen = Viaje.executeQuery(
            "select origen, count(*) from Viaje where  to_char(fecha_salida, 'yyyyMMdd') between '${desde}' and '${hasta}' group by origen")
    consulta_origen.each { item ->
        def origen = item[0]
        def origenCount = item[1]
        def registro = [origen, origenCount]
        datos.add(registro)
    } 
  
         
    def consulta_destino = Viaje.executeQuery(
        "select destino, count(*) from Viaje where  to_char(fecha_salida, 'yyyyMMdd') between '${desde}' and '${hasta}' group by destino")
    consulta_destino.each { item ->
        def destino = item[0]
        def destinoCount = item[1]
        def registro = [destino, destinoCount]
        datos1.add(registro)
    }

    def consulta_viaje = Viaje.executeQuery(
        "select estado, count(*) from Viaje where  to_char(fecha_salida, 'yyyyMMdd') between '${desde}' and '${hasta}' group by estado")
    consulta_viaje.each { item ->
        def estado = item[0]
        def estadoCount = item[1]
        def registro = [estado, estadoCount]
        datos3.add(registro)
    }
    
    def consulta_reca = Reserva.executeQuery(
        "SELECT  SUBSTRING(fecha_res,4, 2), sum(v.costoplaza*0.10) FROM Reserva, Viaje v where viajes_id = v.id group by SUBSTRING(fecha_res,4, 2)")
    consulta_reca.each { item ->
        def mes
        if(item[0] == '01'){
        mes = 'ENERO'}
        if(item[0] == '02'){
        mes = 'FEBRERO'}
        if(item[0] == '03'){
            def MES = 'MARZO'}
        if(item[0] == '04'){
            mes = 'ABRIL'}
        if(item[0] == '05'){
            mes = 'MAYO'}
        if(item[0] == '06'){
            mes = 'JUNIO'}
        if(item[0] == '07'){
            mes = 'JULIO'}
        if(item[0] == '08'){
            mes = 'AGOSTO'}
        if(item[0] == '09'){
            mes = 'SEPTIEMBRE'}
        if(item[0] == '10'){
            mes = 'OCTUBRE'}
        if(item[0] == '11'){
            mes = 'NOVIEMBRE'}
        if(item[0] == '12'){
            mes = 'DICIEMBRE'}
        
        def total = item[1]
        def registro = [mes, total]
        datos4.add(registro)
    }
    }

         

         def titulo = "Origen de viajes"
         def titulo1 = "Destino de viajes"
        def titulo3 = "Cantidad de viajes"
         def titulo2 = "Reservas"
        def titulo4 = "Recaudacion"
         
         [titulo: titulo, 
         columnas: columnas, 
         datos: datos, 
         viajes1: ViajeReport,
          titulo1: titulo1, 
         columnas1: columnas1, 
         datos1: datos1,
          titulo2: titulo2, 
         columnas2: columnas2, 
         datos2: datos2,
         titulo3: titulo3,
         columnas3: columnas3,
         datos3: datos3,
         titulo4: titulo4,
         columnas4: columnas4,
         datos4: datos4]
         

     }
     
     
 }

  def usuarioViajeCal(){}
}


