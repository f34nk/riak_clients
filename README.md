# riak_clients

[![CI](https://github.com/f34nk/riak_clients/actions/workflows/release.yml/badge.svg)](https://github.com/f34nk/riak_clients/actions/workflows/ci.yml)

Collection of [OpenRiak](https://github.com/OpenRiak/) HTTP client libraries for Python, Elixir, Erlang, and Java.

Clients are generated from the OpenRiak Smithy model under `model/` and synced into each package source tree.

## Layout

- [target/python](https://github.com/f34nk/riak_clients/tree/first-draft/target/python) - PyPI package [openriak](https://pypi.org/project/openriak/)
- [target/elixir](https://github.com/f34nk/riak_clients/tree/first-draft/target/elixir) - Hex package [openriak_ex](https://hex.pm/packages/openriak_ex)
- [target/erlang](https://github.com/f34nk/riak_clients/tree/first-draft/target/erlang) - Hex package [openriak_erl](https://hex.pm/packages/openriak_erl)
- [target/java](https://github.com/f34nk/riak_clients/tree/first-draft/target/java) - Maven package [io.github.f34nk:openriak](https://central.sonatype.com/artifact/io.github.f34nk/openriak)
- [service/openriak](https://github.com/f34nk/riak_clients/tree/first-draft/service/openriak) - OpenRiak running in Docker for local demos
- `service/*-demo` - demos that depend on the target packages

Each target keeps its own `VERSION` and publish Makefile target.

## Docker demos

Run OpenRiak and the language demos (each installs the matching `target/` client
package and talks to [service/openriak](https://github.com/f34nk/riak_clients/tree/first-draft/service/openriak)):

```shell
docker compose up --build
```

Demos wait for OpenRiak health, then put/get sample objects and exit. `demo-done`
succeeds when all demos complete successfully.

## Local usage

Test and package using the committed package sources:

```shell
make test
make publish-dry-run
```

Regenerate from the Smithy model (requires Java 21 and the Smithy CLI), sync into package sources, then compile:

```shell
make build/smithy
make build
```

`make build` regenerates and syncs before compiling. `make test` and publish targets use already-synced sources and do not require Smithy.
