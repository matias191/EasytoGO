package easytogo

class Vehiculo {
  String color
  int anio
  Boolean seguro
  int combustible
  byte[] avatar
  String avatarType

  static hasOne = [modelo: Modelo, user: User]



  static constraints = {
    avatar(nullable:true, maxSize: 100000 /* 100K */)
    avatarType(nullable:true)
  }
}
