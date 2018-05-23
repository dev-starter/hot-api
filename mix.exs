defmodule HotApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hot_api,
      version: "0.1.0",
      elixir: "~> 1.6.1",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: Coverex.Task]
    ]
  end

  def application do
    [
      extra_applications:
      (Mix.env == :dev && [:exsync] || []) ++ [
        :logger,
        :maru,
        :poison,
        :ecto,
        :poolboy,
        :mongodb,
        :cachex
      ],
      mod: {HotApi, []}
    ]
  end

  defp deps do
    [
      {:cors_plug, "~> 1.5"},
      {:maru, "~> 0.12.1"},
      {:ecto, "~> 2.1.6"},
      {:mongodb, "~> 0.4.3"},
      {:poolboy, "~> 1.5"},
      {:comeonin, "~> 4.0.0"},
      {:earmark, "~> 1.2.3"},
      {:cachex, "~> 2.1"},
      {:ex_doc, "~> 0.16.2", only: :dev, runtime: false},
      {:exsync, "~> 0.2.1", only: :dev},
      {:coverex, "~> 1.4", only: [:test, :dev]},
      {:credo, "~> 0.8.4", only: [:dev, :test]},
      {:mock, "~> 0.3.1", only: :test}
    ]
  end
end
