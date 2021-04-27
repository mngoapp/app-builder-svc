defmodule MngoAppBuilder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
#
  use Application
  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      Builder.Repo,
      # Container GenServer - For managing Container items
      %{
        id: ContainerServer,
        start: {Container.Server, :start_link, [[name: :container_gen_server]]}
      },
      # Schema GenServer - For managing Schema items
      %{
        id: SchemaServer,
        start: {Schema.Server, :start_link, [[name: :schema_gen_server]]}
      },
      # REST API
      MngoAppBuilderWeb.Endpoint,
    ]
    opts = [strategy: :one_for_one, name: AppBuilderSvc.Supervisor]
    Supervisor.start_link(children, opts)
  end
  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MngoAppBuilderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
