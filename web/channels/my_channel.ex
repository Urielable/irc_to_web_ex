defmodule IrcToWebEx.MyChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    IO.puts  "joined"
    {:ok, socket}
  end

  def handle_in("user:pinged", %{nick: _nick}, socket) do
    broadcast(socket, "response:event", %{message: "Echo"})
    {:ok, socket}
  end

  def handle_in("info", message, socket) do
    IO.puts "Got '#{message}'."
    {:ok, socket}
  end
end
