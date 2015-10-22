// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}



function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  autocomplete2 = new google.maps.places.Autocomplete(
      (document.getElementById('pac-input2')),
      {});

  autocomplete = new google.maps.places.Autocomplete(
      (document.getElementById('pac-input')),
      {});

  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  //autocomplete.addListener('place_changed, fillInAddress);
}

