defmodule Fb.MixProject do
  use Mix.Project

  def project do
    [
      app: :fb,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison],
      mod: {Fb.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.11.1"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0.1"}
    ]
  end
end
