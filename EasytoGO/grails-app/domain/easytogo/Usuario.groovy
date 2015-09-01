package easytogo

class Usuario {
  String nombre
  String apellido
  String user
  String pass
  Date fecNac
  Date fecVencCarnet
  String direccion
  String mail
  String telefono
  int sexo
  String toString(){
    "${nombre}"
    "${apellido}"
  }

  static hasMany = [vehiculos: Vehiculo]

  static constraints = {
    nombre()
    apellido()
    fecNac()
    sexo()
    mail()
    telefono()
    direccion()
    fecVencCarnet()
    user()
    pass (password : true)
  }
}
