package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RespuestaController {
def springSecurityService
def mailService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Respuesta.list(params), model:[respuestaInstanceCount: Respuesta.count()]
    }

    def show(Respuesta respuestaInstance) {
        respond respuestaInstance
    }

    def create() {
      def User user = springSecurityService.currentUser
      //Viaje viaje = Viaje.findByUser(user)
     // Pregunta[] preg = Pregunta.findByUser(user)
      [user:user]
      
       // respond new Respuesta(params)
    }

    @Transactional
    def save(Respuesta respuestaInstance) {
      def User user = springSecurityService.currentUser
      respuestaInstance.pregunta.user.email
      
     
      //Pregunta[] preg = Pregunta.findByUser(user)
      
        if (respuestaInstance == null) {
            notFound()
            return
        }

        if (respuestaInstance.hasErrors()) {
            respond respuestaInstance.errors, view:'create'
            return
        }
        
        //MANDAR MAIL AL PASAJERO INFORMANDO QUE LE RESPONDIERON
        mailService.sendMail {
          to respuestaInstance.pregunta.user.email
          subject "Easy To Go - Respondieron tu pregunta."
          html g.render(template:"respondieron",model:[nombre:respuestaInstance.pregunta.user.nombre, apellido: respuestaInstance.pregunta.user.apellido, pregunta: respuestaInstance.pregunta.duda, respuesta: respuestaInstance.resp])
        }

        respuestaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), respuestaInstance.id])
               // redirect respuestaInstance
                //render(view:'show', model: [respuestaInstance: respuestaInstance, user: user])  ;
                redirect(uri:'/')
            }
           // '*' { render(view:'show', model: [respuestaInstance: respuestaInstance, user: user])  }
            //respond respuestaInstance, [status: CREATED]
            redirect(uri:'/')
        }
    }

    def edit(Respuesta respuestaInstance) {
        respond respuestaInstance
    }

    @Transactional
    def update(Respuesta respuestaInstance) {
        if (respuestaInstance == null) {
            notFound()
            return
        }

        if (respuestaInstance.hasErrors()) {
            respond respuestaInstance.errors, view:'edit'
            return
        }

        respuestaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Respuesta.label', default: 'Respuesta'), respuestaInstance.id])
                redirect respuestaInstance
            }
            '*'{ respond respuestaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Respuesta respuestaInstance) {

        if (respuestaInstance == null) {
            notFound()
            return
        }

        respuestaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Respuesta.label', default: 'Respuesta'), respuestaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
