// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  var path = window.location.pathname;
  if(path.indexOf("users") >= 0){
    $("#newUser").click();
  }
});
