package easytogo

class Respuesta {
String resp
static hasOne = [user: User, pregunta: Pregunta]
    static constraints = {
      resp(nullable : true)
    }
}
