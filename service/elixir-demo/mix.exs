defmodule Demo.MixProject do
  use Mix.Project

  def project do
    [
      app: :riak_elixir_demo,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Demo.Application, []}
    ]
  end

  defp deps do
    [
      {:openriak_ex, path: openriak_ex_path()}
    ]
  end

  defp openriak_ex_path do
    System.get_env("OPENRIAK_EX_PATH") || "/deps/openriak_ex"
  end
end
