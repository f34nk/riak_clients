-module(openriak_erl_tests).

-include_lib("eunit/include/eunit.hrl").
-include("openriak_types.hrl").
-include("runtime_types.hrl").

generated_client_loaded_test() ->
    {module, openriak_client} = code:ensure_loaded(openriak_client),
    ?assertEqual(true, erlang:function_exported(openriak_client, ping, 2)).

encode_ping_request_test() ->
    Request = openriak_http:encode_ping_request(#ping_input{}),
    ?assertEqual(<<"GET">>, Request#http_request.method),
    ?assertEqual(<<"/ping">>, Request#http_request.path),
    ?assertEqual(#{}, Request#http_request.query),
    ?assertEqual([], Request#http_request.headers),
    ?assertEqual(<<>>, Request#http_request.body),
    ok.

decode_ping_response_test() ->
    Response = #http_response{
        status = 200,
        headers = [{<<"Content-Type">>, <<"text/plain">>}],
        body = <<"OK">>
    },
    {ok, Output} = openriak_http:decode_ping_response(Response),
    ?assertEqual(200, Output#ping_output.status_code),
    ?assertEqual(<<"text/plain">>, Output#ping_output.content_type),
    ?assertEqual(<<"OK">>, Output#ping_output.body),
    ok.

put_default_object_request_test() ->
    Body = <<"{\"client\":\"erlang\",\"message\":\"Hello from OpenRiak\"}">>,
    Input = #put_default_object_operation_input{
        bucket = <<"demo">>,
        key = <<"hello-erlang">>,
        w = <<"1">>,
        dw = <<"1">>,
        content_type = <<"application/json">>,
        body = Body
    },
    Request = openriak_http:encode_put_default_object_request(Input),
    ?assertEqual(<<"PUT">>, Request#http_request.method),
    ?assertEqual(<<"/buckets/demo/keys/hello-erlang">>, Request#http_request.path),
    ?assertEqual(#{<<"w">> => <<"1">>, <<"dw">> => <<"1">>}, Request#http_request.query),
    ?assertEqual(
        [{<<"Content-Type">>, <<"application/json">>}],
        Request#http_request.headers
    ),
    ?assertEqual(Body, Request#http_request.body),
    ok.

get_default_object_request_test() ->
    Input = #get_default_object_operation_input{
        bucket = <<"demo">>,
        key = <<"hello-erlang">>
    },
    Request = openriak_http:encode_get_default_object_request(Input),
    ?assertEqual(<<"GET">>, Request#http_request.method),
    ?assertEqual(<<"/buckets/demo/keys/hello-erlang">>, Request#http_request.path),
    ?assertEqual(#{}, Request#http_request.query),
    ?assertEqual([], Request#http_request.headers),
    ?assertEqual(<<>>, Request#http_request.body),
    ok.

get_default_object_response_test() ->
    Response = #http_response{
        status = 200,
        headers = [
            {<<"Content-Type">>, <<"application/json">>},
            {<<"x-riak-vclock">>, <<"abc">>}
        ],
        body = <<"{\"message\":\"ok\"}">>
    },
    {ok, Output} = openriak_http:decode_get_default_object_response(Response),
    ?assertEqual(200, Output#get_default_object_output.status_code),
    ?assertEqual(#{<<"vclock">> => <<"abc">>}, Output#get_default_object_output.riak_headers),
    ok.
