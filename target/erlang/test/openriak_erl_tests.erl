-module(openriak_erl_tests).

-include_lib("eunit/include/eunit.hrl").

new_client_test() ->
    Client = 'openriak.openriak_client':new(),
    ?assertEqual("http://127.0.0.1:8098", 'openriak.openriak_client':endpoint(Client)).
