# openriak_ex

Elixir HTTP client for [OpenRiak](https://github.com/OpenRiak), generated from the [OpenRiak Smithy model](https://github.com/f34nk/riak_clients) using [smithy-beam](https://github.com/f34nk/smithy-beam).

```elixir
def deps do
  [
    {:openriak_ex, "~> 0.1.7"}
  ]
end
```

```elixir
config = %{base_url: "http://127.0.0.1:8098"}
body = ~s({"message":"hello"})

# Default bucket path: /buckets/{bucket}/keys/{key}
{:ok, _} =
  OpenRiakClient.put_default_object(config, %OpenRiakTypes.PutDefaultObjectOperationInput{
    bucket: "demo",
    key: "hello",
    content_type: "application/json",
    w: "1",
    dw: "1",
    body: body
  })

{:ok, %{body: default_body}} =
  OpenRiakClient.get_default_object(config, %OpenRiakTypes.GetDefaultObjectOperationInput{
    bucket: "demo",
    key: "hello"
  })

# Typed bucket path: /types/{bucketType}/buckets/{bucket}/keys/{key}
{:ok, _} =
  OpenRiakClient.put_object(config, %OpenRiakTypes.PutObjectOperationInput{
    bucket_type: "default",
    bucket: "demo",
    key: "hello-typed",
    content_type: "application/json",
    w: "1",
    dw: "1",
    body: body
  })

{:ok, %{body: typed_body}} =
  OpenRiakClient.get_object(config, %OpenRiakTypes.GetObjectInput{
    bucket_type: "default",
    bucket: "demo",
    key: "hello-typed"
  })
```

Operation functions take a config map and a typed input struct. See `OpenRiakClient` and `OpenRiakTypes` for the full API.

## Custom HTTP client

By default the client sends HTTP through `RuntimeHttpClient.Req`. Override the adapter by setting `http_client` on the config map passed into operations.

Implement `@behaviour RuntimeHttpClient`. The request is a `%RuntimeHttpClient.Request{}` (`method`, `url`, `headers`, `body`). Return `{:ok, %RuntimeTypes.HttpResponse{}}` or `{:error, reason}`.

```elixir
defmodule MyHttpClient do
  @behaviour RuntimeHttpClient

  alias RuntimeHttpClient.Request
  alias RuntimeTypes.HttpResponse

  @impl RuntimeHttpClient
  def request(%Request{method: method, url: url, headers: headers, body: body}) do
    # call your HTTP stack with method, url, headers, and body
    {:ok, %HttpResponse{status: 200, headers: [], body: ""}}
  end
end
```

Pass the module in config:

```elixir
config = %{
  base_url: "http://127.0.0.1:8098",
  http_client: MyHttpClient
}

OpenRiakClient.get_default_object(config, input)
```

Typical uses: swap in Finch or another HTTP stack, inject mocks in tests, or add tracing and custom TLS around the request.
