package easytogo

class Reserva {
	
	

    static constraints = {
		est (nullable: true)
    }
    Viaje viajes
	User usuario
	String fecha_res
	int cant_plaz
	boolean estado
	String est
	
	@Override
	String toString() {
	  "${viajes.origen}"
	  "${viajes.conductor.nombre}"
	  "${usuario.nombre}"
	  "${est}"
	  
	}
	
}
