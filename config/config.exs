use Mix.Config

import_config "#{Mix.env}.exs"

config :hot_api,
        ecto_repos: [HotApi.Repo]

config :maru, HotApi.Base,
        http: [port: 3001]
