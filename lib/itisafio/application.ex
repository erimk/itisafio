defmodule Itisafio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ItisafioWeb.Telemetry,
      # Itisafio.Repo,
      # {DNSCluster, query: Application.get_env(:itisafio, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Itisafio.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Itisafio.Finch},
      # Start a worker by calling: Itisafio.Worker.start_link(arg)
      # {Itisafio.Worker, arg},
      # Start to serve requests, typically the last entry
      ItisafioWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Itisafio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ItisafioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
