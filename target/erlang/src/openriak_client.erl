%% @doc Placeholder OpenRiak client. Functionality will be added later.
-module(openriak_client).

-export([new/0, new/1, endpoint/1]).

-record(client, {
    endpoint = "http://127.0.0.1:8098" :: string()
}).

-opaque client() :: #client{}.
-export_type([client/0]).

-spec new() -> client().
new() ->
    new(#{}).

-spec new(map()) -> client().
new(Opts) when is_map(Opts) ->
    Endpoint = maps:get(endpoint, Opts, "http://127.0.0.1:8098"),
    #client{endpoint = Endpoint}.

-spec endpoint(client()) -> string().
endpoint(#client{endpoint = Endpoint}) ->
    Endpoint.
