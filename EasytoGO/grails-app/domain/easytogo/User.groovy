package easytogo

import java.util.Date;
import groovy.time.*

/**
 * Dominio User
 * 
 * Contiene informacion de los Usuario del sistema
 * 
 * @author MatiMore
 */

class User implements Serializable {

  private static final long serialVersionUID = 1

  transient springSecurityService

  String nombre
  String apellido
  String username
  String password
  Date fecNac
  /** Opcional. Solo necesario cuando el usuario da de alta un viaje. */
  Date fecVencCarnet
  String direccion
  String email
  String telefono
  byte[] avatar
  String avatarType
  boolean verifTel = false
  boolean verifDir = false
  /** 
   * Código único generado para validar al usuario
   *  cuando se registra. Se envia el código incrustado en un link
   *  a su cuenta de correo para activar la cuenta.
   */
  String confirmCode
  int confirmCodeSMS
  int confirmCodeDir
  int sexo
  boolean enabled = true
  boolean accountExpired
  boolean accountLocked
  boolean passwordExpired
  boolean envioCarta = false
  

  /** 
   * Relación con la clase Vehiculo.groovy.
   * Un usuario puede tener muchos vehículos.
   * Utilizado para dar de alta un viaje.
   */
  static hasMany = [vehiculos: Vehiculo, viaje: Viaje, preguntas: Pregunta, respuestas: Respuesta]


  /**
   * Utilizadas para generar la base de datos y las vistas.
   * Indica el órden en que se generan los campos de la vista User,
   * si un atributo puede ser null en la BD y en la vista, y la unicidad
   * de los atributos.
   */
  static constraints = {
    nombre()
    apellido()
    fecNac(max:(use(TimeCategory){18.years.ago  as Date}))
    sexo()
    email(email: true)
    telefono()
    direccion(nullable: true)
    fecVencCarnet(nullable: true)
    username()
    password ()
    confirmCode(nullable: true)
    confirmCodeSMS(nullable:true)
    confirmCodeDir(nullable:true)
    username blank: false, unique: true
    password blank: false
    avatar(nullable:true, maxSize: 100000 /* 100K */)
    avatarType(nullable:true)
    envioCarta(nullable:true)
    
  }

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


  static mapping = { password column: '`password`' }
}
