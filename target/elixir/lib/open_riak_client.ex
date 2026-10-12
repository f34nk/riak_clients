defmodule OpenRiakClient do
  @moduledoc """
  Generated Elixir client for openriak.v3_4.api#OpenRiak.

  Operation stubs accept config and input. Transport and protocol are not generated here.
  """

  alias OpenRiakTypes, as: Types

  # Client configuration is intentionally opaque at this layer; endpoint, transport, and protocol live in future runtime modules.

  @type client_config :: map()

  @doc "HTTP request bindings for openriak.v3_4.api#CreateDatatype:
  bucket @ LABEL
  r @ QUERY
  pr @ QUERY
  includeContext @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  pw @ QUERY
  returnBody @ QUERY
  update @ PAYLOAD
  contentType @ HEADER
  timeout @ QUERY"
  @spec create_datatype(client_config(), OpenRiakTypes.CreateDatatypeInput.t()) :: {:ok, OpenRiakTypes.CreateDatatypeOutput.t()}
    | {:error, term()}
  def create_datatype(config, input) do
    req = OpenRiakHttp.encode_create_datatype_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_create_datatype_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#CreateDefaultObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER"
  @spec create_default_object(client_config(), OpenRiakTypes.CreateDefaultObjectOperationInput.t()) :: {:ok, OpenRiakTypes.CreateDefaultObjectOutput.t()}
    | {:error, term()}
  def create_default_object(config, input) do
    req = OpenRiakHttp.encode_create_default_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_create_default_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#CreateDefaultObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER"
  @spec create_default_object_return_body(client_config(), OpenRiakTypes.CreateDefaultObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.CreateDefaultObjectReturnBodyOutput.t()}
    | {:error, term()}
  def create_default_object_return_body(config, input) do
    req = OpenRiakHttp.encode_create_default_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_create_default_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#CreateObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER"
  @spec create_object(client_config(), OpenRiakTypes.CreateObjectOperationInput.t()) :: {:ok, OpenRiakTypes.CreateObjectOperationOutput.t()}
    | {:error, term()}
  def create_object(config, input) do
    req = OpenRiakHttp.encode_create_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_create_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#CreateObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER"
  @spec create_object_return_body(client_config(), OpenRiakTypes.CreateObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.CreateObjectReturnBodyOperationOutput.t()}
    | {:error, term()}
  def create_object_return_body(config, input) do
    req = OpenRiakHttp.encode_create_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_create_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#DeleteDefaultObject:
  pr @ QUERY
  rw @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  r @ QUERY
  dw @ QUERY
  w @ QUERY
  key @ LABEL"
  @spec delete_default_object(client_config(), OpenRiakTypes.DeleteDefaultObjectOperationInput.t()) :: {:ok, OpenRiakTypes.DeleteDefaultObjectOutput.t()}
    | {:error, term()}
  def delete_default_object(config, input) do
    req = OpenRiakHttp.encode_delete_default_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_delete_default_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#DeleteLegacyObject:
  pr @ QUERY
  rw @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  r @ QUERY
  dw @ QUERY
  w @ QUERY
  key @ LABEL"
  @spec delete_legacy_object(client_config(), OpenRiakTypes.DeleteLegacyObjectInput.t()) :: {:ok, OpenRiakTypes.DeleteLegacyObjectOutput.t()}
    | {:error, term()}
  def delete_legacy_object(config, input) do
    req = OpenRiakHttp.encode_delete_legacy_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_delete_legacy_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#DeleteObject:
  pr @ QUERY
  rw @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  r @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  key @ LABEL"
  @spec delete_object(client_config(), OpenRiakTypes.DeleteObjectInput.t()) :: {:ok, OpenRiakTypes.DeleteObjectOutput.t()}
    | {:error, term()}
  def delete_object(config, input) do
    req = OpenRiakHttp.encode_delete_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_delete_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Response body uses a props envelope: {'props': {...}}.
HTTP request bindings for openriak.v3_4.api#GetBucketProperties:
  bucket @ LABEL
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_bucket_properties(client_config(), OpenRiakTypes.GetBucketPropertiesInput.t()) :: {:ok, OpenRiakTypes.GetBucketPropertiesOutput.t()}
    | {:error, term()}
  def get_bucket_properties(config, input) do
    req = OpenRiakHttp.encode_get_bucket_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_bucket_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetBucketQueryResults:
  bucket @ LABEL
  bucketType @ LABEL
  resultQueue @ QUERY
  maxResults @ QUERY
  timeout @ QUERY"
  @spec get_bucket_query_results(client_config(), OpenRiakTypes.GetBucketQueryResultsInput.t()) :: {:ok, OpenRiakTypes.GetBucketQueryResultsOutput.t()}
    | {:error, term()}
  def get_bucket_query_results(config, input) do
    req = OpenRiakHttp.encode_get_bucket_query_results_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_bucket_query_results_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Response body uses a props envelope: {'props': {...}}.
HTTP request bindings for openriak.v3_4.api#GetBucketTypeProperties:
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_bucket_type_properties(client_config(), OpenRiakTypes.GetBucketTypePropertiesInput.t()) :: {:ok, OpenRiakTypes.GetBucketTypePropertiesOutput.t()}
    | {:error, term()}
  def get_bucket_type_properties(config, input) do
    req = OpenRiakHttp.encode_get_bucket_type_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_bucket_type_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDatatype:
  bucket @ LABEL
  r @ QUERY
  pr @ QUERY
  includeContext @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  pw @ QUERY
  returnBody @ QUERY
  key @ LABEL
  timeout @ QUERY"
  @spec get_datatype(client_config(), OpenRiakTypes.GetDatatypeInput.t()) :: {:ok, OpenRiakTypes.GetDatatypeOutput.t()}
    | {:error, term()}
  def get_datatype(config, input) do
    req = OpenRiakHttp.encode_get_datatype_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_datatype_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Response body uses a props envelope: {'props': {...}}.
HTTP request bindings for openriak.v3_4.api#GetDefaultBucketProperties:
  bucket @ LABEL
  timeout @ QUERY"
  @spec get_default_bucket_properties(client_config(), OpenRiakTypes.GetDefaultBucketPropertiesInput.t()) :: {:ok, OpenRiakTypes.GetDefaultBucketPropertiesOutput.t()}
    | {:error, term()}
  def get_default_bucket_properties(config, input) do
    req = OpenRiakHttp.encode_get_default_bucket_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_bucket_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultBucketQueryResults:
  bucket @ LABEL
  resultQueue @ QUERY
  maxResults @ QUERY
  timeout @ QUERY"
  @spec get_default_bucket_query_results(client_config(), OpenRiakTypes.GetDefaultBucketQueryResultsInput.t()) :: {:ok, OpenRiakTypes.GetDefaultBucketQueryResultsOutput.t()}
    | {:error, term()}
  def get_default_bucket_query_results(config, input) do
    req = OpenRiakHttp.encode_get_default_bucket_query_results_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_bucket_query_results_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultEraseKeys:
  bucket @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_default_erase_keys(client_config(), OpenRiakTypes.GetDefaultEraseKeysInput.t()) :: {:ok, OpenRiakTypes.GetDefaultEraseKeysOutput.t()}
    | {:error, term()}
  def get_default_erase_keys(config, input) do
    req = OpenRiakHttp.encode_get_default_erase_keys_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_erase_keys_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultFetchClocksRange:
  bucket @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_default_fetch_clocks_range(client_config(), OpenRiakTypes.GetDefaultFetchClocksRangeInput.t()) :: {:ok, OpenRiakTypes.GetDefaultFetchClocksRangeOutput.t()}
    | {:error, term()}
  def get_default_fetch_clocks_range(config, input) do
    req = OpenRiakHttp.encode_get_default_fetch_clocks_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_fetch_clocks_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultFindKeysByObjectSize:
  bucket @ LABEL
  filter @ QUERY
  size @ LABEL
  timeout @ QUERY"
  @spec get_default_find_keys_by_object_size(client_config(), OpenRiakTypes.GetDefaultFindKeysByObjectSizeInput.t()) :: {:ok, OpenRiakTypes.GetDefaultFindKeysByObjectSizeOutput.t()}
    | {:error, term()}
  def get_default_find_keys_by_object_size(config, input) do
    req = OpenRiakHttp.encode_get_default_find_keys_by_object_size_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_find_keys_by_object_size_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultFindKeysBySiblingCount:
  bucket @ LABEL
  filter @ QUERY
  count @ LABEL
  timeout @ QUERY"
  @spec get_default_find_keys_by_sibling_count(client_config(), OpenRiakTypes.GetDefaultFindKeysBySiblingCountInput.t()) :: {:ok, OpenRiakTypes.GetDefaultFindKeysBySiblingCountOutput.t()}
    | {:error, term()}
  def get_default_find_keys_by_sibling_count(config, input) do
    req = OpenRiakHttp.encode_get_default_find_keys_by_sibling_count_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_find_keys_by_sibling_count_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultFindTombs:
  bucket @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_default_find_tombs(client_config(), OpenRiakTypes.GetDefaultFindTombsInput.t()) :: {:ok, OpenRiakTypes.GetDefaultFindTombsOutput.t()}
    | {:error, term()}
  def get_default_find_tombs(config, input) do
    req = OpenRiakHttp.encode_get_default_find_tombs_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_find_tombs_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultMergeTreeRange:
  bucket @ LABEL
  filter @ QUERY
  treeSize @ LABEL
  timeout @ QUERY"
  @spec get_default_merge_tree_range(client_config(), OpenRiakTypes.GetDefaultMergeTreeRangeInput.t()) :: {:ok, OpenRiakTypes.GetDefaultMergeTreeRangeOutput.t()}
    | {:error, term()}
  def get_default_merge_tree_range(config, input) do
    req = OpenRiakHttp.encode_get_default_merge_tree_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_merge_tree_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
HTTP request bindings for openriak.v3_4.api#GetDefaultObject:
  nodeConfirms @ QUERY
  pr @ QUERY
  notfoundOk @ QUERY
  ifModifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  accept @ HEADER
  bucket @ LABEL
  r @ QUERY
  basicQuorum @ QUERY
  vtag @ QUERY
  deletedVClock @ QUERY
  key @ LABEL"
  @spec get_default_object(client_config(), OpenRiakTypes.GetDefaultObjectOperationInput.t()) :: {:ok, OpenRiakTypes.GetDefaultObjectOutput.t()}
    | {:error, term()}
  def get_default_object(config, input) do
    req = OpenRiakHttp.encode_get_default_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultObjectStats:
  bucket @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_default_object_stats(client_config(), OpenRiakTypes.GetDefaultObjectStatsInput.t()) :: {:ok, OpenRiakTypes.GetDefaultObjectStatsOutput.t()}
    | {:error, term()}
  def get_default_object_stats(config, input) do
    req = OpenRiakHttp.encode_get_default_object_stats_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_object_stats_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultReapTombs:
  bucket @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_default_reap_tombs(client_config(), OpenRiakTypes.GetDefaultReapTombsInput.t()) :: {:ok, OpenRiakTypes.GetDefaultReapTombsOutput.t()}
    | {:error, term()}
  def get_default_reap_tombs(config, input) do
    req = OpenRiakHttp.encode_get_default_reap_tombs_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_reap_tombs_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultRepairKeysRange:
  bucket @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_default_repair_keys_range(client_config(), OpenRiakTypes.GetDefaultRepairKeysRangeInput.t()) :: {:ok, OpenRiakTypes.GetDefaultRepairKeysRangeOutput.t()}
    | {:error, term()}
  def get_default_repair_keys_range(config, input) do
    req = OpenRiakHttp.encode_get_default_repair_keys_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_repair_keys_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetDefaultReplKeysRange:
  bucket @ LABEL
  filter @ QUERY
  queueName @ LABEL
  timeout @ QUERY"
  @spec get_default_repl_keys_range(client_config(), OpenRiakTypes.GetDefaultReplKeysRangeInput.t()) :: {:ok, OpenRiakTypes.GetDefaultReplKeysRangeOutput.t()}
    | {:error, term()}
  def get_default_repl_keys_range(config, input) do
    req = OpenRiakHttp.encode_get_default_repl_keys_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_default_repl_keys_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetEraseKeys:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_erase_keys(client_config(), OpenRiakTypes.GetEraseKeysInput.t()) :: {:ok, OpenRiakTypes.GetEraseKeysOutput.t()}
    | {:error, term()}
  def get_erase_keys(config, input) do
    req = OpenRiakHttp.encode_get_erase_keys_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_erase_keys_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetFetchClocksNval:
  nVal @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_fetch_clocks_nval(client_config(), OpenRiakTypes.GetFetchClocksNvalInput.t()) :: {:ok, OpenRiakTypes.GetFetchClocksNvalOutput.t()}
    | {:error, term()}
  def get_fetch_clocks_nval(config, input) do
    req = OpenRiakHttp.encode_get_fetch_clocks_nval_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_fetch_clocks_nval_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetFetchClocksRange:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_fetch_clocks_range(client_config(), OpenRiakTypes.GetFetchClocksRangeInput.t()) :: {:ok, OpenRiakTypes.GetFetchClocksRangeOutput.t()}
    | {:error, term()}
  def get_fetch_clocks_range(config, input) do
    req = OpenRiakHttp.encode_get_fetch_clocks_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_fetch_clocks_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetFindKeysByObjectSize:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  size @ LABEL
  timeout @ QUERY"
  @spec get_find_keys_by_object_size(client_config(), OpenRiakTypes.GetFindKeysByObjectSizeInput.t()) :: {:ok, OpenRiakTypes.GetFindKeysByObjectSizeOutput.t()}
    | {:error, term()}
  def get_find_keys_by_object_size(config, input) do
    req = OpenRiakHttp.encode_get_find_keys_by_object_size_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_find_keys_by_object_size_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetFindKeysBySiblingCount:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  count @ LABEL
  timeout @ QUERY"
  @spec get_find_keys_by_sibling_count(client_config(), OpenRiakTypes.GetFindKeysBySiblingCountInput.t()) :: {:ok, OpenRiakTypes.GetFindKeysBySiblingCountOutput.t()}
    | {:error, term()}
  def get_find_keys_by_sibling_count(config, input) do
    req = OpenRiakHttp.encode_get_find_keys_by_sibling_count_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_find_keys_by_sibling_count_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetFindTombs:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_find_tombs(client_config(), OpenRiakTypes.GetFindTombsInput.t()) :: {:ok, OpenRiakTypes.GetFindTombsOutput.t()}
    | {:error, term()}
  def get_find_tombs(config, input) do
    req = OpenRiakHttp.encode_get_find_tombs_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_find_tombs_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#GetLegacyCounter:
  bucket @ LABEL
  nodeConfirms @ QUERY
  r @ QUERY
  pr @ QUERY
  basicQuorum @ QUERY
  deletedVClock @ QUERY
  notfoundOk @ QUERY
  key @ LABEL
  timeout @ QUERY"
  @spec get_legacy_counter(client_config(), OpenRiakTypes.GetLegacyCounterInput.t()) :: {:ok, OpenRiakTypes.GetLegacyCounterOutput.t()}
    | {:error, term()}
  def get_legacy_counter(config, input) do
    req = OpenRiakHttp.encode_get_legacy_counter_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_legacy_counter_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
HTTP request bindings for openriak.v3_4.api#GetLegacyObject:
  nodeConfirms @ QUERY
  pr @ QUERY
  notfoundOk @ QUERY
  ifModifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  accept @ HEADER
  bucket @ LABEL
  r @ QUERY
  basicQuorum @ QUERY
  vtag @ QUERY
  deletedVClock @ QUERY
  key @ LABEL"
  @spec get_legacy_object(client_config(), OpenRiakTypes.GetLegacyObjectInput.t()) :: {:ok, OpenRiakTypes.GetLegacyObjectOutput.t()}
    | {:error, term()}
  def get_legacy_object(config, input) do
    req = OpenRiakHttp.encode_get_legacy_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_legacy_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries."
  @spec get_map_reduce_usage(client_config(), OpenRiakTypes.GetMapReduceUsageInput.t()) :: {:ok, OpenRiakTypes.GetMapReduceUsageOutput.t()}
    | {:error, term()}
  def get_map_reduce_usage(config, input) do
    req = OpenRiakHttp.encode_get_map_reduce_usage_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_map_reduce_usage_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetMembership:
  timeout @ QUERY"
  @spec get_membership(client_config(), OpenRiakTypes.GetMembershipInput.t()) :: {:ok, OpenRiakTypes.GetMembershipOutput.t()}
    | {:error, term()}
  def get_membership(config, input) do
    req = OpenRiakHttp.encode_get_membership_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_membership_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetMergeBranchNval:
  nVal @ LABEL
  filter @ QUERY
  timeout @ QUERY"
  @spec get_merge_branch_nval(client_config(), OpenRiakTypes.GetMergeBranchNvalInput.t()) :: {:ok, OpenRiakTypes.GetMergeBranchNvalOutput.t()}
    | {:error, term()}
  def get_merge_branch_nval(config, input) do
    req = OpenRiakHttp.encode_get_merge_branch_nval_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_merge_branch_nval_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetMergeRootNval:
  nVal @ LABEL
  timeout @ QUERY"
  @spec get_merge_root_nval(client_config(), OpenRiakTypes.GetMergeRootNvalInput.t()) :: {:ok, OpenRiakTypes.GetMergeRootNvalOutput.t()}
    | {:error, term()}
  def get_merge_root_nval(config, input) do
    req = OpenRiakHttp.encode_get_merge_root_nval_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_merge_root_nval_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetMergeTreeRange:
  bucket @ LABEL
  filter @ QUERY
  treeSize @ LABEL
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_merge_tree_range(client_config(), OpenRiakTypes.GetMergeTreeRangeInput.t()) :: {:ok, OpenRiakTypes.GetMergeTreeRangeOutput.t()}
    | {:error, term()}
  def get_merge_tree_range(config, input) do
    req = OpenRiakHttp.encode_get_merge_tree_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_merge_tree_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
HTTP request bindings for openriak.v3_4.api#GetObject:
  nodeConfirms @ QUERY
  pr @ QUERY
  notfoundOk @ QUERY
  ifModifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  accept @ HEADER
  bucket @ LABEL
  r @ QUERY
  basicQuorum @ QUERY
  bucketType @ LABEL
  vtag @ QUERY
  deletedVClock @ QUERY
  key @ LABEL"
  @spec get_object(client_config(), OpenRiakTypes.GetObjectInput.t()) :: {:ok, OpenRiakTypes.GetObjectOutput.t()}
    | {:error, term()}
  def get_object(config, input) do
    req = OpenRiakHttp.encode_get_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetObjectStats:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_object_stats(client_config(), OpenRiakTypes.GetObjectStatsInput.t()) :: {:ok, OpenRiakTypes.GetObjectStatsOutput.t()}
    | {:error, term()}
  def get_object_stats(config, input) do
    req = OpenRiakHttp.encode_get_object_stats_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_object_stats_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetQueueItem:
  objectFormat @ QUERY
  queueName @ LABEL"
  @spec get_queue_item(client_config(), OpenRiakTypes.GetQueueItemInput.t()) :: {:ok, OpenRiakTypes.GetQueueItemOutput.t()}
    | {:error, term()}
  def get_queue_item(config, input) do
    req = OpenRiakHttp.encode_get_queue_item_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_queue_item_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetReapTombs:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_reap_tombs(client_config(), OpenRiakTypes.GetReapTombsInput.t()) :: {:ok, OpenRiakTypes.GetReapTombsOutput.t()}
    | {:error, term()}
  def get_reap_tombs(config, input) do
    req = OpenRiakHttp.encode_get_reap_tombs_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_reap_tombs_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetRepairKeysRange:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  timeout @ QUERY"
  @spec get_repair_keys_range(client_config(), OpenRiakTypes.GetRepairKeysRangeInput.t()) :: {:ok, OpenRiakTypes.GetRepairKeysRangeOutput.t()}
    | {:error, term()}
  def get_repair_keys_range(config, input) do
    req = OpenRiakHttp.encode_get_repair_keys_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_repair_keys_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetReplKeysRange:
  bucket @ LABEL
  filter @ QUERY
  bucketType @ LABEL
  queueName @ LABEL
  timeout @ QUERY"
  @spec get_repl_keys_range(client_config(), OpenRiakTypes.GetReplKeysRangeInput.t()) :: {:ok, OpenRiakTypes.GetReplKeysRangeOutput.t()}
    | {:error, term()}
  def get_repl_keys_range(config, input) do
    req = OpenRiakHttp.encode_get_repl_keys_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_repl_keys_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetRoot:
  accept @ HEADER"
  @spec get_root(client_config(), OpenRiakTypes.GetRootInput.t()) :: {:ok, OpenRiakTypes.GetRootOutput.t()}
    | {:error, term()}
  def get_root(config, input) do
    req = OpenRiakHttp.encode_get_root_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_root_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#GetStats:
  timeout @ QUERY
  accept @ HEADER"
  @spec get_stats(client_config(), OpenRiakTypes.GetStatsInput.t()) :: {:ok, OpenRiakTypes.GetStatsOutput.t()}
    | {:error, term()}
  def get_stats(config, input) do
    req = OpenRiakHttp.encode_get_stats_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_get_stats_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
HTTP request bindings for openriak.v3_4.api#HeadDefaultObject:
  nodeConfirms @ QUERY
  pr @ QUERY
  notfoundOk @ QUERY
  ifModifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  accept @ HEADER
  bucket @ LABEL
  r @ QUERY
  basicQuorum @ QUERY
  vtag @ QUERY
  deletedVClock @ QUERY
  key @ LABEL"
  @spec head_default_object(client_config(), OpenRiakTypes.HeadDefaultObjectOperationInput.t()) :: {:ok, OpenRiakTypes.HeadDefaultObjectOutput.t()}
    | {:error, term()}
  def head_default_object(config, input) do
    req = OpenRiakHttp.encode_head_default_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_head_default_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
HTTP request bindings for openriak.v3_4.api#HeadLegacyObject:
  nodeConfirms @ QUERY
  pr @ QUERY
  notfoundOk @ QUERY
  ifModifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  accept @ HEADER
  bucket @ LABEL
  r @ QUERY
  basicQuorum @ QUERY
  vtag @ QUERY
  deletedVClock @ QUERY
  key @ LABEL"
  @spec head_legacy_object(client_config(), OpenRiakTypes.HeadLegacyObjectInput.t()) :: {:ok, OpenRiakTypes.HeadLegacyObjectOutput.t()}
    | {:error, term()}
  def head_legacy_object(config, input) do
    req = OpenRiakHttp.encode_head_legacy_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_head_legacy_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries."
  @spec head_map_reduce(client_config(), OpenRiakTypes.HeadMapReduceInput.t()) :: {:ok, OpenRiakTypes.HeadMapReduceOutput.t()}
    | {:error, term()}
  def head_map_reduce(config, input) do
    req = OpenRiakHttp.encode_head_map_reduce_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_head_map_reduce_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
HTTP request bindings for openriak.v3_4.api#HeadObject:
  nodeConfirms @ QUERY
  pr @ QUERY
  notfoundOk @ QUERY
  ifModifiedSince @ HEADER
  timeout @ QUERY
  ifNoneMatch @ HEADER
  accept @ HEADER
  bucket @ LABEL
  r @ QUERY
  basicQuorum @ QUERY
  bucketType @ LABEL
  vtag @ QUERY
  deletedVClock @ QUERY
  key @ LABEL"
  @spec head_object(client_config(), OpenRiakTypes.HeadObjectInput.t()) :: {:ok, OpenRiakTypes.HeadObjectOperationOutput.t()}
    | {:error, term()}
  def head_object(config, input) do
    req = OpenRiakHttp.encode_head_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_head_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#HeadStats:
  timeout @ QUERY
  accept @ HEADER"
  @spec head_stats(client_config(), OpenRiakTypes.HeadStatsInput.t()) :: {:ok, OpenRiakTypes.HeadStatsOutput.t()}
    | {:error, term()}
  def head_stats(config, input) do
    req = OpenRiakHttp.encode_head_stats_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_head_stats_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#LinkWalk:
  bucket @ LABEL
  bucketType @ LABEL
  key @ LABEL
  walk @ LABEL"
  @spec link_walk(client_config(), OpenRiakTypes.LinkWalkInput.t()) :: {:ok, OpenRiakTypes.LinkWalkOutput.t()}
    | {:error, term()}
  def link_walk(config, input) do
    req = OpenRiakHttp.encode_link_walk_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_link_walk_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#LinkWalkDefault:
  bucket @ LABEL
  key @ LABEL
  walk @ LABEL"
  @spec link_walk_default(client_config(), OpenRiakTypes.LinkWalkDefaultOperationInput.t()) :: {:ok, OpenRiakTypes.LinkWalkDefaultOutput.t()}
    | {:error, term()}
  def link_walk_default(config, input) do
    req = OpenRiakHttp.encode_link_walk_default_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_link_walk_default_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#LinkWalkLegacy:
  bucket @ LABEL
  key @ LABEL
  walk @ LABEL"
  @spec link_walk_legacy(client_config(), OpenRiakTypes.LinkWalkLegacyInput.t()) :: {:ok, OpenRiakTypes.LinkWalkLegacyOutput.t()}
    | {:error, term()}
  def link_walk_legacy(config, input) do
    req = OpenRiakHttp.encode_link_walk_legacy_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_link_walk_legacy_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#ListAaeBuckets:
  nval @ QUERY
  timeout @ QUERY"
  @spec list_aae_buckets(client_config(), OpenRiakTypes.ListAaeBucketsInput.t()) :: {:ok, OpenRiakTypes.ListAaeBucketsOutput.t()}
    | {:error, term()}
  def list_aae_buckets(config, input) do
    req = OpenRiakHttp.encode_list_aae_buckets_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_list_aae_buckets_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
HTTP request bindings for openriak.v3_4.api#ListBuckets:
  bucketType @ LABEL
  timeout @ QUERY"
  @spec list_buckets(client_config(), OpenRiakTypes.ListBucketsOperationInput.t()) :: {:ok, OpenRiakTypes.ListBucketsOutput.t()}
    | {:error, term()}
  def list_buckets(config, input) do
    req = OpenRiakHttp.encode_list_buckets_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_list_buckets_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
HTTP request bindings for openriak.v3_4.api#ListDefaultBuckets:
  timeout @ QUERY"
  @spec list_default_buckets(client_config(), OpenRiakTypes.ListDefaultBucketsInput.t()) :: {:ok, OpenRiakTypes.ListDefaultBucketsOutput.t()}
    | {:error, term()}
  def list_default_buckets(config, input) do
    req = OpenRiakHttp.encode_list_default_buckets_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_list_default_buckets_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
HTTP request bindings for openriak.v3_4.api#ListDefaultKeys:
  bucket @ LABEL
  timeout @ QUERY
  props @ QUERY"
  @spec list_default_keys(client_config(), OpenRiakTypes.ListDefaultKeysOperationInput.t()) :: {:ok, OpenRiakTypes.ListDefaultKeysOutput.t()}
    | {:error, term()}
  def list_default_keys(config, input) do
    req = OpenRiakHttp.encode_list_default_keys_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_list_default_keys_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
HTTP request bindings for openriak.v3_4.api#ListKeys:
  bucket @ LABEL
  bucketType @ LABEL
  timeout @ QUERY
  props @ QUERY"
  @spec list_keys(client_config(), OpenRiakTypes.ListKeysOperationInput.t()) :: {:ok, OpenRiakTypes.ListKeysOutput.t()}
    | {:error, term()}
  def list_keys(config, input) do
    req = OpenRiakHttp.encode_list_keys_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_list_keys_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
HTTP request bindings for openriak.v3_4.api#MapReduce:
  request @ PAYLOAD
  contentType @ HEADER
  accept @ HEADER"
  @spec map_reduce(client_config(), OpenRiakTypes.MapReduceOperationInput.t()) :: {:ok, OpenRiakTypes.MapReduceOutput.t()}
    | {:error, term()}
  def map_reduce(config, input) do
    req = OpenRiakHttp.encode_map_reduce_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_map_reduce_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
HTTP request bindings for openriak.v3_4.api#MapReduceChunked:
  request @ PAYLOAD
  contentType @ HEADER
  accept @ HEADER"
  @spec map_reduce_chunked(client_config(), OpenRiakTypes.MapReduceChunkedInput.t()) :: {:ok, OpenRiakTypes.MapReduceChunkedOutput.t()}
    | {:error, term()}
  def map_reduce_chunked(config, input) do
    req = OpenRiakHttp.encode_map_reduce_chunked_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_map_reduce_chunked_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @spec ping(client_config(), OpenRiakTypes.PingInput.t()) :: {:ok, OpenRiakTypes.PingOutput.t()}
    | {:error, term()}
  def ping(config, input) do
    req = OpenRiakHttp.encode_ping_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_ping_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PostDefaultObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec post_default_object(client_config(), OpenRiakTypes.PostDefaultObjectInput.t()) :: {:ok, OpenRiakTypes.PostDefaultObjectOutput.t()}
    | {:error, term()}
  def post_default_object(config, input) do
    req = OpenRiakHttp.encode_post_default_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_post_default_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PostDefaultObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec post_default_object_return_body(client_config(), OpenRiakTypes.PostDefaultObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.PostDefaultObjectReturnBodyOutput.t()}
    | {:error, term()}
  def post_default_object_return_body(config, input) do
    req = OpenRiakHttp.encode_post_default_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_post_default_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#PostLegacyObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec post_legacy_object(client_config(), OpenRiakTypes.PostLegacyObjectInput.t()) :: {:ok, OpenRiakTypes.PostLegacyObjectOutput.t()}
    | {:error, term()}
  def post_legacy_object(config, input) do
    req = OpenRiakHttp.encode_post_legacy_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_post_legacy_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#PostLegacyObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec post_legacy_object_return_body(client_config(), OpenRiakTypes.PostLegacyObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.PostLegacyObjectReturnBodyOutput.t()}
    | {:error, term()}
  def post_legacy_object_return_body(config, input) do
    req = OpenRiakHttp.encode_post_legacy_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_post_legacy_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PostObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec post_object(client_config(), OpenRiakTypes.PostObjectInput.t()) :: {:ok, OpenRiakTypes.PostObjectOutput.t()}
    | {:error, term()}
  def post_object(config, input) do
    req = OpenRiakHttp.encode_post_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_post_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PostObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec post_object_return_body(client_config(), OpenRiakTypes.PostObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.PostObjectReturnBodyOutput.t()}
    | {:error, term()}
  def post_object_return_body(config, input) do
    req = OpenRiakHttp.encode_post_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_post_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PushQueueItems:
  queueName @ LABEL
  contentType @ HEADER
  keysClocks @ PAYLOAD"
  @spec push_queue_items(client_config(), OpenRiakTypes.PushQueueItemsInput.t()) :: {:ok, OpenRiakTypes.PushQueueItemsOutput.t()}
    | {:error, term()}
  def push_queue_items(config, input) do
    req = OpenRiakHttp.encode_push_queue_items_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_push_queue_items_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PutDefaultObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec put_default_object(client_config(), OpenRiakTypes.PutDefaultObjectOperationInput.t()) :: {:ok, OpenRiakTypes.PutDefaultObjectOutput.t()}
    | {:error, term()}
  def put_default_object(config, input) do
    req = OpenRiakHttp.encode_put_default_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_put_default_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PutDefaultObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec put_default_object_return_body(client_config(), OpenRiakTypes.PutDefaultObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.PutDefaultObjectReturnBodyOutput.t()}
    | {:error, term()}
  def put_default_object_return_body(config, input) do
    req = OpenRiakHttp.encode_put_default_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_put_default_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#PutLegacyObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec put_legacy_object(client_config(), OpenRiakTypes.PutLegacyObjectInput.t()) :: {:ok, OpenRiakTypes.PutLegacyObjectOutput.t()}
    | {:error, term()}
  def put_legacy_object(config, input) do
    req = OpenRiakHttp.encode_put_legacy_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_put_legacy_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#PutLegacyObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec put_legacy_object_return_body(client_config(), OpenRiakTypes.PutLegacyObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.PutLegacyObjectReturnBodyOutput.t()}
    | {:error, term()}
  def put_legacy_object_return_body(config, input) do
    req = OpenRiakHttp.encode_put_legacy_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_put_legacy_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PutObject:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec put_object(client_config(), OpenRiakTypes.PutObjectOperationInput.t()) :: {:ok, OpenRiakTypes.PutObjectOutput.t()}
    | {:error, term()}
  def put_object(config, input) do
    req = OpenRiakHttp.encode_put_object_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_put_object_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#PutObjectReturnBody:
  nodeConfirms @ QUERY
  pw @ QUERY
  riakHeaders @ PREFIX_HEADERS
  ifUnmodifiedSince @ HEADER
  link @ HEADER
  syncOnWrite @ QUERY
  body @ PAYLOAD
  timeout @ QUERY
  ifNoneMatch @ HEADER
  ifMatch @ HEADER
  bucket @ LABEL
  asis @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  contentEncoding @ HEADER
  contentType @ HEADER
  key @ LABEL"
  @spec put_object_return_body(client_config(), OpenRiakTypes.PutObjectReturnBodyInput.t()) :: {:ok, OpenRiakTypes.PutObjectReturnBodyOutput.t()}
    | {:error, term()}
  def put_object_return_body(config, input) do
    req = OpenRiakHttp.encode_put_object_return_body_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_put_object_return_body_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#QueryDefaultSecondaryIndex:
  bucket @ LABEL
  returnTerms @ QUERY
  field @ LABEL
  maxResults @ QUERY
  termRegex @ QUERY
  continuation @ QUERY
  value @ LABEL
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec query_default_secondary_index(client_config(), OpenRiakTypes.QueryDefaultSecondaryIndexInput.t()) :: {:ok, OpenRiakTypes.QueryDefaultSecondaryIndexOutput.t()}
    | {:error, term()}
  def query_default_secondary_index(config, input) do
    req = OpenRiakHttp.encode_query_default_secondary_index_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_query_default_secondary_index_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#QueryDefaultSecondaryIndexRange:
  bucket @ LABEL
  returnTerms @ QUERY
  field @ LABEL
  maxResults @ QUERY
  start @ LABEL
  termRegex @ QUERY
  end @ LABEL
  continuation @ QUERY
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec query_default_secondary_index_range(client_config(), OpenRiakTypes.QueryDefaultSecondaryIndexRangeInput.t()) :: {:ok, OpenRiakTypes.QueryDefaultSecondaryIndexRangeOutput.t()}
    | {:error, term()}
  def query_default_secondary_index_range(config, input) do
    req = OpenRiakHttp.encode_query_default_secondary_index_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_query_default_secondary_index_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#QuerySecondaryIndex:
  bucket @ LABEL
  returnTerms @ QUERY
  bucketType @ LABEL
  field @ LABEL
  maxResults @ QUERY
  termRegex @ QUERY
  continuation @ QUERY
  value @ LABEL
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec query_secondary_index(client_config(), OpenRiakTypes.QuerySecondaryIndexInput.t()) :: {:ok, OpenRiakTypes.QuerySecondaryIndexOutput.t()}
    | {:error, term()}
  def query_secondary_index(config, input) do
    req = OpenRiakHttp.encode_query_secondary_index_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_query_secondary_index_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#QuerySecondaryIndexRange:
  bucket @ LABEL
  returnTerms @ QUERY
  bucketType @ LABEL
  field @ LABEL
  maxResults @ QUERY
  start @ LABEL
  termRegex @ QUERY
  end @ LABEL
  continuation @ QUERY
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec query_secondary_index_range(client_config(), OpenRiakTypes.QuerySecondaryIndexRangeInput.t()) :: {:ok, OpenRiakTypes.QuerySecondaryIndexRangeOutput.t()}
    | {:error, term()}
  def query_secondary_index_range(config, input) do
    req = OpenRiakHttp.encode_query_secondary_index_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_query_secondary_index_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#ResetBucketProperties:
  bucket @ LABEL
  bucketType @ LABEL
  timeout @ QUERY"
  @spec reset_bucket_properties(client_config(), OpenRiakTypes.ResetBucketPropertiesInput.t()) :: {:ok, OpenRiakTypes.ResetBucketPropertiesOutput.t()}
    | {:error, term()}
  def reset_bucket_properties(config, input) do
    req = OpenRiakHttp.encode_reset_bucket_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_reset_bucket_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#ResetDefaultBucketProperties:
  bucket @ LABEL
  timeout @ QUERY"
  @spec reset_default_bucket_properties(client_config(), OpenRiakTypes.ResetDefaultBucketPropertiesInput.t()) :: {:ok, OpenRiakTypes.ResetDefaultBucketPropertiesOutput.t()}
    | {:error, term()}
  def reset_default_bucket_properties(config, input) do
    req = OpenRiakHttp.encode_reset_default_bucket_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_reset_default_bucket_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#RunBucketQuery:
  bucket @ LABEL
  bucketType @ LABEL
  query @ PAYLOAD
  contentType @ HEADER"
  @spec run_bucket_query(client_config(), OpenRiakTypes.RunBucketQueryInput.t()) :: {:ok, OpenRiakTypes.RunBucketQueryOutput.t()}
    | {:error, term()}
  def run_bucket_query(config, input) do
    req = OpenRiakHttp.encode_run_bucket_query_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_run_bucket_query_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#RunDefaultBucketQuery:
  bucket @ LABEL
  query @ PAYLOAD
  contentType @ HEADER"
  @spec run_default_bucket_query(client_config(), OpenRiakTypes.RunDefaultBucketQueryInput.t()) :: {:ok, OpenRiakTypes.RunDefaultBucketQueryOutput.t()}
    | {:error, term()}
  def run_default_bucket_query(config, input) do
    req = OpenRiakHttp.encode_run_default_bucket_query_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_run_default_bucket_query_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#SetBucketProperties:
  bucket @ LABEL
  bucketType @ LABEL
  contentType @ HEADER
  props @ PAYLOAD"
  @spec set_bucket_properties(client_config(), OpenRiakTypes.SetBucketPropertiesInput.t()) :: {:ok, OpenRiakTypes.SetBucketPropertiesOutput.t()}
    | {:error, term()}
  def set_bucket_properties(config, input) do
    req = OpenRiakHttp.encode_set_bucket_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_set_bucket_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#SetBucketTypeProperties:
  bucketType @ LABEL
  contentType @ HEADER
  props @ PAYLOAD"
  @spec set_bucket_type_properties(client_config(), OpenRiakTypes.SetBucketTypePropertiesInput.t()) :: {:ok, OpenRiakTypes.SetBucketTypePropertiesOutput.t()}
    | {:error, term()}
  def set_bucket_type_properties(config, input) do
    req = OpenRiakHttp.encode_set_bucket_type_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_set_bucket_type_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#SetDefaultBucketProperties:
  bucket @ LABEL
  contentType @ HEADER
  props @ PAYLOAD"
  @spec set_default_bucket_properties(client_config(), OpenRiakTypes.SetDefaultBucketPropertiesInput.t()) :: {:ok, OpenRiakTypes.SetDefaultBucketPropertiesOutput.t()}
    | {:error, term()}
  def set_default_bucket_properties(config, input) do
    req = OpenRiakHttp.encode_set_default_bucket_properties_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_set_default_bucket_properties_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
HTTP request bindings for openriak.v3_4.api#StreamBuckets:
  bucketType @ LABEL
  timeout @ QUERY"
  @spec stream_buckets(client_config(), OpenRiakTypes.StreamBucketsInput.t()) :: {:ok, OpenRiakTypes.StreamBucketsOutput.t()}
    | {:error, term()}
  def stream_buckets(config, input) do
    req = OpenRiakHttp.encode_stream_buckets_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_buckets_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
HTTP request bindings for openriak.v3_4.api#StreamDefaultBuckets:
  timeout @ QUERY"
  @spec stream_default_buckets(client_config(), OpenRiakTypes.StreamDefaultBucketsInput.t()) :: {:ok, OpenRiakTypes.StreamDefaultBucketsOutput.t()}
    | {:error, term()}
  def stream_default_buckets(config, input) do
    req = OpenRiakHttp.encode_stream_default_buckets_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_default_buckets_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
HTTP request bindings for openriak.v3_4.api#StreamDefaultKeys:
  bucket @ LABEL
  timeout @ QUERY
  props @ QUERY"
  @spec stream_default_keys(client_config(), OpenRiakTypes.StreamDefaultKeysInput.t()) :: {:ok, OpenRiakTypes.StreamDefaultKeysOutput.t()}
    | {:error, term()}
  def stream_default_keys(config, input) do
    req = OpenRiakHttp.encode_stream_default_keys_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_default_keys_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#StreamDefaultSecondaryIndex:
  bucket @ LABEL
  returnTerms @ QUERY
  field @ LABEL
  maxResults @ QUERY
  termRegex @ QUERY
  continuation @ QUERY
  value @ LABEL
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec stream_default_secondary_index(client_config(), OpenRiakTypes.StreamDefaultSecondaryIndexInput.t()) :: {:ok, OpenRiakTypes.StreamDefaultSecondaryIndexOutput.t()}
    | {:error, term()}
  def stream_default_secondary_index(config, input) do
    req = OpenRiakHttp.encode_stream_default_secondary_index_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_default_secondary_index_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#StreamDefaultSecondaryIndexRange:
  bucket @ LABEL
  returnTerms @ QUERY
  field @ LABEL
  maxResults @ QUERY
  start @ LABEL
  termRegex @ QUERY
  end @ LABEL
  continuation @ QUERY
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec stream_default_secondary_index_range(client_config(), OpenRiakTypes.StreamDefaultSecondaryIndexRangeInput.t()) :: {:ok, OpenRiakTypes.StreamDefaultSecondaryIndexRangeOutput.t()}
    | {:error, term()}
  def stream_default_secondary_index_range(config, input) do
    req = OpenRiakHttp.encode_stream_default_secondary_index_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_default_secondary_index_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
HTTP request bindings for openriak.v3_4.api#StreamKeys:
  bucket @ LABEL
  bucketType @ LABEL
  timeout @ QUERY
  props @ QUERY"
  @spec stream_keys(client_config(), OpenRiakTypes.StreamKeysInput.t()) :: {:ok, OpenRiakTypes.StreamKeysOutput.t()}
    | {:error, term()}
  def stream_keys(config, input) do
    req = OpenRiakHttp.encode_stream_keys_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_keys_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#StreamSecondaryIndex:
  bucket @ LABEL
  returnTerms @ QUERY
  bucketType @ LABEL
  field @ LABEL
  maxResults @ QUERY
  termRegex @ QUERY
  continuation @ QUERY
  value @ LABEL
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec stream_secondary_index(client_config(), OpenRiakTypes.StreamSecondaryIndexInput.t()) :: {:ok, OpenRiakTypes.StreamSecondaryIndexOutput.t()}
    | {:error, term()}
  def stream_secondary_index(config, input) do
    req = OpenRiakHttp.encode_stream_secondary_index_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_secondary_index_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
HTTP request bindings for openriak.v3_4.api#StreamSecondaryIndexRange:
  bucket @ LABEL
  returnTerms @ QUERY
  bucketType @ LABEL
  field @ LABEL
  maxResults @ QUERY
  start @ LABEL
  termRegex @ QUERY
  end @ LABEL
  continuation @ QUERY
  timeout @ QUERY
  paginationSort @ QUERY"
  @spec stream_secondary_index_range(client_config(), OpenRiakTypes.StreamSecondaryIndexRangeInput.t()) :: {:ok, OpenRiakTypes.StreamSecondaryIndexRangeOutput.t()}
    | {:error, term()}
  def stream_secondary_index_range(config, input) do
    req = OpenRiakHttp.encode_stream_secondary_index_range_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_stream_secondary_index_range_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "HTTP request bindings for openriak.v3_4.api#UpdateDatatype:
  pr @ QUERY
  includeContext @ QUERY
  pw @ QUERY
  update @ PAYLOAD
  timeout @ QUERY
  bucket @ LABEL
  r @ QUERY
  bucketType @ LABEL
  dw @ QUERY
  w @ QUERY
  returnBody @ QUERY
  contentType @ HEADER
  key @ LABEL"
  @spec update_datatype(client_config(), OpenRiakTypes.UpdateDatatypeInput.t()) :: {:ok, OpenRiakTypes.UpdateDatatypeOutput.t()}
    | {:error, term()}
  def update_datatype(config, input) do
    req = OpenRiakHttp.encode_update_datatype_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_update_datatype_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
HTTP request bindings for openriak.v3_4.api#UpdateLegacyCounter:
  bucket @ LABEL
  amount @ PAYLOAD
  dw @ QUERY
  returnValue @ QUERY
  w @ QUERY
  pw @ QUERY
  key @ LABEL
  timeout @ QUERY"
  @spec update_legacy_counter(client_config(), OpenRiakTypes.UpdateLegacyCounterInput.t()) :: {:ok, OpenRiakTypes.UpdateLegacyCounterOutput.t()}
    | {:error, term()}
  def update_legacy_counter(config, input) do
    req = OpenRiakHttp.encode_update_legacy_counter_request(input)

    case RuntimeHttp.dispatch(config, req) do
      {:ok, resp} -> OpenRiakHttp.decode_update_legacy_counter_response(resp)
      {:error, reason} -> {:error, reason}
    end
  end
end
