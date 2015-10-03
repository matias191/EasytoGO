package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['permitAll'])
class EquipajeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Equipaje.list(params), model:[equipajeInstanceCount: Equipaje.count()]
    }

    def show(Equipaje equipajeInstance) {
        respond equipajeInstance
    }

    def create() {
        respond new Equipaje(params)
    }

    @Transactional
    def save(Equipaje equipajeInstance) {
        if (equipajeInstance == null) {
            notFound()
            return
        }

        if (equipajeInstance.hasErrors()) {
            respond equipajeInstance.errors, view:'create'
            return
        }

        equipajeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipaje.label', default: 'Equipaje'), equipajeInstance.id])
                redirect equipajeInstance
            }
            '*' { respond equipajeInstance, [status: CREATED] }
        }
    }

    def edit(Equipaje equipajeInstance) {
        respond equipajeInstance
    }

    @Transactional
    def update(Equipaje equipajeInstance) {
        if (equipajeInstance == null) {
            notFound()
            return
        }

        if (equipajeInstance.hasErrors()) {
            respond equipajeInstance.errors, view:'edit'
            return
        }

        equipajeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Equipaje.label', default: 'Equipaje'), equipajeInstance.id])
                redirect equipajeInstance
            }
            '*'{ respond equipajeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Equipaje equipajeInstance) {

        if (equipajeInstance == null) {
            notFound()
            return
        }

        equipajeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Equipaje.label', default: 'Equipaje'), equipajeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipaje.label', default: 'Equipaje'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
