// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(
        function() {
          $("#park_name").keyup(function(event) {
            console.log(event);
            console.log(event.key);
            console.log()
            input_val = document.getElementById('park_name').value
            load_val = '/parks/refresh?input=' + input_val
            $('.dynamic').load(load_val);
          });
        });
