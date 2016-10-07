# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :col_brows_backend,
  ecto_repos: [ColBrowsBackend.Repo]

# Configures the endpoint
config :col_brows_backend, ColBrowsBackend.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xwyqZZgs7aW5jMaell1X8JAEPvZxPScz3vDL377bDPqKGx/TPvhynn7iCjAlZyWw",
  render_errors: [view: ColBrowsBackend.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ColBrowsBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
