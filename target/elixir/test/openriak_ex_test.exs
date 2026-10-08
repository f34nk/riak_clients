defmodule OpenriakExTest do
  use ExUnit.Case, async: true

  test "OpenRiak.OpenRiakClient placeholder constructs" do
    client = OpenRiak.OpenRiakClient.new()
    assert client.endpoint == "http://127.0.0.1:8098"
  end
end
