defmodule Package404.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Package404.Repo,
      # Start the Telemetry supervisor
      Package404Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Package404.PubSub},
      # Start the Endpoint (http/https)
      Package404Web.Endpoint
      # Start a worker by calling: Package404.Worker.start_link(arg)
      # {Package404.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Package404.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Package404Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
