package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['permitAll'])
class VehiculoController {
  
  private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Vehiculo.list(params), model:[vehiculoInstanceCount: Vehiculo.count()]
  }

  def show(Vehiculo vehiculoInstance) {
    respond vehiculoInstance
  }

  def create() {
    //def user = User.findById(params.user.id)
    respond new Vehiculo(params)/*,model:[usuarioInstance: user]*/
  }

  def form() {
  }

  def marcaChanged(long marcaId) {
    Marca marca = Marca.get(marcaId)
    def modelos = []
    if ( marca != null ) {
      modelos = Modelo.findAllByMarca(marca, [order:'name'])
    }
    render g.select(id:'modelo', name:'modelo.id',
    from:modelos, optionKey:'id', noSelection:[null:' ']
    )
  }


  @Transactional
  def save(Vehiculo vehiculoInstance) {
    if (vehiculoInstance == null) {
      notFound()
      return
    }

    if (vehiculoInstance.hasErrors()) {
      respond vehiculoInstance.errors, view:'create'
      return
    }

    vehiculoInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = "Vehiculo agregado correctamente"
        redirect vehiculoInstance
      }
     
    }
  }

  def edit(Vehiculo vehiculoInstance) {
    respond vehiculoInstance
  }

  @Transactional
  def update(Vehiculo vehiculoInstance) {
    if (vehiculoInstance == null) {
      notFound()
      return
    }

    if (vehiculoInstance.hasErrors()) {
      respond vehiculoInstance.errors, view:'edit'
      return
    }

    vehiculoInstance.save flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [
          message(code: 'Vehiculo.label', default: 'Vehiculo'),
          vehiculoInstance.id
        ])
        redirect vehiculoInstance
      }
      '*'{ respond vehiculoInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(Vehiculo vehiculoInstance) {

    if (vehiculoInstance == null) {
      notFound()
      return
    }

    vehiculoInstance.delete flush:true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message', args: [
          message(code: 'Vehiculo.label', default: 'Vehiculo'),
          vehiculoInstance.id
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
          message(code: 'vehiculo.label', default: 'Vehiculo'),
          params.id
        ])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }
  
  def upload_avatar(Vehiculo vehiculoInstance) {
    def vehiculo = vehiculoInstance // or however you select the current user
  
    // Get the avatar file from the multi-part request
    def f = request.getFile('avatar')
  
    // List of OK mime-types
    if (!okcontents.contains(f.getContentType())) {
      flash.message = "Avatar must be one of: ${okcontents}"
      render(view:'select_avatar', model:[vehiculo:vehiculo])
      return
    }
  
    // Save the image and mime type
    vehiculo.avatar = f.bytes
    vehiculo.avatarType = f.contentType
    vehiculo.save flush:true
    log.info("File uploaded: $vehiculo.avatarType")
  
    // Validation works, will check if the image is too big
    if (!vehiculo.save()) {
      render(view:'select_avatar', model:[vehiculo:vehiculo])
      return
    }
    
    //flash.message = "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
    flash.message = "Foto actualizada correctamente."
    redirect vehiculo
  }
  
  def avatar_image() {
    def avatarVehiculo = Vehiculo.get(params.id)
    if (!avatarVehiculo || !avatarVehiculo.avatar || !avatarVehiculo.avatarType) {
      response.sendError(404)
      return
    }
    response.contentType = avatarVehiculo.avatarType
    response.contentLength = avatarVehiculo.avatar.size()
    OutputStream out = response.outputStream
    out.write(avatarVehiculo.avatar)
    out.close()
  }
  
}











