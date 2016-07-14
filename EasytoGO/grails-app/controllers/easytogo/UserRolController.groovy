package easytogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class UserRolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserRol.list(params), model:[userRolInstanceCount: UserRol.count()]
    }

    def show(UserRol userRolInstance) {
        respond userRolInstance
    }

    def create() {
        respond new UserRol(params)
    }

    @Transactional
    def save(UserRol userRolInstance) {
        if (userRolInstance == null) {
            notFound()
            return
        }

        if (userRolInstance.hasErrors()) {
            respond userRolInstance.errors, view:'create'
            return
        }

        userRolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userRol.label', default: 'UserRol'), userRolInstance.id])
                redirect action: "index", method: "GET"
               // redirect userRolInstance
            }
            '*' { respond userRolInstance, [status: CREATED] }
        }
    }

    def edit(UserRol userRolInstance) {
        respond userRolInstance
    }

    @Transactional
    def update(UserRol userRolInstance) {
        if (userRolInstance == null) {
            notFound()
            return
        }

        if (userRolInstance.hasErrors()) {
            respond userRolInstance.errors, view:'edit'
            return
        }

        userRolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserRol.label', default: 'UserRol'), userRolInstance.id])
                redirect userRolInstance
            }
            '*'{ respond userRolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserRol userRolInstance) {

        if (userRolInstance == null) {
            notFound()
            return
        }

        userRolInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserRol.label', default: 'UserRol'), userRolInstance.id])
                //redirect action:"index", method:"GET"
                redirect userRolInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRol.label', default: 'UserRol'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
