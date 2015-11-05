package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PreguntaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pregunta.list(params), model:[preguntaInstanceCount: Pregunta.count()]
    }

    def show(Pregunta preguntaInstance) {
      
      //render(controller: 'viaje', view:'reservar');
        //respond preguntaInstance
    }

    def create() {
      
       respond new Pregunta(params)
    }

    @Transactional
    def save(Pregunta preguntaInstance) {
        if (preguntaInstance == null) {
            notFound()
            return
        }

        if (preguntaInstance.hasErrors()) {
            respond preguntaInstance.errors, view:'create'
            return
        }

        preguntaInstance.save flush:true
        def idViaje = preguntaInstance.viaje.id

        request.withFormat {
            form multipartForm {
                flash.message = "Tu pregunta ha sido generada"
                //redirect preguntaInstance
             //  render(view:'/viaje/reservar', model: [idViaje: idViaje]);
              // redirect(controller:"viaje",action:"reservar", model: [idViaje: idViaje])
               redirect(uri: "/viaje/reservar/${idViaje}")
            }
            '*' redirect(uri: "/viaje/reservar/${idViaje}")
              //{respond preguntaInstance, [status: CREATED] }
        }
    }

    def edit(Pregunta preguntaInstance) {
        respond preguntaInstance
    }

    @Transactional
    def update(Pregunta preguntaInstance) {
        if (preguntaInstance == null) {
            notFound()
            return
        }

        if (preguntaInstance.hasErrors()) {
            respond preguntaInstance.errors, view:'edit'
            return
        }

        preguntaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pregunta.label', default: 'Pregunta'), preguntaInstance.id])
                redirect preguntaInstance
            }
            '*'{ respond preguntaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pregunta preguntaInstance) {

        if (preguntaInstance == null) {
            notFound()
            return
        }

        preguntaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pregunta.label', default: 'Pregunta'), preguntaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
