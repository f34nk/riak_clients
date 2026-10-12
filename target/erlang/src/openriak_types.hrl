%% @doc
%% OpenRiak HTTP API for openriak-3.4. Routes and payloads are modeled with standard Smithy HTTP binding traits only (@http, @httpLabel, @httpQuery, @httpHeader, @httpPrefixHeaders, @httpPayload, @httpResponseCode, @httpError). There is no custom protocol trait and no stock restJson1-style envelope; clients must implement Riak wire details (x-riak- prefix headers, opaque object bodies, multipart siblings, quorum query strings) in application or custom runtime code.
%%
%% When Riak security is enabled, call the API over HTTPS with HTTP Basic credentials (@httpBasicAuth). Missing or invalid credentials yield 401 with a WWW-Authenticate challenge (Basic realm="Riak"). Credentials sent over plain HTTP may yield 426 Upgrade Required.
%% streaming payload; framing deferred to protocol layer
-type byte_stream() :: binary().

-type header_value() :: binary().

-type media_type() :: binary().

-type non_empty_string() :: binary().

-type quorum() :: binary().

-type uri_safe_identifier() :: binary().

-type v_clock() :: binary().

-type v_tag() :: binary().

-type http_date() :: erlang:timestamp().

-type json_document() :: term().

-type query_list() :: [query_spec()].

-type riak_headers() :: #{binary() => header_value()}.

%% Error shape: openriak.v3_4.api#BadRequestError (client)

-record(bad_request_error, {
    message :: binary() | undefined,
    content_type :: media_type() | undefined,
    riak_headers :: riak_headers() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type bad_request_error() :: #bad_request_error{}.

-record(query_spec, {
    index_name :: binary(),
    start_term :: binary() | undefined,
    end_term :: binary() | undefined,
    aggregation_tag :: binary() | undefined,
    regular_expression :: binary() | undefined,
    evaluation_expression :: binary() | undefined,
    filter_expression :: binary() | undefined
}).
-type query_spec() :: #query_spec{}.

%% @doc Query request body. Wire JSON uses snake_case keys: query_list, aggregation_expression, accumulation_option, accumulation_term, inactivity_timeout, max_results.
-record(bucket_query_request, {
    query_list :: query_list(),
    aggregation_expression :: binary() | undefined,
    accumulation_option :: binary() | undefined,
    accumulation_term :: binary() | undefined,
    substitutions :: term() | undefined,
    timeout :: integer() | undefined,
    inactivity_timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined
}).
-type bucket_query_request() :: #bucket_query_request{}.

%% Error shape: openriak.v3_4.api#ConflictError (client)

-record(conflict_error, {
    message :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type conflict_error() :: #conflict_error{}.

%% @doc CRDT mutation payload. Wire shape depends on bucket datatype; counters may also accept a bare integer. Sets, maps, and other types use datatype-specific operation fields documented in OtherAPI.
-record(datatype_update_payload, {
    increment :: integer() | undefined,
    decrement :: integer() | undefined,
    type :: binary() | undefined,
    value :: term() | undefined,
    context :: binary() | undefined
}).
-type datatype_update_payload() :: #datatype_update_payload{}.

-record(create_datatype_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    w :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    return_body :: boolean() | undefined,
    include_context :: boolean() | undefined,
    content_type :: media_type() | undefined,
    update :: datatype_update_payload() | undefined
}).
-type create_datatype_input() :: #create_datatype_input{}.

-record(create_datatype_output, {
    status_code :: integer() | undefined,
    location :: binary() | undefined,
    content_type :: media_type() | undefined,
    crdt_context :: binary() | undefined,
    body :: json_document() | undefined
}).
-type create_datatype_output() :: #create_datatype_output{}.

%% Error shape: openriak.v3_4.api#ForbiddenError (client)

-record(forbidden_error, {
    message :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type forbidden_error() :: #forbidden_error{}.

%% Error shape: openriak.v3_4.api#InternalServerError (server)

-record(internal_server_error, {
    message :: binary() | undefined,
    %% fault: server | retryable: false | throttling: false
    '__beam_error_kind' = server :: client | server
}).
-type internal_server_error() :: #internal_server_error{}.

%% @doc Default-bucket CRDT counter requests redirect to the legacy counter route at /buckets/{bucket}/counters/{key}.

%% Error shape: openriak.v3_4.api#MovedPermanentlyError (client)

-record(moved_permanently_error, {
    message :: binary() | undefined,
    location :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type moved_permanently_error() :: #moved_permanently_error{}.

%% Error shape: openriak.v3_4.api#TimeoutError (server)

-record(timeout_error, {
    message :: binary() | undefined,
    retry_after :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    %% fault: server | retryable: false | throttling: false
    '__beam_error_kind' = server :: client | server
}).
-type timeout_error() :: #timeout_error{}.

%% @doc Returned when Riak security is enabled and credentials are missing or invalid. The response includes a WWW-Authenticate challenge (Basic realm="Riak"); Smithy cannot bind that header on error shapes.

%% Error shape: openriak.v3_4.api#UnauthorizedError (client)

-record(unauthorized_error, {
    content_type :: media_type() | undefined,
    message :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type unauthorized_error() :: #unauthorized_error{}.

%% @doc Returned when Riak security is enabled and a request includes credentials over plain HTTP instead of HTTPS.

%% Error shape: openriak.v3_4.api#UpgradeRequiredError (client)

-record(upgrade_required_error, {
    content_type :: media_type() | undefined,
    message :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type upgrade_required_error() :: #upgrade_required_error{}.

-type sync_on_write() :: one | all | backend | {unknown, binary()}.
%% Wire values for openriak.v3_4.api#SyncOnWrite
%%   one -> <<"one>>
%%   all -> <<"all>>
%%   backend -> <<"backend>>

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(create_default_object_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type create_default_object_operation_input() :: #create_default_object_operation_input{}.

-record(create_default_object_output, {
    status_code :: integer() | undefined,
    location :: binary() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type create_default_object_output() :: #create_default_object_output{}.

%% Error shape: openriak.v3_4.api#NotAcceptableError (client)

-record(not_acceptable_error, {
    message :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type not_acceptable_error() :: #not_acceptable_error{}.

%% Error shape: openriak.v3_4.api#PreconditionFailedError (client)

-record(precondition_failed_error, {
    message :: binary() | undefined,
    vclock :: v_clock() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type precondition_failed_error() :: #precondition_failed_error{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(create_default_object_return_body_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type create_default_object_return_body_input() :: #create_default_object_return_body_input{}.

-record(create_default_object_return_body_output, {
    status_code :: integer() | undefined,
    location :: binary() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type create_default_object_return_body_output() :: #create_default_object_return_body_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(create_object_operation_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type create_object_operation_input() :: #create_object_operation_input{}.

-record(create_object_operation_output, {
    status_code :: integer() | undefined,
    location :: binary() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type create_object_operation_output() :: #create_object_operation_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(create_object_return_body_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type create_object_return_body_input() :: #create_object_return_body_input{}.

-record(create_object_return_body_operation_output, {
    status_code :: integer() | undefined,
    location :: binary() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type create_object_return_body_operation_output() :: #create_object_return_body_operation_output{}.

%% @doc Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read, alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to the encoded vclock.
-record(delete_default_object_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    w :: quorum() | undefined,
    rw :: quorum() | undefined,
    pr :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type delete_default_object_operation_input() :: #delete_default_object_operation_input{}.

-record(delete_default_object_output, {
    status_code :: integer() | undefined
}).
-type delete_default_object_output() :: #delete_default_object_output{}.

%% Error shape: openriak.v3_4.api#NotFoundError (client)

-record(not_found_error, {
    message :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type not_found_error() :: #not_found_error{}.

%% @doc Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read, alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to the encoded vclock.
-record(delete_legacy_object_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    w :: quorum() | undefined,
    rw :: quorum() | undefined,
    pr :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type delete_legacy_object_input() :: #delete_legacy_object_input{}.

-record(delete_legacy_object_output, {
    status_code :: integer() | undefined
}).
-type delete_legacy_object_output() :: #delete_legacy_object_output{}.

%% @doc Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read, alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to the encoded vclock.
-record(delete_object_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    w :: quorum() | undefined,
    rw :: quorum() | undefined,
    pr :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type delete_object_input() :: #delete_object_input{}.

-record(delete_object_output, {
    status_code :: integer() | undefined
}).
-type delete_object_output() :: #delete_object_output{}.

-record(get_bucket_properties_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type get_bucket_properties_input() :: #get_bucket_properties_input{}.

-record(get_bucket_properties_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type get_bucket_properties_output() :: #get_bucket_properties_output{}.

-record(get_bucket_query_results_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    result_queue :: binary() | undefined,
    max_results :: integer() | undefined
}).
-type get_bucket_query_results_input() :: #get_bucket_query_results_input{}.

%% @doc Paginated query results. Fetch responses may include returned_count, queued_count, and query_complete keys. queue_raw_keys and queue_raw_terms accumulation options return a result_queue reference for subsequent GET fetches.
-record(get_bucket_query_results_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    continuation :: binary() | undefined,
    body :: json_document() | undefined
}).
-type get_bucket_query_results_output() :: #get_bucket_query_results_output{}.

%% Error shape: openriak.v3_4.api#GoneError (client)

-record(gone_error, {
    message :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type gone_error() :: #gone_error{}.

-record(get_bucket_type_properties_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type get_bucket_type_properties_input() :: #get_bucket_type_properties_input{}.

-record(get_bucket_type_properties_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type get_bucket_type_properties_output() :: #get_bucket_type_properties_output{}.

-record(get_datatype_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    w :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    return_body :: boolean() | undefined,
    include_context :: boolean() | undefined
}).
-type get_datatype_input() :: #get_datatype_input{}.

%% @doc CRDT fetch or update response. When include_context is true, the opaque context may appear in the JSON body and in X-Riak-CRDT-Ctx.
-record(get_datatype_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    crdt_context :: binary() | undefined,
    body :: json_document() | undefined
}).
-type get_datatype_output() :: #get_datatype_output{}.

-record(get_default_bucket_properties_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_bucket_properties_input() :: #get_default_bucket_properties_input{}.

-record(get_default_bucket_properties_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type get_default_bucket_properties_output() :: #get_default_bucket_properties_output{}.

-record(get_default_bucket_query_results_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    result_queue :: binary() | undefined,
    max_results :: integer() | undefined
}).
-type get_default_bucket_query_results_input() :: #get_default_bucket_query_results_input{}.

%% @doc Paginated query results. Fetch responses may include returned_count, queued_count, and query_complete keys. queue_raw_keys and queue_raw_terms accumulation options return a result_queue reference for subsequent GET fetches.
-record(get_default_bucket_query_results_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    continuation :: binary() | undefined,
    body :: json_document() | undefined
}).
-type get_default_bucket_query_results_output() :: #get_default_bucket_query_results_output{}.

-record(get_default_erase_keys_input, {
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_erase_keys_input() :: #get_default_erase_keys_input{}.

-record(get_default_erase_keys_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_erase_keys_output() :: #get_default_erase_keys_output{}.

-record(get_default_fetch_clocks_range_input, {
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_fetch_clocks_range_input() :: #get_default_fetch_clocks_range_input{}.

-record(get_default_fetch_clocks_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_fetch_clocks_range_output() :: #get_default_fetch_clocks_range_output{}.

-record(get_default_find_keys_by_object_size_input, {
    bucket :: uri_safe_identifier() | undefined,
    size :: integer() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_find_keys_by_object_size_input() :: #get_default_find_keys_by_object_size_input{}.

-record(get_default_find_keys_by_object_size_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_find_keys_by_object_size_output() :: #get_default_find_keys_by_object_size_output{}.

-record(get_default_find_keys_by_sibling_count_input, {
    bucket :: uri_safe_identifier() | undefined,
    count :: integer() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_find_keys_by_sibling_count_input() :: #get_default_find_keys_by_sibling_count_input{}.

-record(get_default_find_keys_by_sibling_count_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_find_keys_by_sibling_count_output() :: #get_default_find_keys_by_sibling_count_output{}.

-record(get_default_find_tombs_input, {
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_find_tombs_input() :: #get_default_find_tombs_input{}.

-record(get_default_find_tombs_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_find_tombs_output() :: #get_default_find_tombs_output{}.

-record(get_default_merge_tree_range_input, {
    bucket :: uri_safe_identifier() | undefined,
    tree_size :: non_empty_string() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_merge_tree_range_input() :: #get_default_merge_tree_range_input{}.

-record(get_default_merge_tree_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_merge_tree_range_output() :: #get_default_merge_tree_range_output{}.

%% @doc Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved.
-record(get_default_object_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined,
    accept :: media_type() | undefined,
    if_none_match :: binary() | undefined,
    if_modified_since :: http_date() | undefined,
    vtag :: v_tag() | undefined
}).
-type get_default_object_operation_input() :: #get_default_object_operation_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(get_default_object_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_object_output() :: #get_default_object_output{}.

%% Error shape: openriak.v3_4.api#MultipleChoicesError (client)

-record(multiple_choices_error, {
    content_type :: media_type() | undefined,
    vclock :: v_clock() | undefined,
    body :: binary() | undefined,
    %% fault: client | retryable: false | throttling: false
    '__beam_error_kind' = client :: client | server
}).
-type multiple_choices_error() :: #multiple_choices_error{}.

-record(get_default_object_stats_input, {
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_object_stats_input() :: #get_default_object_stats_input{}.

-record(get_default_object_stats_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_object_stats_output() :: #get_default_object_stats_output{}.

-record(get_default_reap_tombs_input, {
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_reap_tombs_input() :: #get_default_reap_tombs_input{}.

-record(get_default_reap_tombs_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_reap_tombs_output() :: #get_default_reap_tombs_output{}.

-record(get_default_repair_keys_range_input, {
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_repair_keys_range_input() :: #get_default_repair_keys_range_input{}.

-record(get_default_repair_keys_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_repair_keys_range_output() :: #get_default_repair_keys_range_output{}.

-record(get_default_repl_keys_range_input, {
    bucket :: uri_safe_identifier() | undefined,
    queue_name :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_default_repl_keys_range_input() :: #get_default_repl_keys_range_input{}.

-record(get_default_repl_keys_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_default_repl_keys_range_output() :: #get_default_repl_keys_range_output{}.

-record(get_erase_keys_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_erase_keys_input() :: #get_erase_keys_input{}.

-record(get_erase_keys_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_erase_keys_output() :: #get_erase_keys_output{}.

-record(get_fetch_clocks_nval_input, {
    n_val :: integer() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_fetch_clocks_nval_input() :: #get_fetch_clocks_nval_input{}.

-record(get_fetch_clocks_nval_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_fetch_clocks_nval_output() :: #get_fetch_clocks_nval_output{}.

-record(get_fetch_clocks_range_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_fetch_clocks_range_input() :: #get_fetch_clocks_range_input{}.

-record(get_fetch_clocks_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_fetch_clocks_range_output() :: #get_fetch_clocks_range_output{}.

-record(get_find_keys_by_object_size_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    size :: integer() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_find_keys_by_object_size_input() :: #get_find_keys_by_object_size_input{}.

-record(get_find_keys_by_object_size_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_find_keys_by_object_size_output() :: #get_find_keys_by_object_size_output{}.

-record(get_find_keys_by_sibling_count_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    count :: integer() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_find_keys_by_sibling_count_input() :: #get_find_keys_by_sibling_count_input{}.

-record(get_find_keys_by_sibling_count_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_find_keys_by_sibling_count_output() :: #get_find_keys_by_sibling_count_output{}.

-record(get_find_tombs_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_find_tombs_input() :: #get_find_tombs_input{}.

-record(get_find_tombs_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_find_tombs_output() :: #get_find_tombs_output{}.

-record(get_legacy_counter_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined
}).
-type get_legacy_counter_input() :: #get_legacy_counter_input{}.

-record(get_legacy_counter_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: binary() | undefined
}).
-type get_legacy_counter_output() :: #get_legacy_counter_output{}.

%% @doc Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved.
-record(get_legacy_object_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined,
    accept :: media_type() | undefined,
    if_none_match :: binary() | undefined,
    if_modified_since :: http_date() | undefined,
    vtag :: v_tag() | undefined
}).
-type get_legacy_object_input() :: #get_legacy_object_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(get_legacy_object_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_legacy_object_output() :: #get_legacy_object_output{}.

-record(get_map_reduce_usage_input, {}).
-type get_map_reduce_usage_input() :: #get_map_reduce_usage_input{}.

-record(get_map_reduce_usage_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: binary() | undefined
}).
-type get_map_reduce_usage_output() :: #get_map_reduce_usage_output{}.

-record(get_membership_input, {
    timeout :: integer() | undefined
}).
-type get_membership_input() :: #get_membership_input{}.

-record(get_membership_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type get_membership_output() :: #get_membership_output{}.

-record(get_merge_branch_nval_input, {
    n_val :: integer() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_merge_branch_nval_input() :: #get_merge_branch_nval_input{}.

-record(get_merge_branch_nval_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_merge_branch_nval_output() :: #get_merge_branch_nval_output{}.

-record(get_merge_root_nval_input, {
    n_val :: integer() | undefined,
    timeout :: integer() | undefined
}).
-type get_merge_root_nval_input() :: #get_merge_root_nval_input{}.

-record(get_merge_root_nval_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_merge_root_nval_output() :: #get_merge_root_nval_output{}.

-record(get_merge_tree_range_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    tree_size :: non_empty_string() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_merge_tree_range_input() :: #get_merge_tree_range_input{}.

-record(get_merge_tree_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_merge_tree_range_output() :: #get_merge_tree_range_output{}.

%% @doc Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved.
-record(get_object_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined,
    accept :: media_type() | undefined,
    if_none_match :: binary() | undefined,
    if_modified_since :: http_date() | undefined,
    vtag :: v_tag() | undefined
}).
-type get_object_input() :: #get_object_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(get_object_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_object_output() :: #get_object_output{}.

-record(get_object_stats_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_object_stats_input() :: #get_object_stats_input{}.

-record(get_object_stats_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_object_stats_output() :: #get_object_stats_output{}.

-type queue_object_format() :: internal | internal_aaehash | {unknown, binary()}.
%% Wire values for openriak.v3_4.api#QueueObjectFormat
%%   internal -> <<"internal>>
%%   internal_aaehash -> <<"internal_aaehash>>

-record(get_queue_item_input, {
    queue_name :: uri_safe_identifier() | undefined,
    object_format :: queue_object_format() | undefined
}).
-type get_queue_item_input() :: #get_queue_item_input{}.

-record(get_queue_item_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: byte_stream()
}).
-type get_queue_item_output() :: #get_queue_item_output{}.

-record(get_reap_tombs_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_reap_tombs_input() :: #get_reap_tombs_input{}.

-record(get_reap_tombs_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_reap_tombs_output() :: #get_reap_tombs_output{}.

-record(get_repair_keys_range_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_repair_keys_range_input() :: #get_repair_keys_range_input{}.

-record(get_repair_keys_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_repair_keys_range_output() :: #get_repair_keys_range_output{}.

-record(get_repl_keys_range_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    queue_name :: uri_safe_identifier() | undefined,
    filter :: binary() | undefined,
    timeout :: integer() | undefined
}).
-type get_repl_keys_range_input() :: #get_repl_keys_range_input{}.

-record(get_repl_keys_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type get_repl_keys_range_output() :: #get_repl_keys_range_output{}.

-record(get_root_input, {
    accept :: media_type() | undefined
}).
-type get_root_input() :: #get_root_input{}.

-record(get_root_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    body :: byte_stream()
}).
-type get_root_output() :: #get_root_output{}.

-record(get_stats_input, {
    timeout :: integer() | undefined,
    accept :: media_type() | undefined
}).
-type get_stats_input() :: #get_stats_input{}.

-record(get_stats_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: byte_stream()
}).
-type get_stats_output() :: #get_stats_output{}.

%% @doc Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved.
-record(head_default_object_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined,
    accept :: media_type() | undefined,
    if_none_match :: binary() | undefined,
    if_modified_since :: http_date() | undefined,
    vtag :: v_tag() | undefined
}).
-type head_default_object_operation_input() :: #head_default_object_operation_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(head_default_object_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type head_default_object_output() :: #head_default_object_output{}.

%% @doc Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved.
-record(head_legacy_object_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined,
    accept :: media_type() | undefined,
    if_none_match :: binary() | undefined,
    if_modified_since :: http_date() | undefined,
    vtag :: v_tag() | undefined
}).
-type head_legacy_object_input() :: #head_legacy_object_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(head_legacy_object_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type head_legacy_object_output() :: #head_legacy_object_output{}.

-record(head_map_reduce_input, {}).
-type head_map_reduce_input() :: #head_map_reduce_input{}.

-record(head_map_reduce_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type head_map_reduce_output() :: #head_map_reduce_output{}.

%% @doc Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved.
-record(head_object_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    basic_quorum :: boolean() | undefined,
    notfound_ok :: boolean() | undefined,
    node_confirms :: integer() | undefined,
    deleted_v_clock :: boolean() | undefined,
    accept :: media_type() | undefined,
    if_none_match :: binary() | undefined,
    if_modified_since :: http_date() | undefined,
    vtag :: v_tag() | undefined
}).
-type head_object_input() :: #head_object_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(head_object_operation_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type head_object_operation_output() :: #head_object_operation_output{}.

-record(head_stats_input, {
    timeout :: integer() | undefined,
    accept :: media_type() | undefined
}).
-type head_stats_input() :: #head_stats_input{}.

-record(head_stats_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined
}).
-type head_stats_output() :: #head_stats_output{}.

-record(link_walk_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    walk :: binary() | undefined
}).
-type link_walk_input() :: #link_walk_input{}.

-record(link_walk_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type link_walk_output() :: #link_walk_output{}.

-record(link_walk_default_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    walk :: binary() | undefined
}).
-type link_walk_default_operation_input() :: #link_walk_default_operation_input{}.

-record(link_walk_default_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type link_walk_default_output() :: #link_walk_default_output{}.

-record(link_walk_legacy_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    walk :: binary() | undefined
}).
-type link_walk_legacy_input() :: #link_walk_legacy_input{}.

-record(link_walk_legacy_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type link_walk_legacy_output() :: #link_walk_legacy_output{}.

-record(list_aae_buckets_input, {
    nval :: integer() | undefined,
    timeout :: integer() | undefined
}).
-type list_aae_buckets_input() :: #list_aae_buckets_input{}.

-record(list_aae_buckets_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type list_aae_buckets_output() :: #list_aae_buckets_output{}.

-record(list_buckets_operation_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type list_buckets_operation_input() :: #list_buckets_operation_input{}.

-record(list_buckets_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type list_buckets_output() :: #list_buckets_output{}.

-record(list_default_buckets_input, {
    timeout :: integer() | undefined
}).
-type list_default_buckets_input() :: #list_default_buckets_input{}.

-record(list_default_buckets_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type list_default_buckets_output() :: #list_default_buckets_output{}.

-record(list_default_keys_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    props :: boolean() | undefined
}).
-type list_default_keys_operation_input() :: #list_default_keys_operation_input{}.

-record(list_default_keys_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type list_default_keys_output() :: #list_default_keys_output{}.

-record(list_keys_operation_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    props :: boolean() | undefined
}).
-type list_keys_operation_input() :: #list_keys_operation_input{}.

-record(list_keys_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type list_keys_output() :: #list_keys_output{}.

-record(map_reduce_job, {
    inputs :: term(),
    query :: term()
}).
-type map_reduce_job() :: #map_reduce_job{}.

-record(map_reduce_operation_input, {
    content_type :: media_type() | undefined,
    accept :: media_type() | undefined,
    request :: map_reduce_job() | undefined
}).
-type map_reduce_operation_input() :: #map_reduce_operation_input{}.

-record(map_reduce_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type map_reduce_output() :: #map_reduce_output{}.

-record(map_reduce_chunked_input, {
    content_type :: media_type() | undefined,
    accept :: media_type() | undefined,
    request :: map_reduce_job() | undefined
}).
-type map_reduce_chunked_input() :: #map_reduce_chunked_input{}.

-record(map_reduce_chunked_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type map_reduce_chunked_output() :: #map_reduce_chunked_output{}.

-record(ping_input, {}).
-type ping_input() :: #ping_input{}.

-record(ping_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: binary() | undefined
}).
-type ping_output() :: #ping_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(post_default_object_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type post_default_object_input() :: #post_default_object_input{}.

-record(post_default_object_output, {
    status_code :: integer() | undefined
}).
-type post_default_object_output() :: #post_default_object_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(post_default_object_return_body_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type post_default_object_return_body_input() :: #post_default_object_return_body_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(post_default_object_return_body_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type post_default_object_return_body_output() :: #post_default_object_return_body_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(post_legacy_object_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type post_legacy_object_input() :: #post_legacy_object_input{}.

-record(post_legacy_object_output, {
    status_code :: integer() | undefined
}).
-type post_legacy_object_output() :: #post_legacy_object_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(post_legacy_object_return_body_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type post_legacy_object_return_body_input() :: #post_legacy_object_return_body_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(post_legacy_object_return_body_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type post_legacy_object_return_body_output() :: #post_legacy_object_return_body_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(post_object_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type post_object_input() :: #post_object_input{}.

-record(post_object_output, {
    status_code :: integer() | undefined
}).
-type post_object_output() :: #post_object_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(post_object_return_body_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type post_object_return_body_input() :: #post_object_return_body_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(post_object_return_body_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type post_object_return_body_output() :: #post_object_return_body_output{}.

-record(push_queue_items_input, {
    queue_name :: uri_safe_identifier() | undefined,
    content_type :: media_type() | undefined,
    keys_clocks :: json_document() | undefined
}).
-type push_queue_items_input() :: #push_queue_items_input{}.

-record(push_queue_items_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: binary() | undefined
}).
-type push_queue_items_output() :: #push_queue_items_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(put_default_object_operation_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type put_default_object_operation_input() :: #put_default_object_operation_input{}.

-record(put_default_object_output, {
    status_code :: integer() | undefined
}).
-type put_default_object_output() :: #put_default_object_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(put_default_object_return_body_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type put_default_object_return_body_input() :: #put_default_object_return_body_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(put_default_object_return_body_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type put_default_object_return_body_output() :: #put_default_object_return_body_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(put_legacy_object_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type put_legacy_object_input() :: #put_legacy_object_input{}.

-record(put_legacy_object_output, {
    status_code :: integer() | undefined
}).
-type put_legacy_object_output() :: #put_legacy_object_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(put_legacy_object_return_body_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type put_legacy_object_return_body_input() :: #put_legacy_object_return_body_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(put_legacy_object_return_body_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type put_legacy_object_return_body_output() :: #put_legacy_object_return_body_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(put_object_operation_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type put_object_operation_input() :: #put_object_operation_input{}.

-record(put_object_output, {
    status_code :: integer() | undefined
}).
-type put_object_output() :: #put_object_output{}.

%% @doc Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates.
-record(put_object_return_body_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    dw :: quorum() | undefined,
    pw :: quorum() | undefined,
    node_confirms :: integer() | undefined,
    sync_on_write :: sync_on_write() | undefined,
    asis :: boolean() | undefined,
    if_none_match :: binary() | undefined,
    if_match :: binary() | undefined,
    if_unmodified_since :: http_date() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream() | undefined
}).
-type put_object_return_body_input() :: #put_object_return_body_input{}.

%% @doc Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
-record(put_object_return_body_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    content_encoding :: binary() | undefined,
    etag :: binary() | undefined,
    last_modified :: http_date() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type put_object_return_body_output() :: #put_object_return_body_output{}.

-record(query_default_secondary_index_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    value :: binary() | undefined
}).
-type query_default_secondary_index_input() :: #query_default_secondary_index_input{}.

-record(query_default_secondary_index_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type query_default_secondary_index_output() :: #query_default_secondary_index_output{}.

-record(query_default_secondary_index_range_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    start :: binary() | undefined,
    end_ :: binary() | undefined
}).
-type query_default_secondary_index_range_input() :: #query_default_secondary_index_range_input{}.

-record(query_default_secondary_index_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type query_default_secondary_index_range_output() :: #query_default_secondary_index_range_output{}.

-record(query_secondary_index_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    value :: binary() | undefined
}).
-type query_secondary_index_input() :: #query_secondary_index_input{}.

-record(query_secondary_index_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type query_secondary_index_output() :: #query_secondary_index_output{}.

-record(query_secondary_index_range_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    start :: binary() | undefined,
    end_ :: binary() | undefined
}).
-type query_secondary_index_range_input() :: #query_secondary_index_range_input{}.

-record(query_secondary_index_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type query_secondary_index_range_output() :: #query_secondary_index_range_output{}.

-record(reset_bucket_properties_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type reset_bucket_properties_input() :: #reset_bucket_properties_input{}.

-record(reset_bucket_properties_output, {
    status_code :: integer() | undefined
}).
-type reset_bucket_properties_output() :: #reset_bucket_properties_output{}.

-record(reset_default_bucket_properties_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type reset_default_bucket_properties_input() :: #reset_default_bucket_properties_input{}.

-record(reset_default_bucket_properties_output, {
    status_code :: integer() | undefined
}).
-type reset_default_bucket_properties_output() :: #reset_default_bucket_properties_output{}.

-record(run_bucket_query_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    content_type :: media_type() | undefined,
    query :: bucket_query_request() | undefined
}).
-type run_bucket_query_input() :: #run_bucket_query_input{}.

-record(run_bucket_query_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type run_bucket_query_output() :: #run_bucket_query_output{}.

-record(run_default_bucket_query_input, {
    bucket :: uri_safe_identifier() | undefined,
    content_type :: media_type() | undefined,
    query :: bucket_query_request() | undefined
}).
-type run_default_bucket_query_input() :: #run_default_bucket_query_input{}.

-record(run_default_bucket_query_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: json_document() | undefined
}).
-type run_default_bucket_query_output() :: #run_default_bucket_query_output{}.

-record(set_bucket_properties_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    content_type :: media_type() | undefined,
    props :: json_document() | undefined
}).
-type set_bucket_properties_input() :: #set_bucket_properties_input{}.

-record(set_bucket_properties_output, {
    status_code :: integer() | undefined
}).
-type set_bucket_properties_output() :: #set_bucket_properties_output{}.

-record(set_bucket_type_properties_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    content_type :: media_type() | undefined,
    props :: json_document() | undefined
}).
-type set_bucket_type_properties_input() :: #set_bucket_type_properties_input{}.

-record(set_bucket_type_properties_output, {
    status_code :: integer() | undefined
}).
-type set_bucket_type_properties_output() :: #set_bucket_type_properties_output{}.

-record(set_default_bucket_properties_input, {
    bucket :: uri_safe_identifier() | undefined,
    content_type :: media_type() | undefined,
    props :: json_document() | undefined
}).
-type set_default_bucket_properties_input() :: #set_default_bucket_properties_input{}.

-record(set_default_bucket_properties_output, {
    status_code :: integer() | undefined
}).
-type set_default_bucket_properties_output() :: #set_default_bucket_properties_output{}.

-record(stream_buckets_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined
}).
-type stream_buckets_input() :: #stream_buckets_input{}.

-record(stream_buckets_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_buckets_output() :: #stream_buckets_output{}.

-record(stream_default_buckets_input, {
    timeout :: integer() | undefined
}).
-type stream_default_buckets_input() :: #stream_default_buckets_input{}.

-record(stream_default_buckets_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_default_buckets_output() :: #stream_default_buckets_output{}.

-record(stream_default_keys_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    props :: boolean() | undefined
}).
-type stream_default_keys_input() :: #stream_default_keys_input{}.

-record(stream_default_keys_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_default_keys_output() :: #stream_default_keys_output{}.

-record(stream_default_secondary_index_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    value :: binary() | undefined
}).
-type stream_default_secondary_index_input() :: #stream_default_secondary_index_input{}.

-record(stream_default_secondary_index_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_default_secondary_index_output() :: #stream_default_secondary_index_output{}.

-record(stream_default_secondary_index_range_input, {
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    start :: binary() | undefined,
    end_ :: binary() | undefined
}).
-type stream_default_secondary_index_range_input() :: #stream_default_secondary_index_range_input{}.

-record(stream_default_secondary_index_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_default_secondary_index_range_output() :: #stream_default_secondary_index_range_output{}.

-record(stream_keys_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    props :: boolean() | undefined
}).
-type stream_keys_input() :: #stream_keys_input{}.

-record(stream_keys_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_keys_output() :: #stream_keys_output{}.

-record(stream_secondary_index_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    value :: binary() | undefined
}).
-type stream_secondary_index_input() :: #stream_secondary_index_input{}.

-record(stream_secondary_index_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_secondary_index_output() :: #stream_secondary_index_output{}.

-record(stream_secondary_index_range_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    timeout :: integer() | undefined,
    max_results :: integer() | undefined,
    continuation :: binary() | undefined,
    return_terms :: boolean() | undefined,
    pagination_sort :: boolean() | undefined,
    term_regex :: binary() | undefined,
    field :: non_empty_string() | undefined,
    start :: binary() | undefined,
    end_ :: binary() | undefined
}).
-type stream_secondary_index_range_input() :: #stream_secondary_index_range_input{}.

-record(stream_secondary_index_range_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    link :: binary() | undefined,
    riak_headers :: riak_headers() | undefined,
    body :: byte_stream()
}).
-type stream_secondary_index_range_output() :: #stream_secondary_index_range_output{}.

-record(update_datatype_input, {
    bucket_type :: uri_safe_identifier() | undefined,
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    r :: quorum() | undefined,
    pr :: quorum() | undefined,
    w :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    return_body :: boolean() | undefined,
    include_context :: boolean() | undefined,
    content_type :: media_type() | undefined,
    update :: datatype_update_payload() | undefined
}).
-type update_datatype_input() :: #update_datatype_input{}.

%% @doc CRDT fetch or update response. When include_context is true, the opaque context may appear in the JSON body and in X-Riak-CRDT-Ctx.
-record(update_datatype_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    crdt_context :: binary() | undefined,
    body :: json_document() | undefined
}).
-type update_datatype_output() :: #update_datatype_output{}.

-record(update_legacy_counter_input, {
    bucket :: uri_safe_identifier() | undefined,
    key :: binary() | undefined,
    timeout :: integer() | undefined,
    w :: quorum() | undefined,
    pw :: quorum() | undefined,
    dw :: quorum() | undefined,
    return_value :: boolean() | undefined,
    amount :: binary() | undefined
}).
-type update_legacy_counter_input() :: #update_legacy_counter_input{}.

-record(update_legacy_counter_output, {
    status_code :: integer() | undefined,
    content_type :: media_type() | undefined,
    body :: binary() | undefined
}).
-type update_legacy_counter_output() :: #update_legacy_counter_output{}.
