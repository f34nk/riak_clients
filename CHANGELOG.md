# Changelog

All notable changes to this project will be documented here.

## 2026-10-17

### Added

- Demos and package READMEs exercise both typed and default object put/get.
- Java client package (`io.github.f34nk:openriak`) with Smithy codegen, HTTP protocol bindings, Maven Central publish targets, and a Compose demo.

### Changed

- Package versions: Python and Elixir `0.1.4`, Erlang `0.1.5`, Java `0.1.0`.
- Released tags `v0.2.4` and `v0.2.5` covering typed and default object put/get demos, package version bumps, and changelog corrections.

## 2026-10-12

### Added

- Smithy model and per-language codegen plugins for Python, Elixir, and Erlang clients.
- `make build/smithy` to generate clients from the OpenRiak model, then sync into each package source tree.
- Elixir and Erlang codegen use smithy-beam `0.3.1` (`io.github.f34nk.smithy.beam:codegen-elixir` / `codegen-erlang`) from Maven Central.
- Docker Compose stack with an OpenRiak node and Python, Elixir, and Erlang demos that depend on the target client packages.
- `make demo` orchestration to build, run, and verify the Compose demos.
- Release demo job caches the OpenRiak Docker image via Buildx and GitHub Actions cache.

### Changed

- Packages ship generated OpenRiak HTTP clients instead of placeholders.
- Package versions: Python and Elixir `0.1.3`, Erlang `0.1.4`.
- `make test` and package publish targets use already-synced sources and no longer require Smithy or Java 21 in CI.
- `make demo` streams Compose build output, reuses an existing OpenRiak image when present, and no longer deletes that image between runs.
- Release workflow no longer runs `make demo` after publish jobs.
- Released tags `v0.2.0` through `v0.2.3` covering Smithy-generated clients, Docker demos, and publish CI fixes.

### Fixed

- Release CI no longer fails while regenerating clients during publish test jobs.

## 2026-10-08

### Added

- Repository skeleton with placeholder Python (PyPI), Elixir (Hex), and Erlang (Hex) client packages.
- Tag-triggered release workflow and dry-run publish targets for each package.
- make clean target to remove build artifacts across all client packages.

### Fixed

- PyPI dry-run and local publish auth so builds do not prompt interactively.
- Erlang Hex publishing: pin rebar3_hex, install rebar3 in CI, pass HEX_API_KEY, and use the hexpm repo.
- Package homepage URLs for Hex and GitHub metadata.

### Changed

- Erlang client module renamed to openriak_client; package versions driven from VERSION files.
- Released tags v0.1.0 through v0.1.5 covering the bootstrap, CI publish fixes, homepage corrections, and version bumps.

## 2026-09-04

- first commit
