defmodule EventPushing.MixProject do
  use Mix.Project

  def project do
    [
      app: :event_pushing,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :wx, :observer, :runtime_tools],
      mod: {EventPushing.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:gen_stage, "~> 1.0"}, {:uuid, "~> 1.1"}]
  end
end
