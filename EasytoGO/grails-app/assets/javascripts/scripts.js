$(function(){



});

//function initAutocomplete() {
  				//var map = new google.maps.Map(document.getElementById('map'), {
    			//center: {lat: -33.8688, lng: 151.2195},
   			 	//zoom: 13,
    			//mapTypeId: google.maps.MapTypeId.ROADMAP
  			//});
 			 // Create the searcherch box and link it to the UI element.  
//				var input = document.getElementById('pac-input')	;
//				var searchBox = new google.maps.places.SearchBox(input);
//				map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
 //}
//
// function initAutocomplete2() { 
 //// var input2 = document.getElementById('pac-input2')	;
 // var searchBox2 = new google.maps.places.SearchBox(input2);
 // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input2);

  // Bias the SearchBox results towards current map's viewport.
//  map.addListener('bounds_changed', function() {
 //   searchBox.setBounds(map.getBounds());
  //});
 	 	 

function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  autocomplete2 = new google.maps.places.Autocomplete(
      (document.getElementById('pac-input2')),
      {});

  autocomplete = new google.maps.places.Autocomplete(
      (document.getElementById('pac-input')),
      {});

  autocomplete3 = new google.maps.places.Autocomplete(
      (document.getElementById('pac-input3')),
      {});
  

  autocomplete4 = new google.maps.places.Autocomplete(
      (document.getElementById('pac-input4')),
      {});

  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  //autocomplete.addListener('place_changed', fillInAddress);
}

$('#FechaNac').datepicker({
     startView: 2,
      orientation: "bottom right",
      keyboardNavigation: false,
      forceParse: false,
      beforeShowDay: function (date){
                      if (date.getMonth() == (new Date()).getMonth())
                        switch (date.getDate()){
                          case 4:
                            return {
                              tooltip: 'Example tooltip',
                              classes: 'active'
                            };
                          case 8:
                            return false;
                          case 12:
                            return "green";
                      }
                }
  });

$(' .input-group.date').datepicker({
	format: "dd/mm/yyyy",
	language: "es",
    autoclose: true
});
