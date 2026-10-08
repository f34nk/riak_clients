# riak_clients

Publishable OpenRiak HTTP client libraries for Python, Elixir, and Erlang.

## Layout

- `target/python` - PyPI package `openriak`
- `target/elixir` - Hex package `openriak_ex`
- `target/erlang` - Hex package `openriak_erl`

Each target keeps its own `VERSION` and publish Makefile target.

## Local usage

```shell
make build
make test
```

## Publishing

Releases are driven by git tags. The GitHub Actions release workflow
publishes only targets whose files changed since the previous tag.
