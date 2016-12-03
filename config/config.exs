# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :onwipca,
  ecto_repos: [Onwipca.Repo]

# Configures the endpoint
config :onwipca, Onwipca.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bGpVl8TJkAcggeMugc6fIg28y7ovpLQ/O4xAoivmme2hVbhZnTl+6usWVLRPqb2I",
  render_errors: [view: Onwipca.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Onwipca.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :hound, driver: "chrome_driver"

config :openmaize_jwt,
  signing_key: 'sOfbGPh9szzBS4z6DGQW8uzQ5O409R8e6G27mXKD6i56XHxJG/Vs0Qhecg1s4TXD'

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
