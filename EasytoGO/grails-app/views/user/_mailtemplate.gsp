<div>
    <h1> Completa tu registro!</h1>
    <h3>Hola ${nombre }:</h3>

    <g:link absolute="true" controller="User" action="confirm" id="${code}">Haz click sobre este link para confirmar tu e-mail</g:link>

    <g:createLink absolute="true" controller="User" action="confirm" id="${code}"></g:createLink>
    
    <h5>No respondas a este e-mail. Ante cualquier consulta escríbenos a support@easytogo.com.ar</h5>
    
</div>
