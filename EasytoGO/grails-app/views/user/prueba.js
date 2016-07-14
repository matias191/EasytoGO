/**
 * 
 */
jQuery(document).ready(function(){

	// Nombre solo en con caracteres de nombre
  // http://stackoverflow.com/questions/2385701/regular-expression-for-first-and-last-name
	jQuery.validator.addMethod(
    "name_regex",
    function(value, element) {
      var re = new RegExp("^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$");
      return this.optional(element) || re.test(value);
    },
    "No es un nombre válido"
	);
	
  // Password sin $ y otras cosas fantasmas
	// http://code.tutsplus.com/tutorials/8-regular-expressions-you-should-know--net-6149
  jQuery.validator.addMethod(
    "password_regex",
    function(value, element) {
      var re = new RegExp("^[a-z0-9_-]{6,18}");
      return this.optional(element) || re.test(value);
    },
    "No es una contraseña válida"
	);
  
  // Ya estamos validando
  
  jQuery('#matiform').validate({
  	// Cambiar cuando termines de testear
    debug: true,
    // CSS
   // validClass: "success",
   // errorClass: "error",
    // Reglas de validacion 
    rules: 
      password: {
      	required : true,
        password_regex: true
      }
    },
    // Si queres podes descomentar esto y no aparecen mas los messages
    //errorPlacement: function(errorMap, errorList) {},
    
  });
});