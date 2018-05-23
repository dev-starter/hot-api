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
  database: "polycode",
  collection_default: "languages",
  username: "hot_api",
  password: "1YOHlJmFXRrVMJuy",
  hostname: "ds259855.mlab.com:59855",
  pool: 20
