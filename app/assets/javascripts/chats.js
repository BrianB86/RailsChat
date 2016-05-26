//The js file pretains to the chat room itself.

function privateMessage(element){
  var name = element.textContent
  $("#sendPMFormHeading").text("Send Private Message to " + name);
  $("#chat_pm_receiver").val($.trim(name));
  $("#sendPM").modal('toggle');
}
