defmodule Authium.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Authium.Repo,
      # Start the Telemetry supervisor
      AuthiumWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Authium.PubSub},
      # Start the Endpoint (http/https)
      AuthiumWeb.Endpoint
      # Start a worker by calling: Authium.Worker.start_link(arg)
      # {Authium.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Authium.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AuthiumWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
