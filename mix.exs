defmodule HotApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hot_api,
      version: "0.1.0",
      elixir: "~> 1.6.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: Coverex.Task]
    ]
  end

  def application do
    [
      extra_applications:
      (Mix.env == :dev && [:exsync] || []) ++ [
        :cachex,
        :logger,
        :cowboy,
        :maru,
        :poison,
        :poolboy,
        :mongodb
      ],
      mod: {HotApi, []}
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.0"},
      {:cowboy, "~> 2.3"},
      {:confex, "~> 3.3"},
      {:maru, "~> 0.13"},
      {:cors_plug, "~> 1.5"},
      {:mongodb, "~> 0.4"},
      {:poolboy, "~> 1.5"},
      {:comeonin, "~> 4.1"},
      {:earmark, "~> 1.2"},
      {:cachex, "~> 3.0"},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:exsync, "~> 0.2", only: :dev},
      {:coverex, "~> 1.4", only: [:test, :dev]},
      {:credo, "~> 0.9", only: [:dev, :test]},
      {:mock, "~> 0.3", only: :test}
    ]
  end
end
