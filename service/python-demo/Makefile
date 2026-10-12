OPENRIAK_CLIENT ?= ../../target/python

.PHONY: demo
demo:
	pip install -e "$(OPENRIAK_CLIENT)"
	RIAK_HOST=$${RIAK_HOST:-127.0.0.1} RIAK_PORT=$${RIAK_PORT:-8098} python src/main.py

.PHONY: test
test:
	pip install -e "$(OPENRIAK_CLIENT)"
	pip install pytest pytest-asyncio
	python -m pytest test/ -q
