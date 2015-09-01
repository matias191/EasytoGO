package easytogo

class Modelo {
  String nombre
  String toString(){
    "${nombre}"
  }

  static hasOne = [marca: Marca]
  static hasMany = [vehiculos: Vehiculo]
  static constraints = {
  }
}
