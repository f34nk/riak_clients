# openriak_erl

Erlang HTTP client for OpenRiak, generated from the OpenRiak Smithy model.

```erlang
{deps, [
    {openriak_erl, "0.1.5"}
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
