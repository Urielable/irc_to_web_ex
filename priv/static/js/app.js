$(function(){
  var socket     = new Phoenix.Socket("wss://" + location.host +  "/ws");
  var $status    = $("#status");
  var $messages  = $("#messages");
  var $input     = $("#message-input");
  var $username  = $("#username");
  var sanitize   = function(html){ return $("<div/>").text(html).html(); }

    var messageTemplate = function(message){
        console.log(message);
    var username = sanitize(message.nick || "anonymous");
    var response = sanitize(message.response);
    return("<p><a href='#'>[" + username + "]</a>&nbsp; " + response +"</p>");
  }

  socket.join("rooms:lobby", {}, function(chan){

    $input.off("keypress").on("keypress", function(e) {
      if (e.keyCode == 13) {
        chan.send("new:msg", {nick: $username.val(), response: $input.val()});
        $input.val("");
      }
    });

      chan.on("pong", function(message) {
          console.log("Got " + message + " while listening for event pong");
          $messages.append("<br/><i>[" + message.nick + " pinged via IRC, got: " + message.response + "]</i>");
      });
      

    chan.on("join", function(message){
      $status.text("joined");
    });

    chan.on("new:msg", function(message){
      $messages.append(messageTemplate(message));
      scrollTo(0, document.body.scrollHeight);
    });

    chan.on("user:entered", function(msg){
      var username = sanitize(msg.nick || "anonymous");
      $messages.append("<br/><i>[" + username + " entered]</i>");
    });
  });
});
