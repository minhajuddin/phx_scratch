# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_scratch,
  ecto_repos: [PhxScratch.Repo]

# Configures the endpoint
config :phx_scratch, PhxScratch.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+pIkjLKmZIguk+x3ThhrHk0mso8qoM1YEt9NZIkrh7yLkGDJFJ5ZgnJ3GHuvoV30",
  render_errors: [view: PhxScratch.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxScratch.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
