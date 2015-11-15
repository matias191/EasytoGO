package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService;
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils;



@Secured(['permitAll'])
@Transactional(readOnly = true)
class ReservaController {
  def springSecurityService
    def pdfRenderingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reserva.list(params), model:[reservaInstanceCount: Reserva.count()]
    }

    def show(Reserva reservaInstance) {
        respond reservaInstance
    }
    
    def showReserva(Reserva reservaInstance) {
      
      def Reserva res = reservaInstance
      def Viaje viaj = reservaInstance.viajes
      def User conductor = viaj.conductor
      def Vehiculo vehiculo = Vehiculo.findByUser(conductor)
            
      
      
      def origen = viaj.origen
      def destino = viaj.destino
      def fechaSalida = viaj.fecha_salida
      def fechaLlegada = viaj.fecha_llegada
      def costoPlaza = viaj.costoplaza
      def costoGestion = viaj.costoplaza*0.1
      
      def idRese = res.id      
      def cantidad = res.cant_plaz
      def fechaRes = res.fecha_res
      
      def nombreConductor = conductor.nombre
      def apellidoConductor = conductor.apellido
      def celular = conductor.telefono
      def mail = conductor.email
      def foto = conductor.avatar
      
      def modelo = vehiculo.modelo.nombre
      def marca = vehiculo.modelo.marca.nombre
      
      def User pasajero = res.usuario
      def nombre = pasajero.nombre
      def apellido = pasajero.apellido
      def direccion = pasajero.direccion
      def mailpasajero = pasajero.email
      
      
      new File("C:/Mati/${nombre}.pdf").withOutputStream { outputStream ->
        pdfRenderingService.render(controller:this, template:"pdfFacturaTemplate",model:[nombre:nombre,mailpasajero:mailpasajero, apellido:apellido, direccion:direccion, fechaRes:fechaRes,origen:origen, destino:destino, costoPlaza:costoPlaza, cantidad:cantidad, costoGestion: costoGestion], outputStream)
      }
      
      /*def args = [template:"pdfFacturaTemplate",  filename: "yourTitle", model:[nombre:nombre, apellido:apellido, direccion:direccion, fechaRes:fechaRes,origen:origen, destino:destino, costoPlaza:costoPlaza, cantidad:cantidad, costoGestion: costoGestion]]
      pdfRenderingService.render(args+[controller:this],response)*/
      
      
     // def user = springSecurityService.currentUser      
      //Reserva reservaInstance = Reserva.findByUsuario(user)
      render(view:'showReserva', model: [reservaInstance: reservaInstance, origen: origen, destino: destino, fechaSalida: fechaSalida, fechaLlegada: fechaLlegada, costoPlaza: costoPlaza, costoGestion: costoGestion, idRese: idRese, cantidad: cantidad, nombreConductor: nombreConductor, apellidoConductor: apellidoConductor, celular: celular, mail: mail, foto: foto, modelo: modelo, marca: marca, fechaRes: fechaRes]);
      
//      respond reservaInstance
  }

    def create() {
        respond new Reserva(params)
    }

    @Transactional
    def save(Reserva reservaInstance) {
        if (reservaInstance == null) {
            notFound()
            return
        }

        if (reservaInstance.hasErrors()) {
            respond reservaInstance.errors, view:'create'
            return
        }

        reservaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reservaInstance.id])
                redirect reservaInstance
            }
            '*' { respond reservaInstance, [status: CREATED] }
        }
    }

    def edit(Reserva reservaInstance) {
        respond reservaInstance
    }

    @Transactional
    def update(Reserva reservaInstance) {
        if (reservaInstance == null) {
            notFound()
            return
        }

        if (reservaInstance.hasErrors()) {
            respond reservaInstance.errors, view:'edit'
            return
        }

        reservaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reserva.label', default: 'Reserva'), reservaInstance.id])
                redirect reservaInstance
            }
            '*'{ respond reservaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reserva reservaInstance) {

        if (reservaInstance == null) {
            notFound()
            return
        }

        reservaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Has eliminado tu reserva correctamente"
                //redirect action:"index", method:"GET"
               
                render(view:'misReservas')
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Transactional
	def save_reserva(Reserva reservaInstance, Viaje viajeInstance) {
    
    def Reserva res = reservaInstance
    def Viaje viaj = reservaInstance.viajes
    
   
		if (reservaInstance == null) {
			notFound()
			return
		}

		if (reservaInstance.hasErrors()) {
			respond reservaInstance.errors, view:'create'
			return
		}

		reservaInstance.save flush:true
        def idRese = res.id
        def precio = viaj.costoplaza*0.1
        def descripcion = "Viaje con origen en " + viaj.origen + " y destino en " + viaj.destino + ". Cantidad de plazas a pagar: " + res.cant_plaz
        
        def cantidad = res.cant_plaz
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reservaInstance.id])
				//redirect reservaInstance
			}
			
          render(view:'show', model: [reservaInstance: reservaInstance, precio: precio, descripcion: descripcion, cantidad: cantidad, idRese: idRese])  ;
		}
		
		//def resultado = '${params.plazas_disponibles}'-'${params.cant_plaz}'		
		def sql = """update Viaje viajeInstance
                   set viajeInstance.plazas_disponibles = '${params.plazas_disponibles}'
                    
                   where viajeInstance.id = '${params.viajes.id}'""" 
              viajeInstance.executeUpdate(sql)
       render(view:'show', model: [reservaInstance: reservaInstance, precio: precio,  descripcion: descripcion, cantidad: cantidad, idRese: idRese])  ;
		
	}
  
  def misReservas(){
    
    User cond = User.findById(sec.loggedInUserInfo(field:'id'))
    [mreserva: Reserva.findAllByUsuario(cond)]
}

  def show_old(Reserva reservaInstance) {
    respond reservaInstance
}
}
