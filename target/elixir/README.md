# openriak_ex

Elixir HTTP client for OpenRiak, generated from the OpenRiak Smithy model.

```elixir
def deps do
  [
    {:openriak_ex, "~> 0.1.3"}
  ]
end
```

```elixir
config = %{base_url: "http://127.0.0.1:8098"}
{:ok, _output} = OpenRiakClient.ping(config, %OpenRiakTypes.PingInput{})
```

Operation functions take a config map and a typed input struct. See `OpenRiakClient` and `OpenRiakTypes` for the full API.

Please checkout the [demos](https://github.com/f34nk/riak_clients/tree/first-draft/service).
