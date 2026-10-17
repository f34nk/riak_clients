# openriak_ex

Elixir HTTP client for OpenRiak, generated from the OpenRiak Smithy model.

```elixir
def deps do
  [
    {:openriak_ex, "~> 0.1.4"}
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
