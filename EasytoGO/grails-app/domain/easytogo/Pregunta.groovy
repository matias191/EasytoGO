package easytogo

class Pregunta {
  String duda
  Respuesta respuesta
  static hasOne = [viaje: Viaje, user: User]
    static constraints = {
      duda(nullable : true)
      respuesta(nullable:true)
      
    }
}
