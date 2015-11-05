package easytogo

import java.util.Date;


class Viaje {
	static hasOne = [conductor: User]
    static hasMany = [preguntas: Pregunta]
	static constraints = {
		fecha_salida blank: false
		fecha_llegada blank: false
		plazas_disponibles blank: false
		costoplaza blank: false
    comentario (nullable: true)
	}
	String origen
	String destino
	Date fecha_salida
	Date fecha_llegada
	int plazas_disponibles
	float costoplaza
	boolean fumar
	String comentario
	int equipaje
	int mascota
	
	
	
}
