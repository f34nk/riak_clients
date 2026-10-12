%% Generated Erlang client for openriak.v3_4.api#OpenRiak.
%% Operation stubs use arity 2: (Config, Input).
%% Service closure: openriak.v3_4.api#OpenRiak
-module(openriak_client).
-include("openriak_types.hrl").
-export([
    create_datatype/2,
    create_default_object/2,
    create_default_object_return_body/2,
    create_object/2,
    create_object_return_body/2,
    delete_default_object/2,
    delete_legacy_object/2,
    delete_object/2,
    get_bucket_properties/2,
    get_bucket_query_results/2,
    get_bucket_type_properties/2,
    get_datatype/2,
    get_default_bucket_properties/2,
    get_default_bucket_query_results/2,
    get_default_erase_keys/2,
    get_default_fetch_clocks_range/2,
    get_default_find_keys_by_object_size/2,
    get_default_find_keys_by_sibling_count/2,
    get_default_find_tombs/2,
    get_default_merge_tree_range/2,
    get_default_object/2,
    get_default_object_stats/2,
    get_default_reap_tombs/2,
    get_default_repair_keys_range/2,
    get_default_repl_keys_range/2,
    get_erase_keys/2,
    get_fetch_clocks_nval/2,
    get_fetch_clocks_range/2,
    get_find_keys_by_object_size/2,
    get_find_keys_by_sibling_count/2,
    get_find_tombs/2,
    get_legacy_counter/2,
    get_legacy_object/2,
    get_map_reduce_usage/2,
    get_membership/2,
    get_merge_branch_nval/2,
    get_merge_root_nval/2,
    get_merge_tree_range/2,
    get_object/2,
    get_object_stats/2,
    get_queue_item/2,
    get_reap_tombs/2,
    get_repair_keys_range/2,
    get_repl_keys_range/2,
    get_root/2,
    get_stats/2,
    head_default_object/2,
    head_legacy_object/2,
    head_map_reduce/2,
    head_object/2,
    head_stats/2,
    link_walk/2,
    link_walk_default/2,
    link_walk_legacy/2,
    list_aae_buckets/2,
    list_buckets/2,
    list_default_buckets/2,
    list_default_keys/2,
    list_keys/2,
    map_reduce/2,
    map_reduce_chunked/2,
    ping/2,
    post_default_object/2,
    post_default_object_return_body/2,
    post_legacy_object/2,
    post_legacy_object_return_body/2,
    post_object/2,
    post_object_return_body/2,
    push_queue_items/2,
    put_default_object/2,
    put_default_object_return_body/2,
    put_legacy_object/2,
    put_legacy_object_return_body/2,
    put_object/2,
    put_object_return_body/2,
    query_default_secondary_index/2,
    query_default_secondary_index_range/2,
    query_secondary_index/2,
    query_secondary_index_range/2,
    reset_bucket_properties/2,
    reset_default_bucket_properties/2,
    run_bucket_query/2,
    run_default_bucket_query/2,
    set_bucket_properties/2,
    set_bucket_type_properties/2,
    set_default_bucket_properties/2,
    stream_buckets/2,
    stream_default_buckets/2,
    stream_default_keys/2,
    stream_default_secondary_index/2,
    stream_default_secondary_index_range/2,
    stream_keys/2,
    stream_secondary_index/2,
    stream_secondary_index_range/2,
    update_datatype/2,
    update_legacy_counter/2
]).

%% Client configuration is intentionally opaque at this layer; endpoint, transport, and protocol live in future runtime modules.
-type client_config() :: #{binary() => term()}.

%% @doc HTTP request bindings for openriak.v3_4.api#CreateDatatype:
%%   bucket @ LABEL
%%   r @ QUERY
%%   pr @ QUERY
%%   includeContext @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   pw @ QUERY
%%   returnBody @ QUERY
%%   update @ PAYLOAD
%%   contentType @ HEADER
%%   timeout @ QUERY
-spec create_datatype(client_config(), create_datatype_input()) -> {'ok', create_datatype_output()} | {'error', term()}.
create_datatype(Config, Input) ->
    Req = openriak_http:encode_create_datatype_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_create_datatype_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#CreateDefaultObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
-spec create_default_object(client_config(), create_default_object_operation_input()) -> {'ok', create_default_object_output()} | {'error', term()}.
create_default_object(Config, Input) ->
    Req = openriak_http:encode_create_default_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_create_default_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#CreateDefaultObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
-spec create_default_object_return_body(client_config(), create_default_object_return_body_input()) -> {'ok', create_default_object_return_body_output()} | {'error', term()}.
create_default_object_return_body(Config, Input) ->
    Req = openriak_http:encode_create_default_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_create_default_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#CreateObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
-spec create_object(client_config(), create_object_operation_input()) -> {'ok', create_object_operation_output()} | {'error', term()}.
create_object(Config, Input) ->
    Req = openriak_http:encode_create_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_create_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#CreateObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
-spec create_object_return_body(client_config(), create_object_return_body_input()) -> {'ok', create_object_return_body_operation_output()} | {'error', term()}.
create_object_return_body(Config, Input) ->
    Req = openriak_http:encode_create_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_create_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#DeleteDefaultObject:
%%   pr @ QUERY
%%   rw @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   key @ LABEL
-spec delete_default_object(client_config(), delete_default_object_operation_input()) -> {'ok', delete_default_object_output()} | {'error', term()}.
delete_default_object(Config, Input) ->
    Req = openriak_http:encode_delete_default_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_delete_default_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#DeleteLegacyObject:
%%   pr @ QUERY
%%   rw @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   key @ LABEL
-spec delete_legacy_object(client_config(), delete_legacy_object_input()) -> {'ok', delete_legacy_object_output()} | {'error', term()}.
delete_legacy_object(Config, Input) ->
    Req = openriak_http:encode_delete_legacy_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_delete_legacy_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#DeleteObject:
%%   pr @ QUERY
%%   rw @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   key @ LABEL
-spec delete_object(client_config(), delete_object_input()) -> {'ok', delete_object_output()} | {'error', term()}.
delete_object(Config, Input) ->
    Req = openriak_http:encode_delete_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_delete_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Response body uses a props envelope: {'props': {...}}.
%% HTTP request bindings for openriak.v3_4.api#GetBucketProperties:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_bucket_properties(client_config(), get_bucket_properties_input()) -> {'ok', get_bucket_properties_output()} | {'error', term()}.
get_bucket_properties(Config, Input) ->
    Req = openriak_http:encode_get_bucket_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_bucket_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetBucketQueryResults:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   resultQueue @ QUERY
%%   maxResults @ QUERY
%%   timeout @ QUERY
-spec get_bucket_query_results(client_config(), get_bucket_query_results_input()) -> {'ok', get_bucket_query_results_output()} | {'error', term()}.
get_bucket_query_results(Config, Input) ->
    Req = openriak_http:encode_get_bucket_query_results_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_bucket_query_results_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Response body uses a props envelope: {'props': {...}}.
%% HTTP request bindings for openriak.v3_4.api#GetBucketTypeProperties:
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_bucket_type_properties(client_config(), get_bucket_type_properties_input()) -> {'ok', get_bucket_type_properties_output()} | {'error', term()}.
get_bucket_type_properties(Config, Input) ->
    Req = openriak_http:encode_get_bucket_type_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_bucket_type_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDatatype:
%%   bucket @ LABEL
%%   r @ QUERY
%%   pr @ QUERY
%%   includeContext @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   pw @ QUERY
%%   returnBody @ QUERY
%%   key @ LABEL
%%   timeout @ QUERY
-spec get_datatype(client_config(), get_datatype_input()) -> {'ok', get_datatype_output()} | {'error', term()}.
get_datatype(Config, Input) ->
    Req = openriak_http:encode_get_datatype_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_datatype_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Response body uses a props envelope: {'props': {...}}.
%% HTTP request bindings for openriak.v3_4.api#GetDefaultBucketProperties:
%%   bucket @ LABEL
%%   timeout @ QUERY
-spec get_default_bucket_properties(client_config(), get_default_bucket_properties_input()) -> {'ok', get_default_bucket_properties_output()} | {'error', term()}.
get_default_bucket_properties(Config, Input) ->
    Req = openriak_http:encode_get_default_bucket_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_bucket_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultBucketQueryResults:
%%   bucket @ LABEL
%%   resultQueue @ QUERY
%%   maxResults @ QUERY
%%   timeout @ QUERY
-spec get_default_bucket_query_results(client_config(), get_default_bucket_query_results_input()) -> {'ok', get_default_bucket_query_results_output()} | {'error', term()}.
get_default_bucket_query_results(Config, Input) ->
    Req = openriak_http:encode_get_default_bucket_query_results_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_bucket_query_results_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultEraseKeys:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_default_erase_keys(client_config(), get_default_erase_keys_input()) -> {'ok', get_default_erase_keys_output()} | {'error', term()}.
get_default_erase_keys(Config, Input) ->
    Req = openriak_http:encode_get_default_erase_keys_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_erase_keys_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultFetchClocksRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_default_fetch_clocks_range(client_config(), get_default_fetch_clocks_range_input()) -> {'ok', get_default_fetch_clocks_range_output()} | {'error', term()}.
get_default_fetch_clocks_range(Config, Input) ->
    Req = openriak_http:encode_get_default_fetch_clocks_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_fetch_clocks_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultFindKeysByObjectSize:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   size @ LABEL
%%   timeout @ QUERY
-spec get_default_find_keys_by_object_size(client_config(), get_default_find_keys_by_object_size_input()) -> {'ok', get_default_find_keys_by_object_size_output()} | {'error', term()}.
get_default_find_keys_by_object_size(Config, Input) ->
    Req = openriak_http:encode_get_default_find_keys_by_object_size_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_find_keys_by_object_size_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultFindKeysBySiblingCount:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   count @ LABEL
%%   timeout @ QUERY
-spec get_default_find_keys_by_sibling_count(client_config(), get_default_find_keys_by_sibling_count_input()) -> {'ok', get_default_find_keys_by_sibling_count_output()} | {'error', term()}.
get_default_find_keys_by_sibling_count(Config, Input) ->
    Req = openriak_http:encode_get_default_find_keys_by_sibling_count_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_find_keys_by_sibling_count_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultFindTombs:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_default_find_tombs(client_config(), get_default_find_tombs_input()) -> {'ok', get_default_find_tombs_output()} | {'error', term()}.
get_default_find_tombs(Config, Input) ->
    Req = openriak_http:encode_get_default_find_tombs_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_find_tombs_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultMergeTreeRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   treeSize @ LABEL
%%   timeout @ QUERY
-spec get_default_merge_tree_range(client_config(), get_default_merge_tree_range_input()) -> {'ok', get_default_merge_tree_range_output()} | {'error', term()}.
get_default_merge_tree_range(Config, Input) ->
    Req = openriak_http:encode_get_default_merge_tree_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_merge_tree_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
%% HTTP request bindings for openriak.v3_4.api#GetDefaultObject:
%%   nodeConfirms @ QUERY
%%   pr @ QUERY
%%   notfoundOk @ QUERY
%%   ifModifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   accept @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   basicQuorum @ QUERY
%%   vtag @ QUERY
%%   deletedVClock @ QUERY
%%   key @ LABEL
-spec get_default_object(client_config(), get_default_object_operation_input()) -> {'ok', get_default_object_output()} | {'error', term()}.
get_default_object(Config, Input) ->
    Req = openriak_http:encode_get_default_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultObjectStats:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_default_object_stats(client_config(), get_default_object_stats_input()) -> {'ok', get_default_object_stats_output()} | {'error', term()}.
get_default_object_stats(Config, Input) ->
    Req = openriak_http:encode_get_default_object_stats_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_object_stats_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultReapTombs:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_default_reap_tombs(client_config(), get_default_reap_tombs_input()) -> {'ok', get_default_reap_tombs_output()} | {'error', term()}.
get_default_reap_tombs(Config, Input) ->
    Req = openriak_http:encode_get_default_reap_tombs_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_reap_tombs_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultRepairKeysRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_default_repair_keys_range(client_config(), get_default_repair_keys_range_input()) -> {'ok', get_default_repair_keys_range_output()} | {'error', term()}.
get_default_repair_keys_range(Config, Input) ->
    Req = openriak_http:encode_get_default_repair_keys_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_repair_keys_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetDefaultReplKeysRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   queueName @ LABEL
%%   timeout @ QUERY
-spec get_default_repl_keys_range(client_config(), get_default_repl_keys_range_input()) -> {'ok', get_default_repl_keys_range_output()} | {'error', term()}.
get_default_repl_keys_range(Config, Input) ->
    Req = openriak_http:encode_get_default_repl_keys_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_default_repl_keys_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetEraseKeys:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_erase_keys(client_config(), get_erase_keys_input()) -> {'ok', get_erase_keys_output()} | {'error', term()}.
get_erase_keys(Config, Input) ->
    Req = openriak_http:encode_get_erase_keys_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_erase_keys_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetFetchClocksNval:
%%   nVal @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_fetch_clocks_nval(client_config(), get_fetch_clocks_nval_input()) -> {'ok', get_fetch_clocks_nval_output()} | {'error', term()}.
get_fetch_clocks_nval(Config, Input) ->
    Req = openriak_http:encode_get_fetch_clocks_nval_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_fetch_clocks_nval_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetFetchClocksRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_fetch_clocks_range(client_config(), get_fetch_clocks_range_input()) -> {'ok', get_fetch_clocks_range_output()} | {'error', term()}.
get_fetch_clocks_range(Config, Input) ->
    Req = openriak_http:encode_get_fetch_clocks_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_fetch_clocks_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetFindKeysByObjectSize:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   size @ LABEL
%%   timeout @ QUERY
-spec get_find_keys_by_object_size(client_config(), get_find_keys_by_object_size_input()) -> {'ok', get_find_keys_by_object_size_output()} | {'error', term()}.
get_find_keys_by_object_size(Config, Input) ->
    Req = openriak_http:encode_get_find_keys_by_object_size_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_find_keys_by_object_size_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetFindKeysBySiblingCount:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   count @ LABEL
%%   timeout @ QUERY
-spec get_find_keys_by_sibling_count(client_config(), get_find_keys_by_sibling_count_input()) -> {'ok', get_find_keys_by_sibling_count_output()} | {'error', term()}.
get_find_keys_by_sibling_count(Config, Input) ->
    Req = openriak_http:encode_get_find_keys_by_sibling_count_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_find_keys_by_sibling_count_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetFindTombs:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_find_tombs(client_config(), get_find_tombs_input()) -> {'ok', get_find_tombs_output()} | {'error', term()}.
get_find_tombs(Config, Input) ->
    Req = openriak_http:encode_get_find_tombs_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_find_tombs_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#GetLegacyCounter:
%%   bucket @ LABEL
%%   nodeConfirms @ QUERY
%%   r @ QUERY
%%   pr @ QUERY
%%   basicQuorum @ QUERY
%%   deletedVClock @ QUERY
%%   notfoundOk @ QUERY
%%   key @ LABEL
%%   timeout @ QUERY
-spec get_legacy_counter(client_config(), get_legacy_counter_input()) -> {'ok', get_legacy_counter_output()} | {'error', term()}.
get_legacy_counter(Config, Input) ->
    Req = openriak_http:encode_get_legacy_counter_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_legacy_counter_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
%% HTTP request bindings for openriak.v3_4.api#GetLegacyObject:
%%   nodeConfirms @ QUERY
%%   pr @ QUERY
%%   notfoundOk @ QUERY
%%   ifModifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   accept @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   basicQuorum @ QUERY
%%   vtag @ QUERY
%%   deletedVClock @ QUERY
%%   key @ LABEL
-spec get_legacy_object(client_config(), get_legacy_object_input()) -> {'ok', get_legacy_object_output()} | {'error', term()}.
get_legacy_object(Config, Input) ->
    Req = openriak_http:encode_get_legacy_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_legacy_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
-spec get_map_reduce_usage(client_config(), get_map_reduce_usage_input()) -> {'ok', get_map_reduce_usage_output()} | {'error', term()}.
get_map_reduce_usage(Config, Input) ->
    Req = openriak_http:encode_get_map_reduce_usage_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_map_reduce_usage_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetMembership:
%%   timeout @ QUERY
-spec get_membership(client_config(), get_membership_input()) -> {'ok', get_membership_output()} | {'error', term()}.
get_membership(Config, Input) ->
    Req = openriak_http:encode_get_membership_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_membership_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetMergeBranchNval:
%%   nVal @ LABEL
%%   filter @ QUERY
%%   timeout @ QUERY
-spec get_merge_branch_nval(client_config(), get_merge_branch_nval_input()) -> {'ok', get_merge_branch_nval_output()} | {'error', term()}.
get_merge_branch_nval(Config, Input) ->
    Req = openriak_http:encode_get_merge_branch_nval_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_merge_branch_nval_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetMergeRootNval:
%%   nVal @ LABEL
%%   timeout @ QUERY
-spec get_merge_root_nval(client_config(), get_merge_root_nval_input()) -> {'ok', get_merge_root_nval_output()} | {'error', term()}.
get_merge_root_nval(Config, Input) ->
    Req = openriak_http:encode_get_merge_root_nval_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_merge_root_nval_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetMergeTreeRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   treeSize @ LABEL
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_merge_tree_range(client_config(), get_merge_tree_range_input()) -> {'ok', get_merge_tree_range_output()} | {'error', term()}.
get_merge_tree_range(Config, Input) ->
    Req = openriak_http:encode_get_merge_tree_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_merge_tree_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
%% HTTP request bindings for openriak.v3_4.api#GetObject:
%%   nodeConfirms @ QUERY
%%   pr @ QUERY
%%   notfoundOk @ QUERY
%%   ifModifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   accept @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   basicQuorum @ QUERY
%%   bucketType @ LABEL
%%   vtag @ QUERY
%%   deletedVClock @ QUERY
%%   key @ LABEL
-spec get_object(client_config(), get_object_input()) -> {'ok', get_object_output()} | {'error', term()}.
get_object(Config, Input) ->
    Req = openriak_http:encode_get_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetObjectStats:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_object_stats(client_config(), get_object_stats_input()) -> {'ok', get_object_stats_output()} | {'error', term()}.
get_object_stats(Config, Input) ->
    Req = openriak_http:encode_get_object_stats_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_object_stats_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetQueueItem:
%%   objectFormat @ QUERY
%%   queueName @ LABEL
-spec get_queue_item(client_config(), get_queue_item_input()) -> {'ok', get_queue_item_output()} | {'error', term()}.
get_queue_item(Config, Input) ->
    Req = openriak_http:encode_get_queue_item_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_queue_item_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetReapTombs:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_reap_tombs(client_config(), get_reap_tombs_input()) -> {'ok', get_reap_tombs_output()} | {'error', term()}.
get_reap_tombs(Config, Input) ->
    Req = openriak_http:encode_get_reap_tombs_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_reap_tombs_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetRepairKeysRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec get_repair_keys_range(client_config(), get_repair_keys_range_input()) -> {'ok', get_repair_keys_range_output()} | {'error', term()}.
get_repair_keys_range(Config, Input) ->
    Req = openriak_http:encode_get_repair_keys_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_repair_keys_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetReplKeysRange:
%%   bucket @ LABEL
%%   filter @ QUERY
%%   bucketType @ LABEL
%%   queueName @ LABEL
%%   timeout @ QUERY
-spec get_repl_keys_range(client_config(), get_repl_keys_range_input()) -> {'ok', get_repl_keys_range_output()} | {'error', term()}.
get_repl_keys_range(Config, Input) ->
    Req = openriak_http:encode_get_repl_keys_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_repl_keys_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetRoot:
%%   accept @ HEADER
-spec get_root(client_config(), get_root_input()) -> {'ok', get_root_output()} | {'error', term()}.
get_root(Config, Input) ->
    Req = openriak_http:encode_get_root_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_root_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#GetStats:
%%   timeout @ QUERY
%%   accept @ HEADER
-spec get_stats(client_config(), get_stats_input()) -> {'ok', get_stats_output()} | {'error', term()}.
get_stats(Config, Input) ->
    Req = openriak_http:encode_get_stats_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_get_stats_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
%% HTTP request bindings for openriak.v3_4.api#HeadDefaultObject:
%%   nodeConfirms @ QUERY
%%   pr @ QUERY
%%   notfoundOk @ QUERY
%%   ifModifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   accept @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   basicQuorum @ QUERY
%%   vtag @ QUERY
%%   deletedVClock @ QUERY
%%   key @ LABEL
-spec head_default_object(client_config(), head_default_object_operation_input()) -> {'ok', head_default_object_output()} | {'error', term()}.
head_default_object(Config, Input) ->
    Req = openriak_http:encode_head_default_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_head_default_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
%% HTTP request bindings for openriak.v3_4.api#HeadLegacyObject:
%%   nodeConfirms @ QUERY
%%   pr @ QUERY
%%   notfoundOk @ QUERY
%%   ifModifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   accept @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   basicQuorum @ QUERY
%%   vtag @ QUERY
%%   deletedVClock @ QUERY
%%   key @ LABEL
-spec head_legacy_object(client_config(), head_legacy_object_input()) -> {'ok', head_legacy_object_output()} | {'error', term()}.
head_legacy_object(Config, Input) ->
    Req = openriak_http:encode_head_legacy_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_head_legacy_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
-spec head_map_reduce(client_config(), head_map_reduce_input()) -> {'ok', head_map_reduce_output()} | {'error', term()}.
head_map_reduce(Config, Input) ->
    Req = openriak_http:encode_head_map_reduce_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_head_map_reduce_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
%% HTTP request bindings for openriak.v3_4.api#HeadObject:
%%   nodeConfirms @ QUERY
%%   pr @ QUERY
%%   notfoundOk @ QUERY
%%   ifModifiedSince @ HEADER
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   accept @ HEADER
%%   bucket @ LABEL
%%   r @ QUERY
%%   basicQuorum @ QUERY
%%   bucketType @ LABEL
%%   vtag @ QUERY
%%   deletedVClock @ QUERY
%%   key @ LABEL
-spec head_object(client_config(), head_object_input()) -> {'ok', head_object_operation_output()} | {'error', term()}.
head_object(Config, Input) ->
    Req = openriak_http:encode_head_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_head_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#HeadStats:
%%   timeout @ QUERY
%%   accept @ HEADER
-spec head_stats(client_config(), head_stats_input()) -> {'ok', head_stats_output()} | {'error', term()}.
head_stats(Config, Input) ->
    Req = openriak_http:encode_head_stats_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_head_stats_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#LinkWalk:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   key @ LABEL
%%   walk @ LABEL
-spec link_walk(client_config(), link_walk_input()) -> {'ok', link_walk_output()} | {'error', term()}.
link_walk(Config, Input) ->
    Req = openriak_http:encode_link_walk_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_link_walk_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#LinkWalkDefault:
%%   bucket @ LABEL
%%   key @ LABEL
%%   walk @ LABEL
-spec link_walk_default(client_config(), link_walk_default_operation_input()) -> {'ok', link_walk_default_output()} | {'error', term()}.
link_walk_default(Config, Input) ->
    Req = openriak_http:encode_link_walk_default_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_link_walk_default_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#LinkWalkLegacy:
%%   bucket @ LABEL
%%   key @ LABEL
%%   walk @ LABEL
-spec link_walk_legacy(client_config(), link_walk_legacy_input()) -> {'ok', link_walk_legacy_output()} | {'error', term()}.
link_walk_legacy(Config, Input) ->
    Req = openriak_http:encode_link_walk_legacy_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_link_walk_legacy_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#ListAaeBuckets:
%%   nval @ QUERY
%%   timeout @ QUERY
-spec list_aae_buckets(client_config(), list_aae_buckets_input()) -> {'ok', list_aae_buckets_output()} | {'error', term()}.
list_aae_buckets(Config, Input) ->
    Req = openriak_http:encode_list_aae_buckets_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_list_aae_buckets_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
%% HTTP request bindings for openriak.v3_4.api#ListBuckets:
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec list_buckets(client_config(), list_buckets_operation_input()) -> {'ok', list_buckets_output()} | {'error', term()}.
list_buckets(Config, Input) ->
    Req = openriak_http:encode_list_buckets_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_list_buckets_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
%% HTTP request bindings for openriak.v3_4.api#ListDefaultBuckets:
%%   timeout @ QUERY
-spec list_default_buckets(client_config(), list_default_buckets_input()) -> {'ok', list_default_buckets_output()} | {'error', term()}.
list_default_buckets(Config, Input) ->
    Req = openriak_http:encode_list_default_buckets_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_list_default_buckets_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
%% HTTP request bindings for openriak.v3_4.api#ListDefaultKeys:
%%   bucket @ LABEL
%%   timeout @ QUERY
%%   props @ QUERY
-spec list_default_keys(client_config(), list_default_keys_operation_input()) -> {'ok', list_default_keys_output()} | {'error', term()}.
list_default_keys(Config, Input) ->
    Req = openriak_http:encode_list_default_keys_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_list_default_keys_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
%% HTTP request bindings for openriak.v3_4.api#ListKeys:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   timeout @ QUERY
%%   props @ QUERY
-spec list_keys(client_config(), list_keys_operation_input()) -> {'ok', list_keys_output()} | {'error', term()}.
list_keys(Config, Input) ->
    Req = openriak_http:encode_list_keys_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_list_keys_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
%% HTTP request bindings for openriak.v3_4.api#MapReduce:
%%   request @ PAYLOAD
%%   contentType @ HEADER
%%   accept @ HEADER
-spec map_reduce(client_config(), map_reduce_operation_input()) -> {'ok', map_reduce_output()} | {'error', term()}.
map_reduce(Config, Input) ->
    Req = openriak_http:encode_map_reduce_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_map_reduce_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
%% HTTP request bindings for openriak.v3_4.api#MapReduceChunked:
%%   request @ PAYLOAD
%%   contentType @ HEADER
%%   accept @ HEADER
-spec map_reduce_chunked(client_config(), map_reduce_chunked_input()) -> {'ok', map_reduce_chunked_output()} | {'error', term()}.
map_reduce_chunked(Config, Input) ->
    Req = openriak_http:encode_map_reduce_chunked_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_map_reduce_chunked_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

-spec ping(client_config(), ping_input()) -> {'ok', ping_output()} | {'error', term()}.
ping(Config, Input) ->
    Req = openriak_http:encode_ping_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_ping_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PostDefaultObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec post_default_object(client_config(), post_default_object_input()) -> {'ok', post_default_object_output()} | {'error', term()}.
post_default_object(Config, Input) ->
    Req = openriak_http:encode_post_default_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_post_default_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PostDefaultObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec post_default_object_return_body(client_config(), post_default_object_return_body_input()) -> {'ok', post_default_object_return_body_output()} | {'error', term()}.
post_default_object_return_body(Config, Input) ->
    Req = openriak_http:encode_post_default_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_post_default_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#PostLegacyObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec post_legacy_object(client_config(), post_legacy_object_input()) -> {'ok', post_legacy_object_output()} | {'error', term()}.
post_legacy_object(Config, Input) ->
    Req = openriak_http:encode_post_legacy_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_post_legacy_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#PostLegacyObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec post_legacy_object_return_body(client_config(), post_legacy_object_return_body_input()) -> {'ok', post_legacy_object_return_body_output()} | {'error', term()}.
post_legacy_object_return_body(Config, Input) ->
    Req = openriak_http:encode_post_legacy_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_post_legacy_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PostObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec post_object(client_config(), post_object_input()) -> {'ok', post_object_output()} | {'error', term()}.
post_object(Config, Input) ->
    Req = openriak_http:encode_post_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_post_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PostObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec post_object_return_body(client_config(), post_object_return_body_input()) -> {'ok', post_object_return_body_output()} | {'error', term()}.
post_object_return_body(Config, Input) ->
    Req = openriak_http:encode_post_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_post_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PushQueueItems:
%%   queueName @ LABEL
%%   contentType @ HEADER
%%   keysClocks @ PAYLOAD
-spec push_queue_items(client_config(), push_queue_items_input()) -> {'ok', push_queue_items_output()} | {'error', term()}.
push_queue_items(Config, Input) ->
    Req = openriak_http:encode_push_queue_items_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_push_queue_items_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PutDefaultObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec put_default_object(client_config(), put_default_object_operation_input()) -> {'ok', put_default_object_output()} | {'error', term()}.
put_default_object(Config, Input) ->
    Req = openriak_http:encode_put_default_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_put_default_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PutDefaultObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec put_default_object_return_body(client_config(), put_default_object_return_body_input()) -> {'ok', put_default_object_return_body_output()} | {'error', term()}.
put_default_object_return_body(Config, Input) ->
    Req = openriak_http:encode_put_default_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_put_default_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#PutLegacyObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec put_legacy_object(client_config(), put_legacy_object_input()) -> {'ok', put_legacy_object_output()} | {'error', term()}.
put_legacy_object(Config, Input) ->
    Req = openriak_http:encode_put_legacy_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_put_legacy_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#PutLegacyObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec put_legacy_object_return_body(client_config(), put_legacy_object_return_body_input()) -> {'ok', put_legacy_object_return_body_output()} | {'error', term()}.
put_legacy_object_return_body(Config, Input) ->
    Req = openriak_http:encode_put_legacy_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_put_legacy_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PutObject:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec put_object(client_config(), put_object_operation_input()) -> {'ok', put_object_output()} | {'error', term()}.
put_object(Config, Input) ->
    Req = openriak_http:encode_put_object_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_put_object_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#PutObjectReturnBody:
%%   nodeConfirms @ QUERY
%%   pw @ QUERY
%%   riakHeaders @ PREFIX_HEADERS
%%   ifUnmodifiedSince @ HEADER
%%   link @ HEADER
%%   syncOnWrite @ QUERY
%%   body @ PAYLOAD
%%   timeout @ QUERY
%%   ifNoneMatch @ HEADER
%%   ifMatch @ HEADER
%%   bucket @ LABEL
%%   asis @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   contentEncoding @ HEADER
%%   contentType @ HEADER
%%   key @ LABEL
-spec put_object_return_body(client_config(), put_object_return_body_input()) -> {'ok', put_object_return_body_output()} | {'error', term()}.
put_object_return_body(Config, Input) ->
    Req = openriak_http:encode_put_object_return_body_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_put_object_return_body_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#QueryDefaultSecondaryIndex:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   field @ LABEL
%%   maxResults @ QUERY
%%   termRegex @ QUERY
%%   continuation @ QUERY
%%   value @ LABEL
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec query_default_secondary_index(client_config(), query_default_secondary_index_input()) -> {'ok', query_default_secondary_index_output()} | {'error', term()}.
query_default_secondary_index(Config, Input) ->
    Req = openriak_http:encode_query_default_secondary_index_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_query_default_secondary_index_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#QueryDefaultSecondaryIndexRange:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   field @ LABEL
%%   maxResults @ QUERY
%%   start @ LABEL
%%   termRegex @ QUERY
%%   end @ LABEL
%%   continuation @ QUERY
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec query_default_secondary_index_range(client_config(), query_default_secondary_index_range_input()) -> {'ok', query_default_secondary_index_range_output()} | {'error', term()}.
query_default_secondary_index_range(Config, Input) ->
    Req = openriak_http:encode_query_default_secondary_index_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_query_default_secondary_index_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#QuerySecondaryIndex:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   bucketType @ LABEL
%%   field @ LABEL
%%   maxResults @ QUERY
%%   termRegex @ QUERY
%%   continuation @ QUERY
%%   value @ LABEL
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec query_secondary_index(client_config(), query_secondary_index_input()) -> {'ok', query_secondary_index_output()} | {'error', term()}.
query_secondary_index(Config, Input) ->
    Req = openriak_http:encode_query_secondary_index_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_query_secondary_index_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#QuerySecondaryIndexRange:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   bucketType @ LABEL
%%   field @ LABEL
%%   maxResults @ QUERY
%%   start @ LABEL
%%   termRegex @ QUERY
%%   end @ LABEL
%%   continuation @ QUERY
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec query_secondary_index_range(client_config(), query_secondary_index_range_input()) -> {'ok', query_secondary_index_range_output()} | {'error', term()}.
query_secondary_index_range(Config, Input) ->
    Req = openriak_http:encode_query_secondary_index_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_query_secondary_index_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#ResetBucketProperties:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec reset_bucket_properties(client_config(), reset_bucket_properties_input()) -> {'ok', reset_bucket_properties_output()} | {'error', term()}.
reset_bucket_properties(Config, Input) ->
    Req = openriak_http:encode_reset_bucket_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_reset_bucket_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#ResetDefaultBucketProperties:
%%   bucket @ LABEL
%%   timeout @ QUERY
-spec reset_default_bucket_properties(client_config(), reset_default_bucket_properties_input()) -> {'ok', reset_default_bucket_properties_output()} | {'error', term()}.
reset_default_bucket_properties(Config, Input) ->
    Req = openriak_http:encode_reset_default_bucket_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_reset_default_bucket_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#RunBucketQuery:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   query @ PAYLOAD
%%   contentType @ HEADER
-spec run_bucket_query(client_config(), run_bucket_query_input()) -> {'ok', run_bucket_query_output()} | {'error', term()}.
run_bucket_query(Config, Input) ->
    Req = openriak_http:encode_run_bucket_query_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_run_bucket_query_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#RunDefaultBucketQuery:
%%   bucket @ LABEL
%%   query @ PAYLOAD
%%   contentType @ HEADER
-spec run_default_bucket_query(client_config(), run_default_bucket_query_input()) -> {'ok', run_default_bucket_query_output()} | {'error', term()}.
run_default_bucket_query(Config, Input) ->
    Req = openriak_http:encode_run_default_bucket_query_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_run_default_bucket_query_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#SetBucketProperties:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   contentType @ HEADER
%%   props @ PAYLOAD
-spec set_bucket_properties(client_config(), set_bucket_properties_input()) -> {'ok', set_bucket_properties_output()} | {'error', term()}.
set_bucket_properties(Config, Input) ->
    Req = openriak_http:encode_set_bucket_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_set_bucket_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#SetBucketTypeProperties:
%%   bucketType @ LABEL
%%   contentType @ HEADER
%%   props @ PAYLOAD
-spec set_bucket_type_properties(client_config(), set_bucket_type_properties_input()) -> {'ok', set_bucket_type_properties_output()} | {'error', term()}.
set_bucket_type_properties(Config, Input) ->
    Req = openriak_http:encode_set_bucket_type_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_set_bucket_type_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#SetDefaultBucketProperties:
%%   bucket @ LABEL
%%   contentType @ HEADER
%%   props @ PAYLOAD
-spec set_default_bucket_properties(client_config(), set_default_bucket_properties_input()) -> {'ok', set_default_bucket_properties_output()} | {'error', term()}.
set_default_bucket_properties(Config, Input) ->
    Req = openriak_http:encode_set_default_bucket_properties_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_set_default_bucket_properties_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
%% HTTP request bindings for openriak.v3_4.api#StreamBuckets:
%%   bucketType @ LABEL
%%   timeout @ QUERY
-spec stream_buckets(client_config(), stream_buckets_input()) -> {'ok', stream_buckets_output()} | {'error', term()}.
stream_buckets(Config, Input) ->
    Req = openriak_http:encode_stream_buckets_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_buckets_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket enumeration.
%% HTTP request bindings for openriak.v3_4.api#StreamDefaultBuckets:
%%   timeout @ QUERY
-spec stream_default_buckets(client_config(), stream_default_buckets_input()) -> {'ok', stream_default_buckets_output()} | {'error', term()}.
stream_default_buckets(Config, Input) ->
    Req = openriak_http:encode_stream_default_buckets_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_default_buckets_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
%% HTTP request bindings for openriak.v3_4.api#StreamDefaultKeys:
%%   bucket @ LABEL
%%   timeout @ QUERY
%%   props @ QUERY
-spec stream_default_keys(client_config(), stream_default_keys_input()) -> {'ok', stream_default_keys_output()} | {'error', term()}.
stream_default_keys(Config, Input) ->
    Req = openriak_http:encode_stream_default_keys_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_default_keys_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#StreamDefaultSecondaryIndex:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   field @ LABEL
%%   maxResults @ QUERY
%%   termRegex @ QUERY
%%   continuation @ QUERY
%%   value @ LABEL
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec stream_default_secondary_index(client_config(), stream_default_secondary_index_input()) -> {'ok', stream_default_secondary_index_output()} | {'error', term()}.
stream_default_secondary_index(Config, Input) ->
    Req = openriak_http:encode_stream_default_secondary_index_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_default_secondary_index_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#StreamDefaultSecondaryIndexRange:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   field @ LABEL
%%   maxResults @ QUERY
%%   start @ LABEL
%%   termRegex @ QUERY
%%   end @ LABEL
%%   continuation @ QUERY
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec stream_default_secondary_index_range(client_config(), stream_default_secondary_index_range_input()) -> {'ok', stream_default_secondary_index_range_output()} | {'error', term()}.
stream_default_secondary_index_range(Config, Input) ->
    Req = openriak_http:encode_stream_default_secondary_index_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_default_secondary_index_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key enumeration.
%% HTTP request bindings for openriak.v3_4.api#StreamKeys:
%%   bucket @ LABEL
%%   bucketType @ LABEL
%%   timeout @ QUERY
%%   props @ QUERY
-spec stream_keys(client_config(), stream_keys_input()) -> {'ok', stream_keys_output()} | {'error', term()}.
stream_keys(Config, Input) ->
    Req = openriak_http:encode_stream_keys_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_keys_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#StreamSecondaryIndex:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   bucketType @ LABEL
%%   field @ LABEL
%%   maxResults @ QUERY
%%   termRegex @ QUERY
%%   continuation @ QUERY
%%   value @ LABEL
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec stream_secondary_index(client_config(), stream_secondary_index_input()) -> {'ok', stream_secondary_index_output()} | {'error', term()}.
stream_secondary_index(Config, Input) ->
    Req = openriak_http:encode_stream_secondary_index_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_secondary_index_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
%% HTTP request bindings for openriak.v3_4.api#StreamSecondaryIndexRange:
%%   bucket @ LABEL
%%   returnTerms @ QUERY
%%   bucketType @ LABEL
%%   field @ LABEL
%%   maxResults @ QUERY
%%   start @ LABEL
%%   termRegex @ QUERY
%%   end @ LABEL
%%   continuation @ QUERY
%%   timeout @ QUERY
%%   paginationSort @ QUERY
-spec stream_secondary_index_range(client_config(), stream_secondary_index_range_input()) -> {'ok', stream_secondary_index_range_output()} | {'error', term()}.
stream_secondary_index_range(Config, Input) ->
    Req = openriak_http:encode_stream_secondary_index_range_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_stream_secondary_index_range_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc HTTP request bindings for openriak.v3_4.api#UpdateDatatype:
%%   pr @ QUERY
%%   includeContext @ QUERY
%%   pw @ QUERY
%%   update @ PAYLOAD
%%   timeout @ QUERY
%%   bucket @ LABEL
%%   r @ QUERY
%%   bucketType @ LABEL
%%   dw @ QUERY
%%   w @ QUERY
%%   returnBody @ QUERY
%%   contentType @ HEADER
%%   key @ LABEL
-spec update_datatype(client_config(), update_datatype_input()) -> {'ok', update_datatype_output()} | {'error', term()}.
update_datatype(Config, Input) ->
    Req = openriak_http:encode_update_datatype_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_update_datatype_response(Resp);
        {error, Reason} -> {error, Reason}
    end.

%% @doc Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
%% HTTP request bindings for openriak.v3_4.api#UpdateLegacyCounter:
%%   bucket @ LABEL
%%   amount @ PAYLOAD
%%   dw @ QUERY
%%   returnValue @ QUERY
%%   w @ QUERY
%%   pw @ QUERY
%%   key @ LABEL
%%   timeout @ QUERY
-spec update_legacy_counter(client_config(), update_legacy_counter_input()) -> {'ok', update_legacy_counter_output()} | {'error', term()}.
update_legacy_counter(Config, Input) ->
    Req = openriak_http:encode_update_legacy_counter_request(Input),
    case runtime_http:dispatch(Config, Req) of
        {ok, Resp} -> openriak_http:decode_update_legacy_counter_response(Resp);
        {error, Reason} -> {error, Reason}
    end.
