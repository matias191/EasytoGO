package easytogo

import java.util.Date;


class Viaje {
	static hasOne = [conductor: User]
    static hasMany = [preguntas: Pregunta]
	static constraints = {
    //fecha_salida validator: {min: new Date()?: 'default.invalid.validator.fechasalidaminima'}
    
    
    fecha_llegada(validator: { val, obj ->
      val?.after(obj.fecha_salida)?: 'default.invalid.validator.fechallegada' 
  })
    
		fecha_salida blank: false
		fecha_llegada blank: false
		plazas_disponibles blank: false
		costoplaza blank: false
    comentario (nullable: true)
    estado (nullable: true)
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
  String estado
	
  String toString(){
    "${origen}"
    //
    "${destino}"
    
}
	
}
