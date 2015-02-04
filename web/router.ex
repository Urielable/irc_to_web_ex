defmodule IrcToWebEx.Router do
  use Phoenix.Router
  
  
  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", IrcToWebEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", IrcToWebEx do
  #   pipe_through :api
  # end

  socket "/ws", IrcToWebEx do
    channel "rooms:*", MyChannel
  end
end
