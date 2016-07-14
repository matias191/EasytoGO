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
    def mailService;

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reserva.list(params), model:[reservaInstanceCount: Reserva.count()]
    }

    def show(Reserva reservaInstance) {
        respond reservaInstance
    }
    
    def showReserva(Reserva reservaInstance) {
      
      reservaInstance.est = "PAGADO"
      reservaInstance.save flush:true
      
      def Reserva res = reservaInstance
      def Viaje viaj = reservaInstance.viajes
      def User conductor = viaj.conductor
      def Vehiculo vehiculo = Vehiculo.findByUser(conductor)
            
      
      
      def origen1 = viaj.origen
      def destino1 = viaj.destino
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
      def nombre1 = pasajero.nombre
      def apellido1 = pasajero.apellido
      def direccion1 = pasajero.direccion
      def mailpasajero = pasajero.email
      def celularPasajero = pasajero.telefono
      
      byte[] apellido4 = apellido1.getBytes()
      String apellido = new String(apellido4,"US-ASCII")
     
      byte[] nombre4 = nombre1.getBytes()
      String nombre = new String(nombre4,"US-ASCII")
      
      byte[] direccion4 = direccion1.getBytes()
      String direccion = new String(direccion4,"US-ASCII")
      
      byte[] origen4 = origen1.getBytes()
      String origen = new String(origen4,"US-ASCII")
      
      byte[] destino4 = destino1.getBytes()
      String destino = new String(destino4,"US-ASCII")
      
      
      //crea la factura
      new File("C:/Mati/${nombre}.pdf").withOutputStream { outputStream ->
        pdfRenderingService.render(controller:this, template:"pdfFacturaTemplate",model:[nombre:nombre,mailpasajero:mailpasajero, apellido:apellido, direccion:direccion, fechaRes:fechaRes,origen:origen, destino:destino, costoPlaza:costoPlaza, cantidad:cantidad, costoGestion: costoGestion], outputStream)
      }
      
      //MANDAR MAIL AL CONDUCTOR INFORMANDO SOBRE LA RESERVA
      mailService.sendMail {
        to mail
        subject "Easy To Go - Tienes una nueva reserva en tu viaje."
        html g.render(template:"reservaAconductor",model:[nombrePasajero:nombre, apellidoPasajero:apellido,idRese: idRese, fechaRes: fechaRes, origen: origen, destino: destino, fechaSalida: fechaSalida, fechaLlegada: fechaLlegada, costoPlaza: costoPlaza, cantidad:cantidad, marca:marca, modelo:modelo, mailPasajero:mailpasajero, celularPasajero:celularPasajero])
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

        //reservaInstance.delete flush:true
        def sql3 = """update Reserva reservaInstance
                   set reservaInstance.est = 'CANCELADO'
                    
                   where reservaInstance.id = '${reservaInstance.id}'""" 
      reservaInstance.executeUpdate(sql3)
      
       

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
    def userlog = springSecurityService.currentUser
    def Reserva res = reservaInstance
    def Viaje viaj = reservaInstance.viajes
    def idviaje = viaj.id
    
   
		if (reservaInstance == null) {
			notFound()
			return
		}

		if (reservaInstance.hasErrors()) {
			respond reservaInstance.errors, view:'create'
			return
		}
     
        if (viaj.conductor ==  userlog ){
          flash.message = "No puedes reservar una plaza en tu mismo viaje"
          redirect(uri: "/viaje/reservar/${idviaje}")
          return
        }
    
    
    
        reservaInstance.est = "IMPAGA"
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
              if (viajeInstance.plazas_disponibles == 0){
                sql = """update Viaje viajeInstance
                  set viajeInstance.estado = 'COMPLETO'
                   
                  where viajeInstance.id = '${params.viajes.id}'"""
               viajeInstance.executeUpdate(sql)}
               
               /* def sql4 = """update Reserva reservaInstance
                  set reservaInstance.est = 'PAGADO'
                   
                  where reservaInstance.id = '${reservaInstance.id}'"""
                reservaInstance.executeUpdate(sql4)*/
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
