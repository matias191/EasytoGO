package easytogo

class Reserva {

    static constraints = {
    }
    Viaje viajes
	User usuario
	String fecha_res
	int cant_plaz
	boolean estado
	
	@Override
	String toString() {
	  "${viajes.conductor.nombre}"
	  "${usuario.nombre}"
	  
	}
	
}
