# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dum,
  ecto_repos: [Dum.Repo]

# Configures the endpoint
config :dum, Dum.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bP7rAcjw+bhNqV/JrXYCCMKMHni+Pb0nCV2XD5aLyA4STw3WqJGpoTqTnsHWjryt",
  render_errors: [view: Dum.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dum.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
