package easytogo


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils;
import grails.plugin.springsecurity.SpringSecurityService;
import java.util.Random;
import org.springframework.security.crypto.password.PasswordEncoder




/**
 * Controlador del dominio User.groovy.
 * 
 * Contiene la logica del dominio, 
 * realiza calculos y consultas a la BD
 * de acuerdo a los metodos implementados.
 *
 * @author MatiMore
 */
@Transactional(readOnly = true)
@Secured(['permitAll'])
class UserController {
  def random = new Random();
  def randomInt = null
  def randomInt1 = null
  def springSecurityService
  def mailService;
  def smsService
  def pdfRenderingService
  private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']


  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  /**
   * Muestra la lista de usuarios actuales.
   */
  
  @Secured(['ROLE_ADMIN'])
  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond User.list(params), model:[userInstanceCount: User.count()]
  }

  /**
   * Muestra el detalle de un usuario especifico.
   * @param userInstance Instancia de un usuario.
   * @return userInstance Instancia de usuario para que la vista lo maneje.
   */
  def show(User userInstance) {

    def dateOfBirth = userInstance.getFecNac()
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


    def user = springSecurityService.currentUser
    if (userInstance == user){
      respond userInstance
    }else{
      publicPerfil(userInstance)
    }
  }

  def create() {
    respond new User(params)
  }

  @Transactional
  def save(User userInstance) {

    userInstance.enabled=false;
    userInstance.confirmCode= UUID.randomUUID().toString()


    randomInt = random.nextInt(9000-1000+1)+100
    userInstance.confirmCodeSMS=randomInt

    randomInt1 = random.nextInt(9000-1000+1)+100
    userInstance.confirmCodeDir=randomInt1

    if (userInstance == null) {
      notFound()
      return
    }

    if (userInstance.hasErrors()) {
      respond userInstance.errors, view:'create'
      return
    }

    userInstance.save flush:true
    def mail = userInstance.email


    mailService.sendMail {
      to userInstance.email
      subject "Easy To Go - Activacion de cuenta."
      html g.render(template:"mailtemplate",model:[code:userInstance.confirmCode,nombre:userInstance.nombre])
    }

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message',args: [message(code: 'user.label', default: 'User'), userInstance.id])
        flash.message = "probando mensaje"
        //redirect userInstance
        //redirect(action: "success")
        render(view:'success', model: [mail: mail]);
      }
      '*' { respond userInstance, [status: CREATED] }
    }
  }

  def success(){
    render(view:'success');
  }

  def confirm(String id) {

    User userInstance = User.findByConfirmCode(id)
    if(!userInstance) {
      return;
    }

    //userInstance.confirmCode= '';

    userInstance.enabled=true;
    if (!userInstance.save(flush: true)) {
      render(view: "result", model: [message: 'Hubo un problema al activar tu cuenta. Por favor envia un mail a easytogo.viajescompartidos@gmail.com'])
      return
    }
    render(view: "result", model: [message: 'Tu cuenta se ha activado correctamente! Ya puedes iniciar sesion.'])
  }


  def edit(User userInstance) {
    respond userInstance
  }

  @Transactional
  def update(User userInstance) {

    if (userInstance == null) {
      notFound()
      return
    }

    if (userInstance.hasErrors()) {
      respond userInstance.errors, view:'edit'
      return
    }

    userInstance.save flush:true

    request.withFormat {
      form multipartForm {
        //        flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
        flash.message = "Has actualizado tu perfil correctamente!"
        redirect userInstance
      }
      '*'{ respond userInstance, [status: OK] }
    }
  }



  @Transactional
  def delete(User userInstance) {

    if (userInstance == null) {
      notFound()
      return
    }

    //Elimina la relacion del usuario con el rol en la tabla User_Rol
    if (UserRol.findAllByUser(userInstance)){
      UserRol.findAllByUser(userInstance)*.delete()
    }

    userInstance.setEnabled(false)
    
    userInstance.save flush:true
    

    request.withFormat {
      form multipartForm {
        flash.message = "Has dado de baja tu perfil correctamente"
        redirect(uri:'/')
        
        //redirect action:"index", method:"GET"
      }
      '*'{ render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }




  @Transactional
  def updatePassword(User userInstance) {
    if (userInstance == null) {
      notFound()
      return
    }

    if (userInstance.hasErrors()) {
      respond userInstance.errors, view:'edit'
      return
    }

    /* String password = params.passwordActual
     String newPassword = params.password
     String newPassword2 = params.confirmaPassword
     */
    userInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
        redirect userInstance
      }
      '*'{ respond userInstance, [status: OK] }
    }

  }

  /* @Transactional
   def updatePassword1(String pass, String pass1) {
   def user = springSecurityService.currentUser
   def actualPass = user.password
   if (pass == actualPass){
   user.password = pass1
   }else{
   flash.message = "Clave incorrecta"
   redirect user}
   flash.message = "Se actualizo la contraseña correctamente"
   // redirect user
   String password = params.passwordActual
   String newPassword = params.password
   String newPassword2 = params.confirmaPassword
   user.save flush:true
   request.withFormat {
   form multipartForm {
   flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
   redirect user
   }
   '*'{ respond user, [status: OK] }
   }
   }*/
  
  def cambiarPass(User userInstance){
    
    def user = springSecurityService.currentUser    
    if(springSecurityService.passwordEncoder.isPasswordValid(user.password, params.passActual, null)){
     userInstance.password = params.passwordNueva
          
      userInstance.save flush:true
      flash.message = "Has actualizado tu contrasenia correctamente!"
      redirect userInstance
      
      }else {
      flash.message = "Tu contrasenia actual es incorrecta. Intentalo nuevamente!"
      
      render(view:'updatePassword', model:[userInstance:userInstance])
    
    
   
     
      }
  }
  def upload_avatar() {
    def user = springSecurityService.currentUser // or however you select the current user

    // Get the avatar file from the multi-part request
    def f = request.getFile('avatar')

    // List of OK mime-types
    if (!okcontents.contains(f.getContentType())) {
      flash.message = "Avatar must be one of: ${okcontents}"
      render(view:'select_avatar', model:[user:user])
      return
    }

    // Save the image and mime type
    user.avatar = f.bytes
    user.avatarType = f.contentType
    user.save flush:true
    log.info("File uploaded: $user.avatarType")

    // Validation works, will check if the image is too big
    if (!user.save()) {
      render(view:'select_avatar', model:[user:user])
      return
    }

    //flash.message = "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
    flash.message = "Foto actualizada correctamente."
    redirect user
  }

  def avatar_image() {
    def avatarUser = User.get(params.id)
    if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType) {
      response.sendError(404)
      return
    }
    response.contentType = avatarUser.avatarType
    response.contentLength = avatarUser.avatar.size()
    OutputStream out = response.outputStream
    out.write(avatarUser.avatar)
    out.close()
  }

  def sms(User userInstance){

    def tel = userInstance.telefono.toString()
    def cod = userInstance.confirmCodeSMS.toString()
    def map = [to:tel,from:"+14243428457",body:"Ingrese el siguiente codigo para verificar su telefono " + cod + ". Easy To GO"]
    smsService.send(map)
    def telefono = userInstance.telefono
    [telefono:telefono]
   
    }
  def verifSMS (int codigo){
    def user = springSecurityService.currentUser

    def cod1 = user.confirmCodeSMS
    def cod2 = codigo
    if (cod1 == cod2){
      user.verifTel=true
      user.save flush:true
      redirect user
    }else{
      flash.message = "EL CODIGO QUE INGRESASTE ES INCORRECTO. INTENTA VALIDAR TU TELEFONO NUEVAMENTE. Ante cualquier duda escribenos a easytogo.viajescompartidos@gmail.com"
      redirect user
    }
  
  }

  def publicPerfil(User userInstance){
    //Calificacion calif = []
    //User userInstance= User.findByConfirmCode(id)
    def datos2 = []
    // for (calificacion in Calificacion.findByCalificado(userInstance)){
    //calif.add(Calificacion.findByCalificado(userInstance))
    //}

    def consulta_reserva = Calificacion.executeQuery(
        "select valor,comentario, calificador from Calificacion where calificado_id = '${userInstance.id}'")
    consulta_reserva.each { item ->
      def estado = item[0]
      def comentario = item[1]
      def calificador = item [2]
      def registro = [estado, comentario, calificador]
      datos2.add(registro)
    }

    println datos2


    render(view:'publicPerfil', model: [userInstance: userInstance, datos: datos2])  ;
  }

  def pago(){}

  //metodo aparte para probar pero no lo ocupo
  def crearPdf(){
    new File("C:/pdf/report.pdf").withOutputStream { outputStream ->
      pdfRenderingService.render(controller:this, template:"pdfTemplate", outputStream)
    }

    redirect(uri:'/')

  }

  //este hace q salga la ventanita q te pregunta donde lo queres guardar (si no le pongo filename, lo muestra en el navegador)
  /* def crearPdf(){
   def args = [template:"pdfTemplate", filename: "yourTitle"]
   pdfRenderingService.render(args+[controller:this],response)
   redirect(uri:'/')
   }*/

  @Transactional
  def confirmDireccion(User userInstance){
    //SE FIJA QUE EL USUARIO TENGA UNA DIRECCION CARGADA
    if (!userInstance.direccion){
      flash.message = "No tenemos tu direccion! Ingresala de forma completa en tu perfil para que podamos verificarla."
      redirect userInstance
    }else{

      userInstance.envioCarta=true
      userInstance.save flush:true

      /*TimeZone reference = TimeZone.getTimeZone("GMT");
       Calendar myCal = Calendar.getInstance(reference);
       TimeZone.setDefault(reference);
       def fecha=  myCal.getTime();*/

      Date now = Calendar.getInstance(TimeZone.getTimeZone('GMT-3')).time
      def formatter = new java.text.SimpleDateFormat('dd/MM/yyyy')
      formatter.timeZone = TimeZone.getTimeZone('GMT-3')
      def fecha= formatter.format(now)

      def direccion1 = userInstance.direccion
      def usuario = userInstance.username
      def cod = userInstance.confirmCodeDir
      def nombre1 = userInstance.nombre
      String apellido1 = userInstance.apellido
     
      //Hago esto por si viene ñ o acento en el nombre pq explota cuando hace el pdf. Esto le saca el caracter directamente
      byte[] apellido4 = apellido1.getBytes()
      String apellido = new String(apellido4,"US-ASCII")
     
      byte[] nombre4 = nombre1.getBytes()
      String nombre = new String(nombre4,"US-ASCII")
      
      byte[] direccion4 = direccion1.getBytes()
      String direccion = new String(direccion4,"US-ASCII")
      
      new File("C:/pdf/${usuario}.pdf").withOutputStream { outputStream ->
        pdfRenderingService.render(controller:this, template:"pdfTemplate",model:[fecha:fecha, direccion:direccion,usuario:usuario, cod: cod, nombre:nombre, apellido:apellido], outputStream)
      }
      [direccion:direccion]
    }
  }

  def confirmCodDireccion(User userInstance){

  }

  def verifCodDireccion(int codigo){


    def user = springSecurityService.currentUser

    def cod1 = user.confirmCodeDir
    def cod2 = codigo
    if (cod1 == cod2){
      user.verifDir=true
      user.save flush:true
      redirect user
    }else{
      flash.message = "EL CODIGO QUE INGRESASTE ES INCORRECTO. INTENTA INGRESARLO NUEVAMENTE. Ante cualquier duda escribenos a easytogo.viajescompartidos@gmail.com"
      redirect user
    }

  }


}
