defmodule IrcToWebEx.MyChannel do
  use Phoenix.Channel
  require Logger

  def join("rooms:lobby", _message, socket) do
    IO.puts  "joined"
    {:ok, socket}
  end

  def handle_in("user:pinged", %{nick: _nick}, socket) do
    broadcast!(socket, "response:event", %{message: "Echo"})
    {:ok, socket}
  end

  def handle_in("info", message, socket) do
    IO.puts "Got '#{message}'."
    {:ok, socket}
  end


  def leave(reason, socket) do
    Logger.error inspect(reason)
    {:ok, socket}
  end

  def handle_in("new:msg", message, socket) do
    broadcast! socket, "new:msg", message
    {:ok, socket}
  end

  def handle_out(event, message, socket) do
    out_message = case message do 
                    %{nick: "edmz"} -> %{ message | response: message.response <> " *buh*"}
                      _ -> message
                  end
    
    reply socket, event, out_message
    
    {:ok, socket}
  end
  
end
