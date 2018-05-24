use Mix.Config

# Ecto
config :hot_api, HotApi.Repo,
  adapter: Ecto.Adapters.MySQL,
  database: "polycode_repo",
  username: "root",
  password: "root",
  hostname: "mysql"

# Mongo
config :mongodb,
  database: "hotsite",
  collection_default: "users",
  username: "hotsite",
  password: "DkUg*0TuRCTw",
  hostname: "ds233500.mlab.com:33500",
  pool: 20
