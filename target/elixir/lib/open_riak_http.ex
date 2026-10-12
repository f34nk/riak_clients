defmodule OpenRiakHttp do
  @moduledoc "openRiakHttp codecs for openriak.v3_4.api#OpenRiak (generated). Do not edit."
  alias RuntimeTypes, as: RuntimeTypes
  alias OpenRiakTypes, as: Types

  @doc "Encode HTTP request for openriak.v3_4.api#CreateDatatype."
  @spec encode_create_datatype_request(OpenRiakTypes.CreateDatatypeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_create_datatype_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/datatypes"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "w" => encode_query_value(input.w),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw),
        "returnbody" => encode_query_value(input.return_body),
        "include_context" => encode_query_value(input.include_context)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.update do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#CreateDatatype."
  @spec decode_create_datatype_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.CreateDatatypeOutput.t()} | {:error, term()}
  def decode_create_datatype_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    location =
      headers
      |> List.keyfind("Location", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    crdt_context =
      headers
      |> List.keyfind("X-Riak-CRDT-Ctx", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.CreateDatatypeOutput{
      location: location,
      content_type: content_type,
      crdt_context: crdt_context,
      body: body,
      status_code: http_status
    }}
  end

  def decode_create_datatype_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_create_datatype_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#CreateDefaultObject."
  @spec encode_create_default_object_request(OpenRiakTypes.CreateDefaultObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_create_default_object_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#CreateDefaultObject."
  @spec decode_create_default_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.CreateDefaultObjectOutput.t()} | {:error, term()}
  def decode_create_default_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    location =
      headers
      |> List.keyfind("Location", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.CreateDefaultObjectOutput{
      location: location,
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_create_default_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_create_default_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#CreateDefaultObjectReturnBody."
  @spec encode_create_default_object_return_body_request(OpenRiakTypes.CreateDefaultObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_create_default_object_return_body_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#CreateDefaultObjectReturnBody."
  @spec decode_create_default_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.CreateDefaultObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_create_default_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    location =
      headers
      |> List.keyfind("Location", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.CreateDefaultObjectReturnBodyOutput{
      location: location,
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_create_default_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_create_default_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#CreateObject."
  @spec encode_create_object_request(OpenRiakTypes.CreateObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_create_object_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#CreateObject."
  @spec decode_create_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.CreateObjectOperationOutput.t()} | {:error, term()}
  def decode_create_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    location =
      headers
      |> List.keyfind("Location", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.CreateObjectOperationOutput{
      location: location,
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_create_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_create_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#CreateObjectReturnBody."
  @spec encode_create_object_return_body_request(OpenRiakTypes.CreateObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_create_object_return_body_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#CreateObjectReturnBody."
  @spec decode_create_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.CreateObjectReturnBodyOperationOutput.t()} | {:error, term()}
  def decode_create_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    location =
      headers
      |> List.keyfind("Location", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.CreateObjectReturnBodyOperationOutput{
      location: location,
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_create_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_create_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#DeleteDefaultObject."
  @spec encode_delete_default_object_request(OpenRiakTypes.DeleteDefaultObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_delete_default_object_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "w" => encode_query_value(input.w),
        "rw" => encode_query_value(input.rw),
        "pr" => encode_query_value(input.pr),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "DELETE",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#DeleteDefaultObject."
  @spec decode_delete_default_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.DeleteDefaultObjectOutput.t()} | {:error, term()}
  def decode_delete_default_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.DeleteDefaultObjectOutput{
      status_code: http_status
    }}
  end

  def decode_delete_default_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_delete_default_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#DeleteLegacyObject."
  @spec encode_delete_legacy_object_request(OpenRiakTypes.DeleteLegacyObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_delete_legacy_object_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "w" => encode_query_value(input.w),
        "rw" => encode_query_value(input.rw),
        "pr" => encode_query_value(input.pr),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "DELETE",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#DeleteLegacyObject."
  @spec decode_delete_legacy_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.DeleteLegacyObjectOutput.t()} | {:error, term()}
  def decode_delete_legacy_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.DeleteLegacyObjectOutput{
      status_code: http_status
    }}
  end

  def decode_delete_legacy_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_delete_legacy_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#DeleteObject."
  @spec encode_delete_object_request(OpenRiakTypes.DeleteObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_delete_object_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "w" => encode_query_value(input.w),
        "rw" => encode_query_value(input.rw),
        "pr" => encode_query_value(input.pr),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "DELETE",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#DeleteObject."
  @spec decode_delete_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.DeleteObjectOutput.t()} | {:error, term()}
  def decode_delete_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.DeleteObjectOutput{
      status_code: http_status
    }}
  end

  def decode_delete_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_delete_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetBucketProperties."
  @spec encode_get_bucket_properties_request(OpenRiakTypes.GetBucketPropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_bucket_properties_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/props"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetBucketProperties."
  @spec decode_get_bucket_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetBucketPropertiesOutput.t()} | {:error, term()}
  def decode_get_bucket_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetBucketPropertiesOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_bucket_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_bucket_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetBucketQueryResults."
  @spec encode_get_bucket_query_results_request(OpenRiakTypes.GetBucketQueryResultsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_bucket_query_results_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/query"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "result_queue" => encode_query_value(input.result_queue),
        "max_results" => encode_query_value(input.max_results)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetBucketQueryResults."
  @spec decode_get_bucket_query_results_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetBucketQueryResultsOutput.t()} | {:error, term()}
  def decode_get_bucket_query_results_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    continuation =
      headers
      |> List.keyfind("X-Riak-Continuation", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetBucketQueryResultsOutput{
      content_type: content_type,
      continuation: continuation,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_bucket_query_results_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_bucket_query_results_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetBucketTypeProperties."
  @spec encode_get_bucket_type_properties_request(OpenRiakTypes.GetBucketTypePropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_bucket_type_properties_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/props"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetBucketTypeProperties."
  @spec decode_get_bucket_type_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetBucketTypePropertiesOutput.t()} | {:error, term()}
  def decode_get_bucket_type_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetBucketTypePropertiesOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_bucket_type_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_bucket_type_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDatatype."
  @spec encode_get_datatype_request(OpenRiakTypes.GetDatatypeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_datatype_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/datatypes/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "w" => encode_query_value(input.w),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw),
        "returnbody" => encode_query_value(input.return_body),
        "include_context" => encode_query_value(input.include_context)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDatatype."
  @spec decode_get_datatype_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDatatypeOutput.t()} | {:error, term()}
  def decode_get_datatype_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    crdt_context =
      headers
      |> List.keyfind("X-Riak-CRDT-Ctx", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDatatypeOutput{
      content_type: content_type,
      crdt_context: crdt_context,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_datatype_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_datatype_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultBucketProperties."
  @spec encode_get_default_bucket_properties_request(OpenRiakTypes.GetDefaultBucketPropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_bucket_properties_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/props"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultBucketProperties."
  @spec decode_get_default_bucket_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultBucketPropertiesOutput.t()} | {:error, term()}
  def decode_get_default_bucket_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultBucketPropertiesOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_bucket_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_bucket_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultBucketQueryResults."
  @spec encode_get_default_bucket_query_results_request(OpenRiakTypes.GetDefaultBucketQueryResultsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_bucket_query_results_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/query"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "result_queue" => encode_query_value(input.result_queue),
        "max_results" => encode_query_value(input.max_results)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultBucketQueryResults."
  @spec decode_get_default_bucket_query_results_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultBucketQueryResultsOutput.t()} | {:error, term()}
  def decode_get_default_bucket_query_results_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    continuation =
      headers
      |> List.keyfind("X-Riak-Continuation", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultBucketQueryResultsOutput{
      content_type: content_type,
      continuation: continuation,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_bucket_query_results_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_bucket_query_results_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultEraseKeys."
  @spec encode_get_default_erase_keys_request(OpenRiakTypes.GetDefaultEraseKeysInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_erase_keys_request(input) do
    path = "/erase/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultEraseKeys."
  @spec decode_get_default_erase_keys_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultEraseKeysOutput.t()} | {:error, term()}
  def decode_get_default_erase_keys_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultEraseKeysOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_erase_keys_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_erase_keys_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultFetchClocksRange."
  @spec encode_get_default_fetch_clocks_range_request(OpenRiakTypes.GetDefaultFetchClocksRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_fetch_clocks_range_request(input) do
    path = "/rangetrees/buckets/#{uri_encode(input.bucket)}/keysclocks"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultFetchClocksRange."
  @spec decode_get_default_fetch_clocks_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultFetchClocksRangeOutput.t()} | {:error, term()}
  def decode_get_default_fetch_clocks_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultFetchClocksRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_fetch_clocks_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_fetch_clocks_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultFindKeysByObjectSize."
  @spec encode_get_default_find_keys_by_object_size_request(OpenRiakTypes.GetDefaultFindKeysByObjectSizeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_find_keys_by_object_size_request(input) do
    path = "/objectsizes/buckets/#{uri_encode(input.bucket)}/sizes/#{uri_encode(input.size)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultFindKeysByObjectSize."
  @spec decode_get_default_find_keys_by_object_size_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultFindKeysByObjectSizeOutput.t()} | {:error, term()}
  def decode_get_default_find_keys_by_object_size_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultFindKeysByObjectSizeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_find_keys_by_object_size_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_find_keys_by_object_size_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultFindKeysBySiblingCount."
  @spec encode_get_default_find_keys_by_sibling_count_request(OpenRiakTypes.GetDefaultFindKeysBySiblingCountInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_find_keys_by_sibling_count_request(input) do
    path = "/siblings/buckets/#{uri_encode(input.bucket)}/counts/#{uri_encode(input.count)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultFindKeysBySiblingCount."
  @spec decode_get_default_find_keys_by_sibling_count_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultFindKeysBySiblingCountOutput.t()} | {:error, term()}
  def decode_get_default_find_keys_by_sibling_count_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultFindKeysBySiblingCountOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_find_keys_by_sibling_count_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_find_keys_by_sibling_count_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultFindTombs."
  @spec encode_get_default_find_tombs_request(OpenRiakTypes.GetDefaultFindTombsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_find_tombs_request(input) do
    path = "/tombs/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultFindTombs."
  @spec decode_get_default_find_tombs_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultFindTombsOutput.t()} | {:error, term()}
  def decode_get_default_find_tombs_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultFindTombsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_find_tombs_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_find_tombs_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultMergeTreeRange."
  @spec encode_get_default_merge_tree_range_request(OpenRiakTypes.GetDefaultMergeTreeRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_merge_tree_range_request(input) do
    path = "/rangetrees/buckets/#{uri_encode(input.bucket)}/trees/#{uri_encode(input.tree_size)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultMergeTreeRange."
  @spec decode_get_default_merge_tree_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultMergeTreeRangeOutput.t()} | {:error, term()}
  def decode_get_default_merge_tree_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultMergeTreeRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_merge_tree_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_merge_tree_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultObject."
  @spec encode_get_default_object_request(OpenRiakTypes.GetDefaultObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_object_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock),
        "vtag" => encode_query_value(input.vtag)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_modified_since != nil, do: {"If-Modified-Since", to_string(input.if_modified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultObject."
  @spec decode_get_default_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultObjectOutput.t()} | {:error, term()}
  def decode_get_default_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultObjectOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultObjectStats."
  @spec encode_get_default_object_stats_request(OpenRiakTypes.GetDefaultObjectStatsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_object_stats_request(input) do
    path = "/objectstats/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultObjectStats."
  @spec decode_get_default_object_stats_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultObjectStatsOutput.t()} | {:error, term()}
  def decode_get_default_object_stats_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultObjectStatsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_object_stats_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_object_stats_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultReapTombs."
  @spec encode_get_default_reap_tombs_request(OpenRiakTypes.GetDefaultReapTombsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_reap_tombs_request(input) do
    path = "/reap/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultReapTombs."
  @spec decode_get_default_reap_tombs_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultReapTombsOutput.t()} | {:error, term()}
  def decode_get_default_reap_tombs_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultReapTombsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_reap_tombs_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_reap_tombs_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultRepairKeysRange."
  @spec encode_get_default_repair_keys_range_request(OpenRiakTypes.GetDefaultRepairKeysRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_repair_keys_range_request(input) do
    path = "/rangerepair/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultRepairKeysRange."
  @spec decode_get_default_repair_keys_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultRepairKeysRangeOutput.t()} | {:error, term()}
  def decode_get_default_repair_keys_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultRepairKeysRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_repair_keys_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_repair_keys_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetDefaultReplKeysRange."
  @spec encode_get_default_repl_keys_range_request(OpenRiakTypes.GetDefaultReplKeysRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_default_repl_keys_range_request(input) do
    path = "/rangerepl/buckets/#{uri_encode(input.bucket)}/queuename/#{uri_encode(input.queue_name)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetDefaultReplKeysRange."
  @spec decode_get_default_repl_keys_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetDefaultReplKeysRangeOutput.t()} | {:error, term()}
  def decode_get_default_repl_keys_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetDefaultReplKeysRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_default_repl_keys_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_default_repl_keys_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetEraseKeys."
  @spec encode_get_erase_keys_request(OpenRiakTypes.GetEraseKeysInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_erase_keys_request(input) do
    path = "/erase/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetEraseKeys."
  @spec decode_get_erase_keys_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetEraseKeysOutput.t()} | {:error, term()}
  def decode_get_erase_keys_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetEraseKeysOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_erase_keys_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_erase_keys_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetFetchClocksNval."
  @spec encode_get_fetch_clocks_nval_request(OpenRiakTypes.GetFetchClocksNvalInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_fetch_clocks_nval_request(input) do
    path = "/cachedtrees/nvals/#{uri_encode(input.n_val)}/keysclocks"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetFetchClocksNval."
  @spec decode_get_fetch_clocks_nval_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetFetchClocksNvalOutput.t()} | {:error, term()}
  def decode_get_fetch_clocks_nval_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetFetchClocksNvalOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_fetch_clocks_nval_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_fetch_clocks_nval_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetFetchClocksRange."
  @spec encode_get_fetch_clocks_range_request(OpenRiakTypes.GetFetchClocksRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_fetch_clocks_range_request(input) do
    path = "/rangetrees/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keysclocks"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetFetchClocksRange."
  @spec decode_get_fetch_clocks_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetFetchClocksRangeOutput.t()} | {:error, term()}
  def decode_get_fetch_clocks_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetFetchClocksRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_fetch_clocks_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_fetch_clocks_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetFindKeysByObjectSize."
  @spec encode_get_find_keys_by_object_size_request(OpenRiakTypes.GetFindKeysByObjectSizeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_find_keys_by_object_size_request(input) do
    path = "/objectsizes/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/sizes/#{uri_encode(input.size)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetFindKeysByObjectSize."
  @spec decode_get_find_keys_by_object_size_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetFindKeysByObjectSizeOutput.t()} | {:error, term()}
  def decode_get_find_keys_by_object_size_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetFindKeysByObjectSizeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_find_keys_by_object_size_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_find_keys_by_object_size_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetFindKeysBySiblingCount."
  @spec encode_get_find_keys_by_sibling_count_request(OpenRiakTypes.GetFindKeysBySiblingCountInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_find_keys_by_sibling_count_request(input) do
    path = "/siblings/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/counts/#{uri_encode(input.count)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetFindKeysBySiblingCount."
  @spec decode_get_find_keys_by_sibling_count_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetFindKeysBySiblingCountOutput.t()} | {:error, term()}
  def decode_get_find_keys_by_sibling_count_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetFindKeysBySiblingCountOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_find_keys_by_sibling_count_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_find_keys_by_sibling_count_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetFindTombs."
  @spec encode_get_find_tombs_request(OpenRiakTypes.GetFindTombsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_find_tombs_request(input) do
    path = "/tombs/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetFindTombs."
  @spec decode_get_find_tombs_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetFindTombsOutput.t()} | {:error, term()}
  def decode_get_find_tombs_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetFindTombsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_find_tombs_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_find_tombs_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetLegacyCounter."
  @spec encode_get_legacy_counter_request(OpenRiakTypes.GetLegacyCounterInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_legacy_counter_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/counters/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetLegacyCounter."
  @spec decode_get_legacy_counter_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetLegacyCounterOutput.t()} | {:error, term()}
  def decode_get_legacy_counter_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetLegacyCounterOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_legacy_counter_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_legacy_counter_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetLegacyObject."
  @spec encode_get_legacy_object_request(OpenRiakTypes.GetLegacyObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_legacy_object_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock),
        "vtag" => encode_query_value(input.vtag)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_modified_since != nil, do: {"If-Modified-Since", to_string(input.if_modified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetLegacyObject."
  @spec decode_get_legacy_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetLegacyObjectOutput.t()} | {:error, term()}
  def decode_get_legacy_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetLegacyObjectOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_legacy_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_legacy_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetMapReduceUsage."
  @spec encode_get_map_reduce_usage_request(OpenRiakTypes.GetMapReduceUsageInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_map_reduce_usage_request(input) do
    path = "/mapred"

    query = %{}
    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetMapReduceUsage."
  @spec decode_get_map_reduce_usage_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetMapReduceUsageOutput.t()} | {:error, term()}
  def decode_get_map_reduce_usage_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetMapReduceUsageOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_map_reduce_usage_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_map_reduce_usage_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetMembership."
  @spec encode_get_membership_request(OpenRiakTypes.GetMembershipInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_membership_request(input) do
    path = "/membership_request"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetMembership."
  @spec decode_get_membership_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetMembershipOutput.t()} | {:error, term()}
  def decode_get_membership_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetMembershipOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_membership_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_membership_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetMergeBranchNval."
  @spec encode_get_merge_branch_nval_request(OpenRiakTypes.GetMergeBranchNvalInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_merge_branch_nval_request(input) do
    path = "/cachedtrees/nvals/#{uri_encode(input.n_val)}/branch"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetMergeBranchNval."
  @spec decode_get_merge_branch_nval_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetMergeBranchNvalOutput.t()} | {:error, term()}
  def decode_get_merge_branch_nval_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetMergeBranchNvalOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_merge_branch_nval_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_merge_branch_nval_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetMergeRootNval."
  @spec encode_get_merge_root_nval_request(OpenRiakTypes.GetMergeRootNvalInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_merge_root_nval_request(input) do
    path = "/cachedtrees/nvals/#{uri_encode(input.n_val)}/root"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetMergeRootNval."
  @spec decode_get_merge_root_nval_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetMergeRootNvalOutput.t()} | {:error, term()}
  def decode_get_merge_root_nval_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetMergeRootNvalOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_merge_root_nval_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_merge_root_nval_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetMergeTreeRange."
  @spec encode_get_merge_tree_range_request(OpenRiakTypes.GetMergeTreeRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_merge_tree_range_request(input) do
    path = "/rangetrees/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/trees/#{uri_encode(input.tree_size)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetMergeTreeRange."
  @spec decode_get_merge_tree_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetMergeTreeRangeOutput.t()} | {:error, term()}
  def decode_get_merge_tree_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetMergeTreeRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_merge_tree_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_merge_tree_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetObject."
  @spec encode_get_object_request(OpenRiakTypes.GetObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_object_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock),
        "vtag" => encode_query_value(input.vtag)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_modified_since != nil, do: {"If-Modified-Since", to_string(input.if_modified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetObject."
  @spec decode_get_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetObjectOutput.t()} | {:error, term()}
  def decode_get_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetObjectOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetObjectStats."
  @spec encode_get_object_stats_request(OpenRiakTypes.GetObjectStatsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_object_stats_request(input) do
    path = "/objectstats/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetObjectStats."
  @spec decode_get_object_stats_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetObjectStatsOutput.t()} | {:error, term()}
  def decode_get_object_stats_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetObjectStatsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_object_stats_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_object_stats_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetQueueItem."
  @spec encode_get_queue_item_request(OpenRiakTypes.GetQueueItemInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_queue_item_request(input) do
    path = "/queuename/#{uri_encode(input.queue_name)}"

    query =
      %{
        "object_format" => encode_query_value(input.object_format)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetQueueItem."
  @spec decode_get_queue_item_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetQueueItemOutput.t()} | {:error, term()}
  def decode_get_queue_item_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetQueueItemOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_queue_item_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_queue_item_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetReapTombs."
  @spec encode_get_reap_tombs_request(OpenRiakTypes.GetReapTombsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_reap_tombs_request(input) do
    path = "/reap/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetReapTombs."
  @spec decode_get_reap_tombs_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetReapTombsOutput.t()} | {:error, term()}
  def decode_get_reap_tombs_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetReapTombsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_reap_tombs_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_reap_tombs_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetRepairKeysRange."
  @spec encode_get_repair_keys_range_request(OpenRiakTypes.GetRepairKeysRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_repair_keys_range_request(input) do
    path = "/rangerepair/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetRepairKeysRange."
  @spec decode_get_repair_keys_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetRepairKeysRangeOutput.t()} | {:error, term()}
  def decode_get_repair_keys_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetRepairKeysRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_repair_keys_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_repair_keys_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetReplKeysRange."
  @spec encode_get_repl_keys_range_request(OpenRiakTypes.GetReplKeysRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_repl_keys_range_request(input) do
    path = "/rangerepl/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/queuename/#{uri_encode(input.queue_name)}"

    query =
      %{
        "filter" => encode_query_value(input.filter),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetReplKeysRange."
  @spec decode_get_repl_keys_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetReplKeysRangeOutput.t()} | {:error, term()}
  def decode_get_repl_keys_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetReplKeysRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_repl_keys_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_repl_keys_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetRoot."
  @spec encode_get_root_request(OpenRiakTypes.GetRootInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_root_request(input) do
    path = "/"

    query = %{}
    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetRoot."
  @spec decode_get_root_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetRootOutput.t()} | {:error, term()}
  def decode_get_root_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetRootOutput{
      content_type: content_type,
      link: link,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_root_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_root_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#GetStats."
  @spec encode_get_stats_request(OpenRiakTypes.GetStatsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_get_stats_request(input) do
    path = "/stats"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#GetStats."
  @spec decode_get_stats_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.GetStatsOutput.t()} | {:error, term()}
  def decode_get_stats_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.GetStatsOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_get_stats_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_get_stats_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#HeadDefaultObject."
  @spec encode_head_default_object_request(OpenRiakTypes.HeadDefaultObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_head_default_object_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock),
        "vtag" => encode_query_value(input.vtag)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_modified_since != nil, do: {"If-Modified-Since", to_string(input.if_modified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "HEAD",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#HeadDefaultObject."
  @spec decode_head_default_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.HeadDefaultObjectOutput.t()} | {:error, term()}
  def decode_head_default_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.HeadDefaultObjectOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_head_default_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_head_default_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#HeadLegacyObject."
  @spec encode_head_legacy_object_request(OpenRiakTypes.HeadLegacyObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_head_legacy_object_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock),
        "vtag" => encode_query_value(input.vtag)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_modified_since != nil, do: {"If-Modified-Since", to_string(input.if_modified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "HEAD",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#HeadLegacyObject."
  @spec decode_head_legacy_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.HeadLegacyObjectOutput.t()} | {:error, term()}
  def decode_head_legacy_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.HeadLegacyObjectOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_head_legacy_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_head_legacy_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#HeadMapReduce."
  @spec encode_head_map_reduce_request(OpenRiakTypes.HeadMapReduceInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_head_map_reduce_request(input) do
    path = "/mapred"

    query = %{}
    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "HEAD",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#HeadMapReduce."
  @spec decode_head_map_reduce_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.HeadMapReduceOutput.t()} | {:error, term()}
  def decode_head_map_reduce_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.HeadMapReduceOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_head_map_reduce_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_head_map_reduce_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#HeadObject."
  @spec encode_head_object_request(OpenRiakTypes.HeadObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_head_object_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "basic_quorum" => encode_query_value(input.basic_quorum),
        "notfound_ok" => encode_query_value(input.notfound_ok),
        "node_confirms" => encode_query_value(input.node_confirms),
        "deletedvclock" => encode_query_value(input.deleted_v_clock),
        "vtag" => encode_query_value(input.vtag)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_modified_since != nil, do: {"If-Modified-Since", to_string(input.if_modified_since)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "HEAD",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#HeadObject."
  @spec decode_head_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.HeadObjectOperationOutput.t()} | {:error, term()}
  def decode_head_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.HeadObjectOperationOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_head_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_head_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#HeadStats."
  @spec encode_head_stats_request(OpenRiakTypes.HeadStatsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_head_stats_request(input) do
    path = "/stats"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "HEAD",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#HeadStats."
  @spec decode_head_stats_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.HeadStatsOutput.t()} | {:error, term()}
  def decode_head_stats_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.HeadStatsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      status_code: http_status
    }}
  end

  def decode_head_stats_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_head_stats_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#LinkWalk."
  @spec encode_link_walk_request(OpenRiakTypes.LinkWalkInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_link_walk_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}/#{uri_encode(input.walk)}"

    query = %{}
    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#LinkWalk."
  @spec decode_link_walk_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.LinkWalkOutput.t()} | {:error, term()}
  def decode_link_walk_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.LinkWalkOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_link_walk_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_link_walk_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#LinkWalkDefault."
  @spec encode_link_walk_default_request(OpenRiakTypes.LinkWalkDefaultOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_link_walk_default_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}/#{uri_encode(input.walk)}"

    query = %{}
    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#LinkWalkDefault."
  @spec decode_link_walk_default_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.LinkWalkDefaultOutput.t()} | {:error, term()}
  def decode_link_walk_default_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.LinkWalkDefaultOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_link_walk_default_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_link_walk_default_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#LinkWalkLegacy."
  @spec encode_link_walk_legacy_request(OpenRiakTypes.LinkWalkLegacyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_link_walk_legacy_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}/#{uri_encode(input.walk)}"

    query = %{}
    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#LinkWalkLegacy."
  @spec decode_link_walk_legacy_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.LinkWalkLegacyOutput.t()} | {:error, term()}
  def decode_link_walk_legacy_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.LinkWalkLegacyOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_link_walk_legacy_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_link_walk_legacy_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ListAaeBuckets."
  @spec encode_list_aae_buckets_request(OpenRiakTypes.ListAaeBucketsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_list_aae_buckets_request(input) do
    path = "/aaebucketlist"

    query =
      %{
        "nval" => encode_query_value(input.nval),
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ListAaeBuckets."
  @spec decode_list_aae_buckets_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ListAaeBucketsOutput.t()} | {:error, term()}
  def decode_list_aae_buckets_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.ListAaeBucketsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_list_aae_buckets_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_list_aae_buckets_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ListBuckets."
  @spec encode_list_buckets_request(OpenRiakTypes.ListBucketsOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_list_buckets_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets?buckets=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ListBuckets."
  @spec decode_list_buckets_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ListBucketsOutput.t()} | {:error, term()}
  def decode_list_buckets_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.ListBucketsOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_list_buckets_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_list_buckets_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ListDefaultBuckets."
  @spec encode_list_default_buckets_request(OpenRiakTypes.ListDefaultBucketsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_list_default_buckets_request(input) do
    path = "/buckets?buckets=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ListDefaultBuckets."
  @spec decode_list_default_buckets_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ListDefaultBucketsOutput.t()} | {:error, term()}
  def decode_list_default_buckets_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.ListDefaultBucketsOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_list_default_buckets_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_list_default_buckets_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ListDefaultKeys."
  @spec encode_list_default_keys_request(OpenRiakTypes.ListDefaultKeysOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_list_default_keys_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys?keys=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "props" => encode_query_value(input.props)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ListDefaultKeys."
  @spec decode_list_default_keys_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ListDefaultKeysOutput.t()} | {:error, term()}
  def decode_list_default_keys_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.ListDefaultKeysOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_list_default_keys_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_list_default_keys_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ListKeys."
  @spec encode_list_keys_request(OpenRiakTypes.ListKeysOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_list_keys_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys?keys=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "props" => encode_query_value(input.props)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ListKeys."
  @spec decode_list_keys_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ListKeysOutput.t()} | {:error, term()}
  def decode_list_keys_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.ListKeysOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_list_keys_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_list_keys_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#MapReduce."
  @spec encode_map_reduce_request(OpenRiakTypes.MapReduceOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_map_reduce_request(input) do
    path = "/mapred"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.request do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#MapReduce."
  @spec decode_map_reduce_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.MapReduceOutput.t()} | {:error, term()}
  def decode_map_reduce_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.MapReduceOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_map_reduce_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_map_reduce_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#MapReduceChunked."
  @spec encode_map_reduce_chunked_request(OpenRiakTypes.MapReduceChunkedInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_map_reduce_chunked_request(input) do
    path = "/mapred?chunked=true"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.accept != nil, do: {"Accept", to_string(input.accept)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.request do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#MapReduceChunked."
  @spec decode_map_reduce_chunked_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.MapReduceChunkedOutput.t()} | {:error, term()}
  def decode_map_reduce_chunked_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.MapReduceChunkedOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_map_reduce_chunked_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_map_reduce_chunked_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#Ping."
  @spec encode_ping_request(OpenRiakTypes.PingInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_ping_request(input) do
    path = "/ping"

    query = %{}
    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#Ping."
  @spec decode_ping_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PingOutput.t()} | {:error, term()}
  def decode_ping_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PingOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_ping_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_ping_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PostDefaultObject."
  @spec encode_post_default_object_request(OpenRiakTypes.PostDefaultObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_post_default_object_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PostDefaultObject."
  @spec decode_post_default_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PostDefaultObjectOutput.t()} | {:error, term()}
  def decode_post_default_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.PostDefaultObjectOutput{
      status_code: http_status
    }}
  end

  def decode_post_default_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_post_default_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PostDefaultObjectReturnBody."
  @spec encode_post_default_object_return_body_request(OpenRiakTypes.PostDefaultObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_post_default_object_return_body_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PostDefaultObjectReturnBody."
  @spec decode_post_default_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PostDefaultObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_post_default_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PostDefaultObjectReturnBodyOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_post_default_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_post_default_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PostLegacyObject."
  @spec encode_post_legacy_object_request(OpenRiakTypes.PostLegacyObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_post_legacy_object_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PostLegacyObject."
  @spec decode_post_legacy_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PostLegacyObjectOutput.t()} | {:error, term()}
  def decode_post_legacy_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.PostLegacyObjectOutput{
      status_code: http_status
    }}
  end

  def decode_post_legacy_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_post_legacy_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PostLegacyObjectReturnBody."
  @spec encode_post_legacy_object_return_body_request(OpenRiakTypes.PostLegacyObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_post_legacy_object_return_body_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PostLegacyObjectReturnBody."
  @spec decode_post_legacy_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PostLegacyObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_post_legacy_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PostLegacyObjectReturnBodyOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_post_legacy_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_post_legacy_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PostObject."
  @spec encode_post_object_request(OpenRiakTypes.PostObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_post_object_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PostObject."
  @spec decode_post_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PostObjectOutput.t()} | {:error, term()}
  def decode_post_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.PostObjectOutput{
      status_code: http_status
    }}
  end

  def decode_post_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_post_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PostObjectReturnBody."
  @spec encode_post_object_return_body_request(OpenRiakTypes.PostObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_post_object_return_body_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PostObjectReturnBody."
  @spec decode_post_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PostObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_post_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PostObjectReturnBodyOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_post_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_post_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PushQueueItems."
  @spec encode_push_queue_items_request(OpenRiakTypes.PushQueueItemsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_push_queue_items_request(input) do
    path = "/queuename/#{uri_encode(input.queue_name)}"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.keys_clocks do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PushQueueItems."
  @spec decode_push_queue_items_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PushQueueItemsOutput.t()} | {:error, term()}
  def decode_push_queue_items_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PushQueueItemsOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_push_queue_items_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_push_queue_items_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PutDefaultObject."
  @spec encode_put_default_object_request(OpenRiakTypes.PutDefaultObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_put_default_object_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PutDefaultObject."
  @spec decode_put_default_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PutDefaultObjectOutput.t()} | {:error, term()}
  def decode_put_default_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.PutDefaultObjectOutput{
      status_code: http_status
    }}
  end

  def decode_put_default_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_put_default_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PutDefaultObjectReturnBody."
  @spec encode_put_default_object_return_body_request(OpenRiakTypes.PutDefaultObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_put_default_object_return_body_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PutDefaultObjectReturnBody."
  @spec decode_put_default_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PutDefaultObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_put_default_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PutDefaultObjectReturnBodyOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_put_default_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_put_default_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PutLegacyObject."
  @spec encode_put_legacy_object_request(OpenRiakTypes.PutLegacyObjectInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_put_legacy_object_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PutLegacyObject."
  @spec decode_put_legacy_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PutLegacyObjectOutput.t()} | {:error, term()}
  def decode_put_legacy_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.PutLegacyObjectOutput{
      status_code: http_status
    }}
  end

  def decode_put_legacy_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_put_legacy_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PutLegacyObjectReturnBody."
  @spec encode_put_legacy_object_return_body_request(OpenRiakTypes.PutLegacyObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_put_legacy_object_return_body_request(input) do
    path = "/riak/#{uri_encode(input.bucket)}/#{uri_encode(input.key)}?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PutLegacyObjectReturnBody."
  @spec decode_put_legacy_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PutLegacyObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_put_legacy_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PutLegacyObjectReturnBodyOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_put_legacy_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_put_legacy_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PutObject."
  @spec encode_put_object_request(OpenRiakTypes.PutObjectOperationInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_put_object_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PutObject."
  @spec decode_put_object_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PutObjectOutput.t()} | {:error, term()}
  def decode_put_object_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.PutObjectOutput{
      status_code: http_status
    }}
  end

  def decode_put_object_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_put_object_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#PutObjectReturnBody."
  @spec encode_put_object_return_body_request(OpenRiakTypes.PutObjectReturnBodyInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_put_object_return_body_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys/#{uri_encode(input.key)}?returnbody=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "dw" => encode_query_value(input.dw),
        "pw" => encode_query_value(input.pw),
        "node_confirms" => encode_query_value(input.node_confirms),
        "sync_on_write" => encode_query_value(input.sync_on_write),
        "asis" => encode_query_value(input.asis)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.if_none_match != nil, do: {"If-None-Match", to_string(input.if_none_match)}, else: nil),
        if(input.if_match != nil, do: {"If-Match", to_string(input.if_match)}, else: nil),
        if(input.if_unmodified_since != nil, do: {"If-Unmodified-Since", to_string(input.if_unmodified_since)}, else: nil),
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
        if(input.content_encoding != nil, do: {"Content-Encoding", to_string(input.content_encoding)}, else: nil),
        if(input.link != nil, do: {"Link", to_string(input.link)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    headers = headers ++ prefix_headers_to_list("x-riak-", input.riak_headers)
    body =
      case input.body do
        nil -> ""
        value -> value
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#PutObjectReturnBody."
  @spec decode_put_object_return_body_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.PutObjectReturnBodyOutput.t()} | {:error, term()}
  def decode_put_object_return_body_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    content_encoding =
      headers
      |> List.keyfind("Content-Encoding", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    etag =
      headers
      |> List.keyfind("ETag", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    last_modified =
      headers
      |> List.keyfind("Last-Modified", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.PutObjectReturnBodyOutput{
      content_type: content_type,
      content_encoding: content_encoding,
      etag: etag,
      last_modified: last_modified,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_put_object_return_body_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_put_object_return_body_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#QueryDefaultSecondaryIndex."
  @spec encode_query_default_secondary_index_request(OpenRiakTypes.QueryDefaultSecondaryIndexInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_query_default_secondary_index_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.value)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#QueryDefaultSecondaryIndex."
  @spec decode_query_default_secondary_index_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.QueryDefaultSecondaryIndexOutput.t()} | {:error, term()}
  def decode_query_default_secondary_index_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.QueryDefaultSecondaryIndexOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_query_default_secondary_index_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_query_default_secondary_index_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#QueryDefaultSecondaryIndexRange."
  @spec encode_query_default_secondary_index_range_request(OpenRiakTypes.QueryDefaultSecondaryIndexRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_query_default_secondary_index_range_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.start)}/#{uri_encode(input.end_)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#QueryDefaultSecondaryIndexRange."
  @spec decode_query_default_secondary_index_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.QueryDefaultSecondaryIndexRangeOutput.t()} | {:error, term()}
  def decode_query_default_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.QueryDefaultSecondaryIndexRangeOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_query_default_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_query_default_secondary_index_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#QuerySecondaryIndex."
  @spec encode_query_secondary_index_request(OpenRiakTypes.QuerySecondaryIndexInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_query_secondary_index_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.value)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#QuerySecondaryIndex."
  @spec decode_query_secondary_index_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.QuerySecondaryIndexOutput.t()} | {:error, term()}
  def decode_query_secondary_index_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.QuerySecondaryIndexOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_query_secondary_index_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_query_secondary_index_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#QuerySecondaryIndexRange."
  @spec encode_query_secondary_index_range_request(OpenRiakTypes.QuerySecondaryIndexRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_query_secondary_index_range_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.start)}/#{uri_encode(input.end_)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#QuerySecondaryIndexRange."
  @spec decode_query_secondary_index_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.QuerySecondaryIndexRangeOutput.t()} | {:error, term()}
  def decode_query_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.QuerySecondaryIndexRangeOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_query_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_query_secondary_index_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ResetBucketProperties."
  @spec encode_reset_bucket_properties_request(OpenRiakTypes.ResetBucketPropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_reset_bucket_properties_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/props"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "DELETE",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ResetBucketProperties."
  @spec decode_reset_bucket_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ResetBucketPropertiesOutput.t()} | {:error, term()}
  def decode_reset_bucket_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.ResetBucketPropertiesOutput{
      status_code: http_status
    }}
  end

  def decode_reset_bucket_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_reset_bucket_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#ResetDefaultBucketProperties."
  @spec encode_reset_default_bucket_properties_request(OpenRiakTypes.ResetDefaultBucketPropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_reset_default_bucket_properties_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/props"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "DELETE",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#ResetDefaultBucketProperties."
  @spec decode_reset_default_bucket_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.ResetDefaultBucketPropertiesOutput.t()} | {:error, term()}
  def decode_reset_default_bucket_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.ResetDefaultBucketPropertiesOutput{
      status_code: http_status
    }}
  end

  def decode_reset_default_bucket_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_reset_default_bucket_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#RunBucketQuery."
  @spec encode_run_bucket_query_request(OpenRiakTypes.RunBucketQueryInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_run_bucket_query_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/query"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.query do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#RunBucketQuery."
  @spec decode_run_bucket_query_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.RunBucketQueryOutput.t()} | {:error, term()}
  def decode_run_bucket_query_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.RunBucketQueryOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_run_bucket_query_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_run_bucket_query_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#RunDefaultBucketQuery."
  @spec encode_run_default_bucket_query_request(OpenRiakTypes.RunDefaultBucketQueryInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_run_default_bucket_query_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/query"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.query do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#RunDefaultBucketQuery."
  @spec decode_run_default_bucket_query_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.RunDefaultBucketQueryOutput.t()} | {:error, term()}
  def decode_run_default_bucket_query_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.RunDefaultBucketQueryOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_run_default_bucket_query_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_run_default_bucket_query_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#SetBucketProperties."
  @spec encode_set_bucket_properties_request(OpenRiakTypes.SetBucketPropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_set_bucket_properties_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/props"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.props do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#SetBucketProperties."
  @spec decode_set_bucket_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.SetBucketPropertiesOutput.t()} | {:error, term()}
  def decode_set_bucket_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.SetBucketPropertiesOutput{
      status_code: http_status
    }}
  end

  def decode_set_bucket_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_set_bucket_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#SetBucketTypeProperties."
  @spec encode_set_bucket_type_properties_request(OpenRiakTypes.SetBucketTypePropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_set_bucket_type_properties_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/props"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.props do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#SetBucketTypeProperties."
  @spec decode_set_bucket_type_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.SetBucketTypePropertiesOutput.t()} | {:error, term()}
  def decode_set_bucket_type_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.SetBucketTypePropertiesOutput{
      status_code: http_status
    }}
  end

  def decode_set_bucket_type_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_set_bucket_type_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#SetDefaultBucketProperties."
  @spec encode_set_default_bucket_properties_request(OpenRiakTypes.SetDefaultBucketPropertiesInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_set_default_bucket_properties_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/props"

    query = %{}
    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.props do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "PUT",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#SetDefaultBucketProperties."
  @spec decode_set_default_bucket_properties_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.SetDefaultBucketPropertiesOutput.t()} | {:error, term()}
  def decode_set_default_bucket_properties_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    {:ok, %Types.SetDefaultBucketPropertiesOutput{
      status_code: http_status
    }}
  end

  def decode_set_default_bucket_properties_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_set_default_bucket_properties_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamBuckets."
  @spec encode_stream_buckets_request(OpenRiakTypes.StreamBucketsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_buckets_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets?buckets=stream"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamBuckets."
  @spec decode_stream_buckets_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamBucketsOutput.t()} | {:error, term()}
  def decode_stream_buckets_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamBucketsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_buckets_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_buckets_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamDefaultBuckets."
  @spec encode_stream_default_buckets_request(OpenRiakTypes.StreamDefaultBucketsInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_default_buckets_request(input) do
    path = "/buckets?buckets=stream"

    query =
      %{
        "timeout" => encode_query_value(input.timeout)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamDefaultBuckets."
  @spec decode_stream_default_buckets_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamDefaultBucketsOutput.t()} | {:error, term()}
  def decode_stream_default_buckets_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamDefaultBucketsOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_default_buckets_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_default_buckets_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamDefaultKeys."
  @spec encode_stream_default_keys_request(OpenRiakTypes.StreamDefaultKeysInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_default_keys_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/keys?keys=stream"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "props" => encode_query_value(input.props)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamDefaultKeys."
  @spec decode_stream_default_keys_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamDefaultKeysOutput.t()} | {:error, term()}
  def decode_stream_default_keys_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamDefaultKeysOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_default_keys_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_default_keys_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamDefaultSecondaryIndex."
  @spec encode_stream_default_secondary_index_request(OpenRiakTypes.StreamDefaultSecondaryIndexInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_default_secondary_index_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.value)}?stream=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamDefaultSecondaryIndex."
  @spec decode_stream_default_secondary_index_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamDefaultSecondaryIndexOutput.t()} | {:error, term()}
  def decode_stream_default_secondary_index_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamDefaultSecondaryIndexOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_default_secondary_index_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_default_secondary_index_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamDefaultSecondaryIndexRange."
  @spec encode_stream_default_secondary_index_range_request(OpenRiakTypes.StreamDefaultSecondaryIndexRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_default_secondary_index_range_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.start)}/#{uri_encode(input.end_)}?stream=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamDefaultSecondaryIndexRange."
  @spec decode_stream_default_secondary_index_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamDefaultSecondaryIndexRangeOutput.t()} | {:error, term()}
  def decode_stream_default_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamDefaultSecondaryIndexRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_default_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_default_secondary_index_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamKeys."
  @spec encode_stream_keys_request(OpenRiakTypes.StreamKeysInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_keys_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/keys?keys=stream"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "props" => encode_query_value(input.props)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamKeys."
  @spec decode_stream_keys_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamKeysOutput.t()} | {:error, term()}
  def decode_stream_keys_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamKeysOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_keys_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_keys_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamSecondaryIndex."
  @spec encode_stream_secondary_index_request(OpenRiakTypes.StreamSecondaryIndexInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_secondary_index_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.value)}?stream=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamSecondaryIndex."
  @spec decode_stream_secondary_index_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamSecondaryIndexOutput.t()} | {:error, term()}
  def decode_stream_secondary_index_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamSecondaryIndexOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_secondary_index_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_secondary_index_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#StreamSecondaryIndexRange."
  @spec encode_stream_secondary_index_range_request(OpenRiakTypes.StreamSecondaryIndexRangeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_stream_secondary_index_range_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/index/#{uri_encode(input.field)}/#{uri_encode(input.start)}/#{uri_encode(input.end_)}?stream=true"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "max_results" => encode_query_value(input.max_results),
        "continuation" => encode_query_value(input.continuation),
        "return_terms" => encode_query_value(input.return_terms),
        "pagination_sort" => encode_query_value(input.pagination_sort),
        "term_regex" => encode_query_value(input.term_regex)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body = ""

    %RuntimeTypes.HttpRequest{
      method: "GET",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#StreamSecondaryIndexRange."
  @spec decode_stream_secondary_index_range_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.StreamSecondaryIndexRangeOutput.t()} | {:error, term()}
  def decode_stream_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    link =
      headers
      |> List.keyfind("Link", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.StreamSecondaryIndexRangeOutput{
      content_type: content_type,
      link: link,
      riak_headers: prefix_headers_from_list(headers, "x-riak-"),
      body: body,
      status_code: http_status
    }}
  end

  def decode_stream_secondary_index_range_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_stream_secondary_index_range_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#UpdateDatatype."
  @spec encode_update_datatype_request(OpenRiakTypes.UpdateDatatypeInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_update_datatype_request(input) do
    path = "/types/#{uri_encode(input.bucket_type)}/buckets/#{uri_encode(input.bucket)}/datatypes/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "r" => encode_query_value(input.r),
        "pr" => encode_query_value(input.pr),
        "w" => encode_query_value(input.w),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw),
        "returnbody" => encode_query_value(input.return_body),
        "include_context" => encode_query_value(input.include_context)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    extra_headers =
      [
        if(input.content_type != nil, do: {"Content-Type", to_string(input.content_type)}, else: nil),
      ]
      |> Enum.reject(&is_nil/1)

    headers = extra_headers
    body =
      case input.update do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#UpdateDatatype."
  @spec decode_update_datatype_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.UpdateDatatypeOutput.t()} | {:error, term()}
  def decode_update_datatype_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    crdt_context =
      headers
      |> List.keyfind("X-Riak-CRDT-Ctx", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.UpdateDatatypeOutput{
      content_type: content_type,
      crdt_context: crdt_context,
      body: body,
      status_code: http_status
    }}
  end

  def decode_update_datatype_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_update_datatype_response_error(status, headers, body)
  end

  @doc "Encode HTTP request for openriak.v3_4.api#UpdateLegacyCounter."
  @spec encode_update_legacy_counter_request(OpenRiakTypes.UpdateLegacyCounterInput.t()) :: %RuntimeTypes.HttpRequest{}
  def encode_update_legacy_counter_request(input) do
    path = "/buckets/#{uri_encode(input.bucket)}/counters/#{uri_encode(input.key)}"

    query =
      %{
        "timeout" => encode_query_value(input.timeout),
        "w" => encode_query_value(input.w),
        "pw" => encode_query_value(input.pw),
        "dw" => encode_query_value(input.dw),
        "returnvalue" => encode_query_value(input.return_value)
      }
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    headers = []
    body =
      case input.amount do
        nil -> ""
        value when is_binary(value) -> value
        value -> to_string(value)
      end

    %RuntimeTypes.HttpRequest{
      method: "POST",
      path: path,
      query: query,
      headers: headers,
      body: body
    }
  end

  @doc "Decode HTTP response for openriak.v3_4.api#UpdateLegacyCounter."
  @spec decode_update_legacy_counter_response(%RuntimeTypes.HttpResponse{}) :: {:ok, OpenRiakTypes.UpdateLegacyCounterOutput.t()} | {:error, term()}
  def decode_update_legacy_counter_response(%RuntimeTypes.HttpResponse{status: http_status, headers: headers, body: body})
      when http_status >= 200 and http_status < 300 do
    content_type =
      headers
      |> List.keyfind("Content-Type", 0)
      |> case do
        {_, v} -> v
        nil -> nil
      end

    {:ok, %Types.UpdateLegacyCounterOutput{
      content_type: content_type,
      body: body,
      status_code: http_status
    }}
  end

  def decode_update_legacy_counter_response(%RuntimeTypes.HttpResponse{status: status, headers: headers, body: body}) do
    decode_update_legacy_counter_response_error(status, headers, body)
  end

  # Error dispatch for openriak.v3_4.api#CreateDatatype
  defp decode_create_datatype_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_create_datatype_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_create_datatype_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_create_datatype_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_create_datatype_response_error(301, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MovedPermanentlyError, %{message: nil, location: nil})}
  end

  defp decode_create_datatype_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_create_datatype_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_create_datatype_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_create_datatype_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#CreateDefaultObject
  defp decode_create_default_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_create_default_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_create_default_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_create_default_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_create_default_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_create_default_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_create_default_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_create_default_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_create_default_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_create_default_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#CreateDefaultObjectReturnBody
  defp decode_create_default_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_create_default_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_create_default_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_create_default_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_create_default_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_create_default_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_create_default_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_create_default_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_create_default_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_create_default_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#CreateObject
  defp decode_create_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_create_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_create_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_create_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_create_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_create_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_create_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_create_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_create_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_create_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#CreateObjectReturnBody
  defp decode_create_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_create_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_create_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_create_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_create_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_create_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_create_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_create_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_create_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_create_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#DeleteDefaultObject
  defp decode_delete_default_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_delete_default_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_delete_default_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_delete_default_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_delete_default_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_delete_default_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_delete_default_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_delete_default_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_delete_default_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#DeleteLegacyObject
  defp decode_delete_legacy_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_delete_legacy_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_delete_legacy_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_delete_legacy_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_delete_legacy_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_delete_legacy_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_delete_legacy_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_delete_legacy_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_delete_legacy_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#DeleteObject
  defp decode_delete_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_delete_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_delete_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_delete_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_delete_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_delete_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_delete_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_delete_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_delete_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetBucketProperties
  defp decode_get_bucket_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_bucket_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_bucket_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_bucket_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_bucket_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetBucketQueryResults
  defp decode_get_bucket_query_results_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_query_results_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_bucket_query_results_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_bucket_query_results_response_error(410, _headers, _body) do
    {:error, struct!(OpenRiakTypes.GoneError, %{message: nil})}
  end

  defp decode_get_bucket_query_results_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_query_results_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_bucket_query_results_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_bucket_query_results_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetBucketTypeProperties
  defp decode_get_bucket_type_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_bucket_type_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDatatype
  defp decode_get_datatype_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_datatype_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_datatype_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_datatype_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_datatype_response_error(301, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MovedPermanentlyError, %{message: nil, location: nil})}
  end

  defp decode_get_datatype_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_datatype_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_datatype_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_datatype_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultBucketProperties
  defp decode_get_default_bucket_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_bucket_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultBucketQueryResults
  defp decode_get_default_bucket_query_results_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(410, _headers, _body) do
    {:error, struct!(OpenRiakTypes.GoneError, %{message: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_bucket_query_results_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultEraseKeys
  defp decode_get_default_erase_keys_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_erase_keys_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_erase_keys_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_erase_keys_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_erase_keys_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_erase_keys_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_erase_keys_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultFetchClocksRange
  defp decode_get_default_fetch_clocks_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_fetch_clocks_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_fetch_clocks_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_fetch_clocks_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_fetch_clocks_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_fetch_clocks_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_fetch_clocks_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultFindKeysByObjectSize
  defp decode_get_default_find_keys_by_object_size_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_find_keys_by_object_size_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_find_keys_by_object_size_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_find_keys_by_object_size_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_find_keys_by_object_size_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_find_keys_by_object_size_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_find_keys_by_object_size_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultFindKeysBySiblingCount
  defp decode_get_default_find_keys_by_sibling_count_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_find_keys_by_sibling_count_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_find_keys_by_sibling_count_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_find_keys_by_sibling_count_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_find_keys_by_sibling_count_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_find_keys_by_sibling_count_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_find_keys_by_sibling_count_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultFindTombs
  defp decode_get_default_find_tombs_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_find_tombs_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_find_tombs_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_find_tombs_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_find_tombs_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_find_tombs_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_find_tombs_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultMergeTreeRange
  defp decode_get_default_merge_tree_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_merge_tree_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_merge_tree_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_merge_tree_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_merge_tree_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_merge_tree_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_merge_tree_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultObject
  defp decode_get_default_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_default_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_get_default_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_default_object_response_error(300, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MultipleChoicesError, %{contentType: nil, vclock: nil, body: nil})}
  end

  defp decode_get_default_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultObjectStats
  defp decode_get_default_object_stats_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_object_stats_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_object_stats_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_object_stats_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_object_stats_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_object_stats_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_object_stats_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultReapTombs
  defp decode_get_default_reap_tombs_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_reap_tombs_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_reap_tombs_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_reap_tombs_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_reap_tombs_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_reap_tombs_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_reap_tombs_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultRepairKeysRange
  defp decode_get_default_repair_keys_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_repair_keys_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_repair_keys_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_repair_keys_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_repair_keys_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_repair_keys_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_repair_keys_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetDefaultReplKeysRange
  defp decode_get_default_repl_keys_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_default_repl_keys_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_repl_keys_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_default_repl_keys_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_default_repl_keys_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_default_repl_keys_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_default_repl_keys_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetEraseKeys
  defp decode_get_erase_keys_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_erase_keys_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_erase_keys_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_erase_keys_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_erase_keys_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_erase_keys_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_erase_keys_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetFetchClocksNval
  defp decode_get_fetch_clocks_nval_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_fetch_clocks_nval_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_fetch_clocks_nval_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_fetch_clocks_nval_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_fetch_clocks_nval_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_fetch_clocks_nval_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_fetch_clocks_nval_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetFetchClocksRange
  defp decode_get_fetch_clocks_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_fetch_clocks_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_fetch_clocks_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_fetch_clocks_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_fetch_clocks_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_fetch_clocks_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_fetch_clocks_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetFindKeysByObjectSize
  defp decode_get_find_keys_by_object_size_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_find_keys_by_object_size_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_find_keys_by_object_size_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_find_keys_by_object_size_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_find_keys_by_object_size_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_find_keys_by_object_size_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_find_keys_by_object_size_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetFindKeysBySiblingCount
  defp decode_get_find_keys_by_sibling_count_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_find_keys_by_sibling_count_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_find_keys_by_sibling_count_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_find_keys_by_sibling_count_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_find_keys_by_sibling_count_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_find_keys_by_sibling_count_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_find_keys_by_sibling_count_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetFindTombs
  defp decode_get_find_tombs_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_find_tombs_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_find_tombs_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_find_tombs_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_find_tombs_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_find_tombs_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_find_tombs_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetLegacyCounter
  defp decode_get_legacy_counter_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_counter_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_legacy_counter_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_legacy_counter_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_counter_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_counter_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_legacy_counter_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_legacy_counter_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetLegacyObject
  defp decode_get_legacy_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_legacy_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_legacy_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_get_legacy_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_object_response_error(300, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MultipleChoicesError, %{contentType: nil, vclock: nil, body: nil})}
  end

  defp decode_get_legacy_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_legacy_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_legacy_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_legacy_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetMapReduceUsage
  defp decode_get_map_reduce_usage_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_map_reduce_usage_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_map_reduce_usage_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_map_reduce_usage_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_map_reduce_usage_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetMembership
  defp decode_get_membership_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_membership_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_membership_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_membership_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_membership_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_membership_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_membership_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetMergeBranchNval
  defp decode_get_merge_branch_nval_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_merge_branch_nval_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_merge_branch_nval_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_merge_branch_nval_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_merge_branch_nval_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_merge_branch_nval_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_merge_branch_nval_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetMergeRootNval
  defp decode_get_merge_root_nval_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_merge_root_nval_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_merge_root_nval_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_merge_root_nval_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_merge_root_nval_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_merge_root_nval_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_merge_root_nval_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetMergeTreeRange
  defp decode_get_merge_tree_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_merge_tree_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_merge_tree_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_merge_tree_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_merge_tree_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_merge_tree_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_merge_tree_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetObject
  defp decode_get_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_get_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_object_response_error(300, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MultipleChoicesError, %{contentType: nil, vclock: nil, body: nil})}
  end

  defp decode_get_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetObjectStats
  defp decode_get_object_stats_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_object_stats_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_object_stats_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_object_stats_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_object_stats_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_object_stats_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_object_stats_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetQueueItem
  defp decode_get_queue_item_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_queue_item_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_queue_item_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_queue_item_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_get_queue_item_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_queue_item_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_queue_item_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_queue_item_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetReapTombs
  defp decode_get_reap_tombs_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_reap_tombs_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_reap_tombs_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_reap_tombs_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_reap_tombs_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_reap_tombs_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_reap_tombs_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetRepairKeysRange
  defp decode_get_repair_keys_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_repair_keys_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_repair_keys_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_repair_keys_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_repair_keys_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_repair_keys_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_repair_keys_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetReplKeysRange
  defp decode_get_repl_keys_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_repl_keys_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_repl_keys_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_repl_keys_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_repl_keys_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_repl_keys_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_repl_keys_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetRoot
  defp decode_get_root_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_root_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_root_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_root_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_root_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_root_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#GetStats
  defp decode_get_stats_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_get_stats_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_get_stats_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_get_stats_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_get_stats_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_get_stats_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_get_stats_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#HeadDefaultObject
  defp decode_head_default_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_head_default_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_head_default_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_head_default_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_head_default_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_head_default_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_head_default_object_response_error(300, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MultipleChoicesError, %{contentType: nil, vclock: nil, body: nil})}
  end

  defp decode_head_default_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_head_default_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_head_default_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_head_default_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#HeadLegacyObject
  defp decode_head_legacy_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_head_legacy_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_head_legacy_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_head_legacy_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_head_legacy_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_head_legacy_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_head_legacy_object_response_error(300, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MultipleChoicesError, %{contentType: nil, vclock: nil, body: nil})}
  end

  defp decode_head_legacy_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_head_legacy_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_head_legacy_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_head_legacy_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#HeadMapReduce
  defp decode_head_map_reduce_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_head_map_reduce_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_head_map_reduce_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_head_map_reduce_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_head_map_reduce_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#HeadObject
  defp decode_head_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_head_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_head_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_head_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_head_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_head_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_head_object_response_error(300, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MultipleChoicesError, %{contentType: nil, vclock: nil, body: nil})}
  end

  defp decode_head_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_head_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_head_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_head_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#HeadStats
  defp decode_head_stats_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_head_stats_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_head_stats_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_head_stats_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_head_stats_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_head_stats_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_head_stats_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#LinkWalk
  defp decode_link_walk_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_link_walk_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_link_walk_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_link_walk_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_link_walk_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_link_walk_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#LinkWalkDefault
  defp decode_link_walk_default_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_default_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_link_walk_default_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_link_walk_default_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_default_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_link_walk_default_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_default_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_link_walk_default_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_link_walk_default_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#LinkWalkLegacy
  defp decode_link_walk_legacy_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_legacy_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_link_walk_legacy_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_link_walk_legacy_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_legacy_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_link_walk_legacy_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_link_walk_legacy_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_link_walk_legacy_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_link_walk_legacy_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ListAaeBuckets
  defp decode_list_aae_buckets_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_list_aae_buckets_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_list_aae_buckets_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_list_aae_buckets_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_list_aae_buckets_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_list_aae_buckets_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_list_aae_buckets_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ListBuckets
  defp decode_list_buckets_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_list_buckets_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_list_buckets_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_list_buckets_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_list_buckets_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_list_buckets_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_list_buckets_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ListDefaultBuckets
  defp decode_list_default_buckets_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_list_default_buckets_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_list_default_buckets_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_list_default_buckets_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_list_default_buckets_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_list_default_buckets_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_list_default_buckets_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ListDefaultKeys
  defp decode_list_default_keys_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_list_default_keys_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_list_default_keys_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_list_default_keys_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_list_default_keys_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_list_default_keys_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_list_default_keys_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ListKeys
  defp decode_list_keys_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_list_keys_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_list_keys_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_list_keys_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_list_keys_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_list_keys_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_list_keys_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#MapReduce
  defp decode_map_reduce_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_map_reduce_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_map_reduce_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_map_reduce_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_map_reduce_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_map_reduce_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_map_reduce_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_map_reduce_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#MapReduceChunked
  defp decode_map_reduce_chunked_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_map_reduce_chunked_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_map_reduce_chunked_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_map_reduce_chunked_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_map_reduce_chunked_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_map_reduce_chunked_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_map_reduce_chunked_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_map_reduce_chunked_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#Ping
  defp decode_ping_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_ping_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_ping_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_ping_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_ping_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PostDefaultObject
  defp decode_post_default_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_post_default_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_post_default_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_post_default_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_post_default_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_post_default_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_post_default_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PostDefaultObjectReturnBody
  defp decode_post_default_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_post_default_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_post_default_object_return_body_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_post_default_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_post_default_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_post_default_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_post_default_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_post_default_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PostLegacyObject
  defp decode_post_legacy_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_post_legacy_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_post_legacy_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_post_legacy_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_post_legacy_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_post_legacy_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_post_legacy_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PostLegacyObjectReturnBody
  defp decode_post_legacy_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_post_legacy_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PostObject
  defp decode_post_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_post_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_post_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_post_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_post_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_post_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_post_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_post_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_post_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PostObjectReturnBody
  defp decode_post_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_post_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_post_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_post_object_return_body_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_post_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_post_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_post_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_post_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_post_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_post_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PushQueueItems
  defp decode_push_queue_items_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_push_queue_items_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_push_queue_items_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_push_queue_items_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_push_queue_items_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_push_queue_items_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_push_queue_items_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PutDefaultObject
  defp decode_put_default_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_put_default_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_put_default_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_put_default_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_put_default_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_put_default_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_put_default_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PutDefaultObjectReturnBody
  defp decode_put_default_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_put_default_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_put_default_object_return_body_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_put_default_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_put_default_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_put_default_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_put_default_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_put_default_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PutLegacyObject
  defp decode_put_legacy_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_put_legacy_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_put_legacy_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_put_legacy_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_put_legacy_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_put_legacy_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_put_legacy_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PutLegacyObjectReturnBody
  defp decode_put_legacy_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_put_legacy_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PutObject
  defp decode_put_object_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_put_object_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_put_object_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_put_object_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_object_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_put_object_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_object_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_put_object_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_put_object_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_put_object_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_put_object_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#PutObjectReturnBody
  defp decode_put_object_return_body_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_put_object_return_body_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_put_object_return_body_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_put_object_return_body_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_object_return_body_response_error(406, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotAcceptableError, %{message: nil})}
  end

  defp decode_put_object_return_body_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_put_object_return_body_response_error(412, _headers, _body) do
    {:error, struct!(OpenRiakTypes.PreconditionFailedError, %{message: nil, vclock: nil})}
  end

  defp decode_put_object_return_body_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_put_object_return_body_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_put_object_return_body_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_put_object_return_body_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#QueryDefaultSecondaryIndex
  defp decode_query_default_secondary_index_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_query_default_secondary_index_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_query_default_secondary_index_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_query_default_secondary_index_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_query_default_secondary_index_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_query_default_secondary_index_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_query_default_secondary_index_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#QueryDefaultSecondaryIndexRange
  defp decode_query_default_secondary_index_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_query_default_secondary_index_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_query_default_secondary_index_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_query_default_secondary_index_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_query_default_secondary_index_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_query_default_secondary_index_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_query_default_secondary_index_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#QuerySecondaryIndex
  defp decode_query_secondary_index_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_query_secondary_index_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_query_secondary_index_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_query_secondary_index_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_query_secondary_index_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_query_secondary_index_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_query_secondary_index_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#QuerySecondaryIndexRange
  defp decode_query_secondary_index_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_query_secondary_index_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_query_secondary_index_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_query_secondary_index_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_query_secondary_index_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_query_secondary_index_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_query_secondary_index_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ResetBucketProperties
  defp decode_reset_bucket_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_reset_bucket_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_reset_bucket_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_reset_bucket_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_reset_bucket_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_reset_bucket_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_reset_bucket_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_reset_bucket_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#ResetDefaultBucketProperties
  defp decode_reset_default_bucket_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_reset_default_bucket_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#RunBucketQuery
  defp decode_run_bucket_query_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_run_bucket_query_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_run_bucket_query_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_run_bucket_query_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_run_bucket_query_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_run_bucket_query_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_run_bucket_query_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#RunDefaultBucketQuery
  defp decode_run_default_bucket_query_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_run_default_bucket_query_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_run_default_bucket_query_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_run_default_bucket_query_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_run_default_bucket_query_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_run_default_bucket_query_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_run_default_bucket_query_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#SetBucketProperties
  defp decode_set_bucket_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_set_bucket_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_set_bucket_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_set_bucket_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_set_bucket_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_set_bucket_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_set_bucket_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_set_bucket_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#SetBucketTypeProperties
  defp decode_set_bucket_type_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_set_bucket_type_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#SetDefaultBucketProperties
  defp decode_set_default_bucket_properties_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_set_default_bucket_properties_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamBuckets
  defp decode_stream_buckets_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_buckets_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_buckets_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_buckets_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_buckets_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_buckets_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_buckets_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamDefaultBuckets
  defp decode_stream_default_buckets_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_buckets_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_buckets_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_default_buckets_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_buckets_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_buckets_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_default_buckets_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamDefaultKeys
  defp decode_stream_default_keys_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_keys_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_keys_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_default_keys_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_keys_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_keys_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_default_keys_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamDefaultSecondaryIndex
  defp decode_stream_default_secondary_index_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_secondary_index_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_secondary_index_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_default_secondary_index_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_secondary_index_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_secondary_index_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_default_secondary_index_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamDefaultSecondaryIndexRange
  defp decode_stream_default_secondary_index_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_secondary_index_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_secondary_index_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_default_secondary_index_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_default_secondary_index_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_default_secondary_index_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_default_secondary_index_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamKeys
  defp decode_stream_keys_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_keys_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_keys_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_keys_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_keys_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_keys_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_keys_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamSecondaryIndex
  defp decode_stream_secondary_index_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_secondary_index_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_secondary_index_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_secondary_index_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_secondary_index_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_secondary_index_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_secondary_index_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#StreamSecondaryIndexRange
  defp decode_stream_secondary_index_range_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_stream_secondary_index_range_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_secondary_index_range_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_stream_secondary_index_range_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_stream_secondary_index_range_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_stream_secondary_index_range_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_stream_secondary_index_range_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#UpdateDatatype
  defp decode_update_datatype_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_update_datatype_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_update_datatype_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_update_datatype_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_update_datatype_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_update_datatype_response_error(301, _headers, _body) do
    {:error, struct!(OpenRiakTypes.MovedPermanentlyError, %{message: nil, location: nil})}
  end

  defp decode_update_datatype_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_update_datatype_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_update_datatype_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_update_datatype_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # Error dispatch for openriak.v3_4.api#UpdateLegacyCounter
  defp decode_update_legacy_counter_response_error(400, _headers, _body) do
    {:error, struct!(OpenRiakTypes.BadRequestError, %{message: nil, contentType: nil, riakHeaders: nil})}
  end

  defp decode_update_legacy_counter_response_error(401, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UnauthorizedError, %{contentType: nil, message: nil})}
  end

  defp decode_update_legacy_counter_response_error(403, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ForbiddenError, %{message: nil})}
  end

  defp decode_update_legacy_counter_response_error(404, _headers, _body) do
    {:error, struct!(OpenRiakTypes.NotFoundError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_update_legacy_counter_response_error(409, _headers, _body) do
    {:error, struct!(OpenRiakTypes.ConflictError, %{message: nil, riakHeaders: nil})}
  end

  defp decode_update_legacy_counter_response_error(503, _headers, _body) do
    {:error, struct!(OpenRiakTypes.TimeoutError, %{message: nil, retryAfter: nil, riakHeaders: nil})}
  end

  defp decode_update_legacy_counter_response_error(426, _headers, _body) do
    {:error, struct!(OpenRiakTypes.UpgradeRequiredError, %{contentType: nil, message: nil})}
  end

  defp decode_update_legacy_counter_response_error(500, _headers, _body) do
    {:error, struct!(OpenRiakTypes.InternalServerError, %{message: nil})}
  end

  defp decode_update_legacy_counter_response_error(status, _headers, body) do
    {:error, {:unknown_error, status, body}}
  end

  # -- Private helpers --

  defp uri_encode(value), do: URI.encode(to_string(value))

  defp encode_query_value(nil), do: nil
  defp encode_query_value(true), do: "true"
  defp encode_query_value(false), do: "false"
  defp encode_query_value(value) when is_integer(value), do: Integer.to_string(value)
  defp encode_query_value(value) when is_float(value), do: Float.to_string(value)
  defp encode_query_value(value) when is_binary(value), do: value
  defp encode_query_value(value) when is_atom(value), do: Atom.to_string(value)
  defp encode_query_value(value), do: to_string(value)

  defp prefix_headers_to_list(_prefix, nil), do: []
  defp prefix_headers_to_list(prefix, map) when is_map(map) do
    Enum.map(map, fn {k, v} -> {prefix <> k, to_string(v)} end)
  end

  defp prefix_headers_from_list(headers, prefix) do
    headers
    |> Enum.filter(fn {name, _} -> String.starts_with?(name, prefix) end)
    |> Map.new(fn {name, val} -> {String.slice(name, byte_size(prefix)..-1//1), val} end)
    |> case do
      map when map == %{} -> nil
      map -> map
    end
  end

end
