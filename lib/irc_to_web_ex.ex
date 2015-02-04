defmodule IrcToWebEx do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Chatty.add_hook :ping, &IrcToWebEx.Hooks.PingHook.run/2, in: :text, direct: true
    {:ok, self()}    

    children = [
      # Start the endpoint when the application starts
      worker(IrcToWebEx.Endpoint, []),

      # Here you could define other workers and supervisors as children
      # worker(IrcToWebEx.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IrcToWebEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IrcToWebEx.Endpoint.config_change(changed, removed)
    :ok
  end
end
