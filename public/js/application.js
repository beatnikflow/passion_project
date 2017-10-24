$(document).ready(function() {
  signUpButtonListener();
});

var signUpButtonListener = function () {
$(".register").on("click", function(event) {
  event.preventDefault()

  var target = $(this)
  var url = target.attr('href')

  var request = $.ajax({
    url: url
  })
    request.done(function (response) {
      // console.log(response)
      $(".register-container").html(response)
    })


})
}
