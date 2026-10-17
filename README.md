# riak_clients

Publishable [OpenRiak](https://github.com/OpenRiak/) HTTP client libraries for Python, Elixir, Erlang, and Java.

Clients are generated from the OpenRiak Smithy model under `model/` and synced into each package source tree.

## Layout

- `target/python` - PyPI package `openriak`
- `target/elixir` - Hex package `openriak_ex`
- `target/erlang` - Hex package `openriak_erl`
- `target/java` - Maven package `io.github.f34nk:openriak`
- `service/openriak` - OpenRiak node for local demos
- `service/*-demo` - demos that depend on the target packages

Each target keeps its own `VERSION` and publish Makefile target.

## Docker demos

Run OpenRiak and the language demos (each installs the matching `target/` client
package and talks to `service/openriak`):

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

## Publishing

Dry-run package builds and registry checks without uploading:

```shell
make publish-dry-run
```

Push a tag matching `v*` (for example `v0.1.0`). The release workflow
compares that tag to the previous version tag and publishes only
targets that changed under `target/<lang>/`. Each publish job runs the
dry-run target first, then uploads.

Each package uses its own `VERSION`:

- PyPI `openriak` via Trusted Publishing (`pypi` environment)
- Hex `openriak_ex` and `openriak_erl` via `HEX_API_KEY` (`hex` environment)
- Maven Central `io.github.f34nk:openriak` via `CENTRAL_USERNAME` / `CENTRAL_PASSWORD`
  and GPG signing (`maven` environment)

Before the first release, create GitHub Environments `pypi`, `hex`, and `maven`,
configure the PyPI trusted publisher for this repository, store `HEX_API_KEY` on
the `hex` environment, and store Maven Central Portal credentials plus a GPG
private key on the `maven` environment.
