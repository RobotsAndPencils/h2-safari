use Mix.Config
config :sample, SampleWeb.Endpoint,
  https: [
    port: 4000,
    certfile: "../../../../priv/server.pem",
    keyfile: "../../../../priv/server.key"
  ],
  url: [scheme: "https", host: "sample.phx.sh", port: 4000],
  force_ssl: [hsts: true]

config :logger, level: :debug
