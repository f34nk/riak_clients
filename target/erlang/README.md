# openriak_erl

Erlang HTTP client for OpenRiak, generated from the OpenRiak Smithy model.

```erlang
{deps, [
    {openriak_erl, "0.1.6"}
]}.
```

```erlang
-include_lib("openriak_erl/src/openriak_types.hrl").

Config = #{base_url => <<"http://127.0.0.1:8098">>},
Body = <<"{\"message\":\"hello\"}">>,

%% Default bucket path: /buckets/{bucket}/keys/{key}
{ok, _} = openriak_client:put_default_object(Config, #put_default_object_operation_input{
    bucket = <<"demo">>,
    key = <<"hello">>,
    content_type = <<"application/json">>,
    w = <<"1">>,
    dw = <<"1">>,
    body = Body
}),

{ok, #get_default_object_output{body = DefaultBody}} =
    openriak_client:get_default_object(Config, #get_default_object_operation_input{
        bucket = <<"demo">>,
        key = <<"hello">>
    }),

%% Typed bucket path: /types/{bucketType}/buckets/{bucket}/keys/{key}
{ok, _} = openriak_client:put_object(Config, #put_object_operation_input{
    bucket_type = <<"default">>,
    bucket = <<"demo">>,
    key = <<"hello-typed">>,
    content_type = <<"application/json">>,
    w = <<"1">>,
    dw = <<"1">>,
    body = Body
}),

{ok, #get_object_output{body = TypedBody}} =
    openriak_client:get_object(Config, #get_object_input{
        bucket_type = <<"default">>,
        bucket = <<"demo">>,
        key = <<"hello-typed">>
    }).
```

Operation functions take a config map and an input record. See `openriak_client` and `openriak_types.hrl` for the full API.

## Custom HTTP client

By default the client sends HTTP through `runtime_http_client_httpc` (OTP `httpc`). Override the adapter by setting `http_client` on the config map passed into operations.

Implement `-behaviour(runtime_http_client)`. Include the runtime headers from this package. The request is `#http_client_request{}` (`method`, `url`, `headers`, `body`). Return `{ok, #http_response{}}` or `{error, Reason}`.

```erlang
-module(my_http_client).
-behaviour(runtime_http_client).

-include_lib("openriak_erl/src/runtime_types.hrl").
-include_lib("openriak_erl/src/runtime_http_client.hrl").

-export([request/1]).

request(#http_client_request{
    method = Method,
    url = Url,
    headers = Headers,
    body = Body
}) ->
    %% call your HTTP stack with Method, Url, Headers, and Body
    {ok, #http_response{status = 200, headers = [], body = <<>>}}.
```

Pass the module in config:

```erlang
Config = #{
    base_url => <<"http://127.0.0.1:8098">>,
    http_client => my_http_client
},
openriak_client:get_default_object(Config, Input).
```

Typical uses: swap in Gun or another HTTP stack, inject mocks in tests, or add tracing and custom TLS around the request.
