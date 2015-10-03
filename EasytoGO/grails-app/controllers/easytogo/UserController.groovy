package easytogo


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils;
import grails.plugin.springsecurity.SpringSecurityService;

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
  def springSecurityService 
  def mailService;

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
  
  /**
   * Muestra la lista de usuarios actuales.
   */
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
    respond userInstance
  }

  def create() {
    respond new User(params)
  }

  @Transactional
  def save(User userInstance) {

    userInstance.enabled=false;
    userInstance.confirmCode= UUID.randomUUID().toString()
    
    

    if (userInstance == null) {
      notFound()
      return
    }

    if (userInstance.hasErrors()) {
      respond userInstance.errors, view:'create'
      return
    }

    userInstance.save flush:true
     

      mailService.sendMail {
      to userInstance.mail
      subject "Easy To Go - Activacion de cuenta."
      html g.render(template:"mailtemplate",model:[code:userInstance.confirmCode,nombre:userInstance.nombre])
    }

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message',args: [message(code: 'user.label', default: 'User'), userInstance.id])
        flash.message = "probando mensaje"
        //redirect userInstance
        redirect(action: "success")
      }
      '*' { respond userInstance, [status: CREATED] }
    }
  }

  def success(){
    render(view:'success');
  }

  def confirm(String id) {

    User userInstance= User.findByConfirmCode(id)
    if(!userInstance) {
      return;
    }

    //userInstance.confirmCode= '';

    userInstance.enabled=true;
    if (!userInstance.save(flush: true)) {
      render(view: "result", model: [message: 'Hubo un problema al activar tu cuenta. Por favor envia un mail a support@easytogo.com.ar'])
      return
    }
    render(view: "result", model: [message: 'Su cuenta se ha activado correctamente!'])
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
        flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
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



    userInstance.delete flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
        redirect action:"index", method:"GET"
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
    
    String password = params.passwordActual
    String newPassword = params.password
    String newPassword2 = params.confirmaPassword
    
    
    
    userInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
        redirect userInstance
      }
      '*'{ respond userInstance, [status: OK] }
    }
  
  }
}
