// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function ajax_request() {
  // Send name and city via ajax request. Replace any spaces with underscores
  input_name_val = document.getElementById('park_name').value.split(" ").join("_");
  input_city_val = document.getElementById('park_city').value.split(" ").join("_");
  // load_val = '/parks/refresh?input_name=' + input_val
  load_val = '/parks/refresh?input_name=' + input_name_val + '&input_city=' + input_city_val;
  $('.dynamic').load(load_val);
}

$(document).ready(
        function() {
          // Event handler for keyup events while typing name
          $("#park_name").keyup(function(event) {
            ajax_request();
          });
          // Event handler for keyup events while typing city
          $("#park_city").keyup(function(event) {
            ajax_request();
          });
        });
