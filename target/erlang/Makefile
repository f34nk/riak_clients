VERSION := $(shell cat VERSION)

.PHONY: build
build:
	@test "$(VERSION)" = "$$(sed -n 's/.*{vsn, \"\(.*\)\"}.*/\1/p' src/openriak_erl.app.src)" \
		|| (echo "VERSION ($(VERSION)) does not match openriak_erl.app.src" && exit 1)
	rebar3 compile

.PHONY: test
test:
	rebar3 eunit

.PHONY: dist
dist:
	rebar3 hex build

.PHONY: hex/publish
hex/publish: dist
	rebar3 hex publish --yes
