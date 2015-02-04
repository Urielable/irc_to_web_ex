# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :irc_to_web_ex, IrcToWebEx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lPkfAntgbpKbRBaK370nsnjU/ydMOXYR8Pyd7WEg1kqe5pFujFojpON22B+DOUQg",
  debug_errors: false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :chatty, nickname: "matanga#{:random.uniform(1_000)}", channels: ["elixirmx"], logging_enabled: true
