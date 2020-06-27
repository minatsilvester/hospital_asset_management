// The javascript controller for hospital route
// Place js and jquery related to hospital here

$(document).ready(function() {
  // function to send value of hospital-country field to HospitalsController
  $("#hospital-country").on('change', function(){
    // getting the value
    //making a ajax request to route hospital#populate_state_list
    $.ajax({
      url: "populate_state_list",
      type: "GET",
      data: {country: $(this).val()},
      // on success callback
      success: function(data) {
        console.log(data)
        $("#hospital-state").children().remove();
        var listitems = [];
        //convert key, value objects into list to append to html
        $.each(data, function(key, value){
          // listitems += "<option value=" + value + " key=" + key + ">" + value + "</option>"
          listitems += '<option value="' + key+ '">' + value + '</option>';
        })
        // console.log(listitems)
        $("#hospital-state").append(listitems)
      }
    })
  })
  // function to send value of hospital-state field to HospitalsController
  $("#hospital-state").on('change', function(){
    console.log("id function")
    // getting the value
    //making a ajax request to route hospital#populate_city_list
    $.ajax({
      url: "populate_city_list",
      type: "GET",
      data: {state: $(this).val(), country: $("#hospital-country").val()},
      // on success callback
      success: function(data) {
        console.log(data)
        $("#hospital-city").children().remove();
        var listitems = [];
        //convert key, value objects into list to append to html
        $.each(data, function(key, value){
          listitems += '<option value="' + value+ '">' + value + '</option>';
        })
        // console.log(listitems)
        $("#hospital-city").append(listitems)
      }
    })
  })
})
