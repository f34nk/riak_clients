OPENRIAK_ERL_PATH ?= $(abspath ../../target/erlang)

.PHONY: checkout
checkout:
	mkdir -p _checkouts
	ln -sfn "$(OPENRIAK_ERL_PATH)" _checkouts/openriak_erl

.PHONY: demo
demo: checkout
	rebar3 compile
	RIAK_HOST=$${RIAK_HOST:-127.0.0.1} RIAK_PORT=$${RIAK_PORT:-8098} \
	erl -noshell -pa $$(rebar3 path) \
		-eval 'case application:ensure_all_started(demo) of {ok, _} -> halt(0); {error, Reason} -> io:format("~p~n", [Reason]), halt(1) end.'

.PHONY: test
test: checkout
	rebar3 eunit
