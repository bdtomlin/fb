defmodule Fb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: Fb.Router,
        options: [port: 8085]
      )
      # Starts a worker by calling: Fb.Worker.start_link(arg)
      # {Fb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
