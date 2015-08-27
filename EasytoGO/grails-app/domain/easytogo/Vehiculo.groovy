package easytogo

class Vehiculo {
String color
int anio
Boolean seguro
int combustible

static hasOne = [modelo: Modelo, usuario: Usuario]

    static constraints = {
    }
}
