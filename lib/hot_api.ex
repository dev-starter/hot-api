defmodule HotApi do
  require Mongo
  import Application
  import Cachex.Spec


  @moduledoc """
  # PolyCode API

  This application is a API for PolyCode Site

  ### Resources
  - Languages
    - Algorithms
    - Characteristics
    - Integrations
    - Synataxes
  """

  @doc """
  Start application supervisor

  children:
  Mongo like a worker

  the strategy is one for one, for each process down create a new process
  """
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Mongo, [[
        name: :mongo,
        database: get_env(:mongodb, :database),
        hostname: get_env(:mongodb, :hostname),
        username: get_env(:mongodb, :username),
        password: get_env(:mongodb, :password),
        pool: DBConnection.Poolboy
      ]]),
      worker(Cachex, [ :cache, [
        expiration: expiration(default: :timer.minutes(1)),
        limit: limit(size: 500, policy: Cachex.Policy.LRW, reclaim: 0.5)
      ]])
    ]

    opts = [strategy: :one_for_one, name: HotApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
