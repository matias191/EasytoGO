package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class MarcaController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Marca.list(params), model:[marcaInstanceCount: Marca.count()]
  }

  def show(Marca marcaInstance) {
    respond marcaInstance
  }

  def create() {
    respond new Marca(params)
  }

  @Transactional
  def save(Marca marcaInstance) {
    if (marcaInstance == null) {
      notFound()
      return
    }

    if (marcaInstance.hasErrors()) {
      respond marcaInstance.errors, view:'create'
      return
    }

    marcaInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message', args: [
          message(code: 'marca.label', default: 'Marca'),
          marcaInstance.id
        ])
        redirect marcaInstance
      }
      '*' { respond marcaInstance, [status: CREATED] }
    }
  }

  def edit(Marca marcaInstance) {
    respond marcaInstance
  }

  @Transactional
  def update(Marca marcaInstance) {
    if (marcaInstance == null) {
      notFound()
      return
    }

    if (marcaInstance.hasErrors()) {
      respond marcaInstance.errors, view:'edit'
      return
    }

    marcaInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [
          message(code: 'Marca.label', default: 'Marca'),
          marcaInstance.id
        ])
        redirect marcaInstance
      }
      '*'{ respond marcaInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(Marca marcaInstance) {

    if (marcaInstance == null) {
      notFound()
      return
    }

    marcaInstance.delete flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message', args: [
          message(code: 'Marca.label', default: 'Marca'),
          marcaInstance.id
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
          message(code: 'marca.label', default: 'Marca'),
          params.id
        ])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }
}
