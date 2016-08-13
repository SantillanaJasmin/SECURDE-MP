function checkSubmit() {
  var message = "";
  var productName = $("#productName").val();
  var productDescription = $("#prouctDescription").val();
  var productPrice = $("#productPrice").val();
}
$(document).ready(function(){
  $('#nav-bar').addClass("sticky");

    $("#confirm-password-overlay").click(function(event){
      $("#confirm-password-overlay").fadeOut(500);
      $("#confirm-password-box").fadeOut(500);
     });
    $("#saveChanges").click(function(event){
      $("#confirm-password-overlay").show();
      $("#confirm-password-box").show();
    });
});
$(window).scroll(function() {
    $('#nav-bar').addClass("sticky");
});
$(".edit").on('click', function(event) {

});
