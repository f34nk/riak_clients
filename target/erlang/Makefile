VERSION := $(shell cat VERSION)

.PHONY: build
build:
	rebar3 compile

.PHONY: test
test:
	rebar3 eunit

.PHONY: dist
dist:
	rebar3 hex build

.PHONY: hex/publish-dry-run
hex/publish-dry-run: dist
	# Requires HEX_API_KEY (or interactive Hex local password).
	rebar3 hex publish --yes --dry-run

.PHONY: hex/publish
hex/publish: dist
	# Requires HEX_API_KEY (or interactive Hex local password).
	rebar3 hex publish --yes
