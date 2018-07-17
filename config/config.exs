use Mix.Config

import_config "#{Mix.env}.exs"

config :maru, HotApi.Base,
        http: [port: 3001]
