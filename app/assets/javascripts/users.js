function privateMessageReply(element){
  var name = element.name;
  $("#sendPMFormHeading").text("Send Private Message to " + name);
  $("#chat_pm_receiver").val($.trim(name));
  $("#sendPM").modal('toggle');
}
