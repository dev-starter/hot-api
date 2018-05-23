use Mix.Config

import_config "#{Mix.env}.exs"

config :moip_flow,
        ecto_repos: [MoipFlow.Repo]

config :maru, MoipFlow.Base,
        http: [port: 3001]
