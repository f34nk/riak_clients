OPENRIAK_EX_PATH ?= $(abspath ../../target/elixir)
export OPENRIAK_EX_PATH

.PHONY: demo
demo:
	mix deps.get
	RIAK_HOST=$${RIAK_HOST:-127.0.0.1} RIAK_PORT=$${RIAK_PORT:-8098} mix run

.PHONY: test
test:
	mix deps.get
	MIX_ENV=test mix test
