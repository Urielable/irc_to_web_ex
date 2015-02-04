defmodule IrcToWebEx.Mixfile do
  use Mix.Project

  def project do
    [app: :irc_to_web_ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {IrcToWebEx, []},
     applications: [:phoenix, :cowboy, :logger, :chatty]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.8.0"},
     {:chatty, github: "alco/chatty"},
     {:cowboy, "~> 1.0"}]
  end
end
