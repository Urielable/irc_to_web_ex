defmodule IrcToWebEx.Endpoint do
  use Phoenix.Endpoint, otp_app: :irc_to_web_ex

  plug Plug.Static,
    at: "/", from: :irc_to_web_ex

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_irc_to_web_ex_key",
    signing_salt: "1fG/C5JM",
    encryption_salt: "z2x7VbpU"

  plug :router, IrcToWebEx.Router
end
