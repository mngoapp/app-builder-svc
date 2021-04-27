# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :mngoappbuilder, MngoAppBuilderWeb.Endpoint,

  url: [host: "localhost"],
  secret_key_base: "7uWNjnyXEUsD/jnwTjSXyFdM0eow+EYIAdDsufhD/cEfxMW/aztK6fEGgHAE+m3E",
  render_errors: [view: MngoAppBuilderWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MngoAppBuilder.PubSub,
  live_view: [signing_salt: "qKEM2UlV"]

# These are Settings as key/value in Ecto Setting table but they can be specified here
# for development purposes. Never store them here and then check in this code to source control
#config :sendgrid, api_key: ""
#config :slack, api_token: ""

config :mngoappbuilder, Builder.Repo,
  database: "mngo-builder",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

#config :friends, ecto_repos: [Friends.Repo]
  # OR use a URL to connect instead
  #url: "postgres://postgres:postgres@localhost/ecto_simple"

config :mngoappbuilder, ecto_repos: [Builder.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
