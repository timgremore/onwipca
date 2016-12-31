use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :onwipca, Onwipca.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :onwipca, Onwipca.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "onwipca_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :comeonin, :bcrypt_log_rounds, 4

import_config "config.secret.exs"
