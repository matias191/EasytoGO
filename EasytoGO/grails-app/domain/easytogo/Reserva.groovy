package easytogo

class Reserva {

    static constraints = {
    }
    Viaje viajes
	User usuario
	String fecha_res
	int cant_plaz
	
	@Override
	String toString() {
	  "${viajes.conductor.nombre}"
	  "${usuario.nombre}"
	  
	}
	
}
