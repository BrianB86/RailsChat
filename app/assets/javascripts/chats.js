//The js file pretains to the chat room itself.

$(document).ready(function(){
  $(".list-group-item").click(function(){
    var name = $(this).text();
    $("#sendPMFormHeading").text("Send Private Message to " + name);
    $("#sendPM").modal('toggle');
  });
});
