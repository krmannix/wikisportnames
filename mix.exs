defmodule Wikisportnames.MixProject do
  use Mix.Project

  def project do
    [
      app: :wikisportnames,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
    ]
  end

  def application do
    [
      extra_applications: [
        :logger,
        :httpoison,
      ]
    ]
  end

  defp description do
    """
    Generate list of sports terms from Wikipedia.
    Primary use of this list is input into another project of mine.
    """
  end

  defp deps do
    [
      {:floki, "~> 0.29.0"},
      {:httpoison, "~> 1.7"},
    ]
  end
end
