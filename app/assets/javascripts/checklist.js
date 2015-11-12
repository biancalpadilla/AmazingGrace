function checkInit() {
  $("#question1, #question2, #question3, #question4").change(function () {
    if($("#question1").is(':checked') && $("#question2").is(':checked') &&
      $("#question3").is(':checked') && $("#question4").is(':checked')) {
      console.log("This is true");
      $('.next_button').attr('disabled', false);
    } else {
      $('.next_button').attr('disabled', true);
    }
  });
}

$(document).ready(function () {
    checkInit();
  });
$(document).on('page:load', checkInit);
