package easytogo

/**
 * Clase Modelo
 *
 * Contiene informacion sobre el Modelo de un Vehiculo
 * 
 *
 * @author MatiMore
 */

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
