defmodule Demo do
  @moduledoc false

  alias OpenRiakClient
  alias OpenRiakTypes.GetDefaultObjectOperationInput
  alias OpenRiakTypes.GetObjectInput
  alias OpenRiakTypes.PutDefaultObjectOperationInput
  alias OpenRiakTypes.PutObjectOperationInput

  @bucket_type "default"
  @bucket "demo"
  @default_key "hello-elixir"
  @typed_key "hello-elixir-typed"

  @test_object %{
    "client" => "elixir",
    "message" => "Hello from OpenRiak"
  }

  def run do
    riak_host = System.get_env("RIAK_HOST", "openriak")
    riak_port = System.get_env("RIAK_PORT", "8098")
    base_url = "http://#{riak_host}:#{riak_port}"
    config = %{base_url: base_url}

    IO.puts("=== OpenRiak Elixir Demo ===")
    IO.puts("Using OpenRiak at #{base_url}")

    :ok = write_default_object(config, @bucket, @default_key, @test_object)
    default_result = read_default_object(config, @bucket, @default_key)
    IO.puts("Default result: #{Jason.encode!(default_result, pretty: true)}")
    assert_message!(default_result)

    :ok = write_typed_object(config, @bucket_type, @bucket, @typed_key, @test_object)
    typed_result = read_typed_object(config, @bucket_type, @bucket, @typed_key)
    IO.puts("Typed result: #{Jason.encode!(typed_result, pretty: true)}")
    assert_message!(typed_result)

    IO.puts("Demo complete: default and typed write/read verified.")
  end

  defp assert_message!(result) do
    if result["message"] != @test_object["message"] do
      raise "Value mismatch after read!"
    end
  end

  defp write_default_object(config, bucket, key, data) do
    body = Jason.encode!(data)

    input = %PutDefaultObjectOperationInput{
      bucket: bucket,
      key: key,
      w: "1",
      dw: "1",
      content_type: "application/json",
      body: body
    }

    case OpenRiakClient.put_default_object(config, input) do
      {:ok, %{status_code: status}} when status in 200..299 ->
        IO.puts("Wrote default object -> bucket='#{bucket}' key='#{key}' status=#{status}")
        :ok

      {:ok, %{status_code: status}} ->
        raise "put_default_object failed with status #{status}"

      {:error, reason} ->
        raise inspect(reason)
    end
  end

  defp read_default_object(config, bucket, key) do
    input = %GetDefaultObjectOperationInput{
      bucket: bucket,
      key: key
    }

    case OpenRiakClient.get_default_object(config, input) do
      {:ok, %{status_code: 200, body: body}} ->
        IO.puts("Read default object  <- bucket='#{bucket}' key='#{key}' status=200")
        Jason.decode!(body)

      {:ok, %{status_code: status}} ->
        raise "get_default_object failed with status #{status}"

      {:error, reason} ->
        raise inspect(reason)
    end
  end

  defp write_typed_object(config, bucket_type, bucket, key, data) do
    body = Jason.encode!(data)

    input = %PutObjectOperationInput{
      bucket_type: bucket_type,
      bucket: bucket,
      key: key,
      w: "1",
      dw: "1",
      content_type: "application/json",
      body: body
    }

    case OpenRiakClient.put_object(config, input) do
      {:ok, %{status_code: status}} when status in 200..299 ->
        IO.puts(
          "Wrote typed object -> type='#{bucket_type}' bucket='#{bucket}' key='#{key}' status=#{status}"
        )

        :ok

      {:ok, %{status_code: status}} ->
        raise "put_object failed with status #{status}"

      {:error, reason} ->
        raise inspect(reason)
    end
  end

  defp read_typed_object(config, bucket_type, bucket, key) do
    input = %GetObjectInput{
      bucket_type: bucket_type,
      bucket: bucket,
      key: key
    }

    case OpenRiakClient.get_object(config, input) do
      {:ok, %{status_code: 200, body: body}} ->
        IO.puts(
          "Read typed object  <- type='#{bucket_type}' bucket='#{bucket}' key='#{key}' status=200"
        )

        Jason.decode!(body)

      {:ok, %{status_code: status}} ->
        raise "get_object failed with status #{status}"

      {:error, reason} ->
        raise inspect(reason)
    end
  end
end
