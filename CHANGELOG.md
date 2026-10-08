# Changelog

All notable changes to this project will be documented here.

## [Unreleased]

### Added

- make clean target to remove build artifacts across all client packages.

## 2026-10-08

### Added

- Repository skeleton with placeholder Python (PyPI), Elixir (Hex), and Erlang (Hex) client packages.
- Tag-triggered release workflow and dry-run publish targets for each package.

### Fixed

- PyPI dry-run and local publish auth so builds do not prompt interactively.
- Erlang Hex publishing: pin rebar3_hex, install rebar3 in CI, pass HEX_API_KEY, and use the hexpm repo.
- Package homepage URLs for Hex and GitHub metadata.

### Changed

- Erlang client module renamed to openriak_client; package versions driven from VERSION files.
- Released tags v0.1.0 through v0.1.5 covering the bootstrap, CI publish fixes, homepage corrections, and version bumps.

## 2026-09-04

- first commit
