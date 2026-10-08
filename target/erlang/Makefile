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
	# --repo hexpm is required so rebar3_hex merges HEX_API_KEY into the repo config.
	rebar3 hex publish --repo hexpm --yes --dry-run

.PHONY: hex/publish
hex/publish: dist
	# Requires HEX_API_KEY (or interactive Hex local password).
	# --repo hexpm is required so rebar3_hex merges HEX_API_KEY into the repo config.
	rebar3 hex publish --repo hexpm --yes

.PHONY: clean
clean:
	rebar3 clean
	rm -rf _build *.tar
