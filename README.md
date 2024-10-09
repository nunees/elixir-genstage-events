# EventPushing

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `event_pushing` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:event_pushing, "~> 0.1.0"}
  ]
end
```

## Running

Run the code in iex mode with
```bash
$ iex -S mix
```
Then Generate the events
```bash
iex(1)> EventPushing.Producer.generate_events
```         
