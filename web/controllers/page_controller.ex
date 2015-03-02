defmodule IrcToWebEx.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    {:ok, nick} = Application.fetch_env(:chatty, :nickname)
    conn
    |> assign(:nickname, nick)
    |> render "index.html"
  end

  def post(conn, params) do
    IrcToWebEx.Endpoint.broadcast "rooms:lobby", "new:msg", %{nick: "api", response: "booom"}    
    conn
    |> text "Success"
  end
end
