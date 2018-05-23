defmodule HotApi do
  require Mongo
  import Application

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
        expiration: [default: :timer.minutes(1)]
      ]])
    ]

    opts = [strategy: :one_for_one, name: HotApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
