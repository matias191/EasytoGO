package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Transactional(readOnly = true)
@Secured(['permitAll'])
class ViajeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Viaje.list(params), model:[viajeInstanceCount: Viaje.count()]
			
    }
	
	def buscaViaje(String origen1, String destino1){
		//[viajes: Viaje.findAll]
		def ViajeList = Viaje.createCriteria().list (params) {
			if ( params.query ) {
				ilike("origen", "%${params.query}%")
				ilike("destino", "%${params.query1}%") //"%${params.query}%")
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
			//	ilike("conductor", "%${params.query}%")
				//ilike("destino", "${sec.loggedInUserInfo(field:'id')}") //"%${params.query}%")
			//}
		//}
		//[viajes:Viaje.listOrderByorigen()]
		User usuario = User.findByUsername(sec.loggedInUserInfo(field:'username'))
		[viajes: Viaje.findAllByConductor(usuario), reserva: Reserva.findAllByUsuario(usuario)]
		
		//[reserva: Reserva.findAllByUsuario(usuario)]
		
	}
	
	def pasajeroViaje(int viajeid){
//		def params = sec.loggedInUserInfo(field:'id')
		Viaje viajes = Viaje.findById(viajeid)
		[reserva: Reserva.findAllByViajes(viajes)]
//		
	}

    def show(Viaje viajeInstance) {
        respond viajeInstance
    }
	
	

    def create() {
        respond new Viaje(params)
    }

    @Transactional
    def save(Viaje viajeInstance) {
        if (viajeInstance == null) {
            notFound()
            return
        }

        if (viajeInstance.hasErrors()) {
            respond viajeInstance.errors, view:'create'
            return
        }

        viajeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'viaje.label', default: 'Viaje'), viajeInstance.id])
                redirect viajeInstance
            }
            '*' { respond viajeInstance, [status: CREATED] }
        }
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
        respond viajeInstance
    }
   def reservar = {
	   visible = true
	   if (isCurrent)
		  visible = false
	   [disabled, disabled]
	   }
}


