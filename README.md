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

Push a tag matching `v*` (for example `v0.1.0`). The release workflow
compares that tag to the previous version tag and publishes only
targets that changed under `target/<lang>/`.

Each package uses its own `VERSION`:

- PyPI `openriak` via Trusted Publishing (`pypi` environment)
- Hex `openriak_ex` and `openriak_erl` via `HEX_API_KEY` (`hex` environment)

Before the first release, create GitHub Environments `pypi` and `hex`,
configure the PyPI trusted publisher for this repository, and store
`HEX_API_KEY` on the `hex` environment.
