use Mix.Config

# Configure your database
config :timesheetspa, Timesheetspa.Repo,
  username: "timesheetspa",
  password: "ahch2XeeneTh",
  database: "timesheetspa_prod",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timesheetspa, TimesheetspaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
