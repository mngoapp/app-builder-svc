defmodule MngoAppBuilderWeb.Router do
  use MngoAppBuilderWeb, :router

  # API
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MngoAppBuilderWeb do
    pipe_through :api
    post "/setup", SetupController, :setup

    get "/containers", ContainerController, :get_all
    get "/containers/:key", ContainerController, :get
    post "/containers", ContainerController, :save
    put "/containers/:key", ContainerController, :update
    delete "/containers/:key", ContainerController, :delete

    get "/schemas", SchemaController, :get_all
    get "/schemas/:key", SchemaController, :get
    post "/schemas", SchemaController, :save
    put "/schemas/:key", SchemaController, :update
    delete "/schemas/:key", SchemaController, :delete
  end

  # Handle Pages
  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", MngoAppBuilderWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: MngoAppBuilderWeb.Telemetry
    end
  end
end
