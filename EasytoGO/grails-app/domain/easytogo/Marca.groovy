package easytogo

class Marca {
  String nombre
  String toString(){
    "${nombre}"
  }
  static hasMany = [modelos: Modelo]
  static constraints = {
  }
}
