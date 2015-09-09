import easytogo.*
class BootStrap {

    def init = { servletContext ->
      /*def adminRol = Rol.findOrSaveWhere(authority: 'ROLE_ADMIN')
      def user = User.findOrSaveWhere(username: 'matias191', password: '1234')
      
      if (!user.authorities.contains(adminRol)){
        UserRol.create(user, adminRol, true)
      }*/
    }
    
    def destroy = {
    }
}
