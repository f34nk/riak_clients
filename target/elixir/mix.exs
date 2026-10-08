defmodule OpenriakEx.MixProject do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim()

  def project do
    [
      app: :openriak_ex,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "OpenRiak HTTP client",
      name: "openriak_ex",
      source_url: "https://github.com/f34nk/riak_clients",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "openriak_ex",
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/f34nk/riak_clients"
      },
      files: ~w(lib mix.exs README.md LICENSE VERSION)
    ]
  end
end
