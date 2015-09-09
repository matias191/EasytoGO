package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ModeloController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Modelo.list(params), model:[modeloInstanceCount: Modelo.count()]
  }

  def show(Modelo modeloInstance) {
    respond modeloInstance
  }

  def create() {
    respond new Modelo(params)
  }

  @Transactional
  def save(Modelo modeloInstance) {
    if (modeloInstance == null) {
      notFound()
      return
    }

    if (modeloInstance.hasErrors()) {
      respond modeloInstance.errors, view:'create'
      return
    }

    modeloInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message', args: [
          message(code: 'modelo.label', default: 'Modelo'),
          modeloInstance.id
        ])
        redirect modeloInstance
      }
      '*' { respond modeloInstance, [status: CREATED] }
    }
  }

  def edit(Modelo modeloInstance) {
    respond modeloInstance
  }

  @Transactional
  def update(Modelo modeloInstance) {
    if (modeloInstance == null) {
      notFound()
      return
    }

    if (modeloInstance.hasErrors()) {
      respond modeloInstance.errors, view:'edit'
      return
    }

    modeloInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [
          message(code: 'Modelo.label', default: 'Modelo'),
          modeloInstance.id
        ])
        redirect modeloInstance
      }
      '*'{ respond modeloInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(Modelo modeloInstance) {

    if (modeloInstance == null) {
      notFound()
      return
    }

    modeloInstance.delete flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message', args: [
          message(code: 'Modelo.label', default: 'Modelo'),
          modeloInstance.id
        ])
        redirect action:"index", method:"GET"
      }
      '*'{ render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.not.found.message', args: [
          message(code: 'modelo.label', default: 'Modelo'),
          params.id
        ])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }
}
