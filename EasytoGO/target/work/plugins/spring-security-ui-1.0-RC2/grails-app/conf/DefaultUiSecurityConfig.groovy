/* Copyright 2009-2013 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
security {

	ui {

		encodePassword = false

		register {
			emailBody = '''\
Hi $user.username,<br/>
<br/>
You (or someone pretending to be you) created an account with this email address.<br/>
<br/>
If you made the request, please click&nbsp;<a href="$url">here</a> to finish the registration.
'''
			emailFrom = 'do.not.reply@localhost'
			emailSubject = 'New Account'
			defaultRoleNames = ['ROLE_USER']
			postRegisterUrl = null // use defaultTargetUrl if not set
		}

		forgotPassword {
			emailBody = '''\
<h3>Hola $user.username,</h3><br/>
<br/>
Usted (o alguien que pretende ser Usted) solicito que la contrasenia sea reestablecida.<br/>
<br/>
Si Usted no hizo esta solicitud, por favor ignore este e-mail; no se ha hecho ningun cambio en su cuenta.<br/>
<br/>
Si Usted hizo esta solicitud, haga click <a href="$url">aqui</a> para reestablecer su contrasenia.
<h5>No respondas a este e-mail. Ante cualquier consulta escribenos a support@easytogo.com.ar</h5>
'''
      
			emailFrom = 'do.not.reply@localhost'
			emailSubject = 'Easy to GO - Reestablecer contrasenia'
			postResetUrl = null // use defaultTargetUrl if not set
		}
	}
}
