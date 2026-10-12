defmodule OpenriakExTest do
  use ExUnit.Case, async: true

  alias OpenRiakHttp
  alias OpenRiakTypes.GetDefaultObjectOperationInput
  alias OpenRiakTypes.PingInput
  alias OpenRiakTypes.PingOutput
  alias OpenRiakTypes.PutDefaultObjectOperationInput
  alias RuntimeTypes.HttpRequest
  alias RuntimeTypes.HttpResponse

  test "OpenRiakClient exports ping/2" do
    assert Code.ensure_loaded?(OpenRiakClient)
    assert function_exported?(OpenRiakClient, :ping, 2)
  end

  test "encode_ping_request builds GET /ping" do
    req = OpenRiakHttp.encode_ping_request(%PingInput{})

    assert %HttpRequest{
             method: "GET",
             path: "/ping",
             query: %{},
             headers: [],
             body: ""
           } = req
  end

  test "decode_ping_response returns PingOutput on success" do
    resp = %HttpResponse{
      status: 200,
      headers: [{"Content-Type", "text/plain"}],
      body: "OK"
    }

    assert {:ok, %PingOutput{status_code: 200, content_type: "text/plain", body: "OK"}} =
             OpenRiakHttp.decode_ping_response(resp)
  end

  test "encode_put_default_object_request builds expected HTTP request" do
    body = ~s({"client":"elixir","message":"Hello from OpenRiak"})

    input = %PutDefaultObjectOperationInput{
      bucket: "demo",
      key: "hello-elixir",
      w: "1",
      dw: "1",
      content_type: "application/json",
      body: body
    }

    req = OpenRiakHttp.encode_put_default_object_request(input)

    assert %HttpRequest{
             method: "PUT",
             path: "/buckets/demo/keys/hello-elixir",
             query: %{"w" => "1", "dw" => "1"},
             headers: [{"Content-Type", "application/json"}],
             body: ^body
           } = req
  end

  test "encode_get_default_object_request builds expected HTTP request" do
    input = %GetDefaultObjectOperationInput{
      bucket: "demo",
      key: "hello-elixir"
    }

    req = OpenRiakHttp.encode_get_default_object_request(input)

    assert %HttpRequest{
             method: "GET",
             path: "/buckets/demo/keys/hello-elixir",
             query: %{},
             headers: [],
             body: ""
           } = req
  end
end
