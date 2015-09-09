package easytogo

import java.util.Date;

class User implements Serializable {

  private static final long serialVersionUID = 1

  transient springSecurityService

  String nombre
  String apellido
  String username
  String password
  Date fecNac
  Date fecVencCarnet
  String direccion
  String mail
  String telefono
  int sexo
  boolean enabled = true
  boolean accountExpired
  boolean accountLocked
  boolean passwordExpired

  static hasMany = [vehiculos: Vehiculo]




  User(String username, String password) {
    this()
    this.username = username
    this.password = password
  }

  @Override
  int hashCode() {
    username?.hashCode() ?: 0
  }

  @Override
  boolean equals(other) {
    is(other) || (other instanceof User && other.username == username)
  }

  @Override
  String toString() {
    "${nombre}"
    "${apellido}"
    username
  }

  Set<Rol> getAuthorities() {
    UserRol.findAllByUser(this)*.rol
  }

  def beforeInsert() {
    encodePassword()
  }

  def beforeUpdate() {
    if (isDirty('password')) {
      encodePassword()
    }
  }

  protected void encodePassword() {
    password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
  }

  static transients = ['springSecurityService']

  static constraints = {
    nombre()
    apellido()
    fecNac()
    sexo()
    mail()
    telefono()
    direccion()
    fecVencCarnet()
    username()
    password ()
    username blank: false, unique: true
    password blank: false
  }

  static mapping = { password column: '`password`' }
}
