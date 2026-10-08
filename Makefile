.PHONY: all
all: build

.PHONY: build
build:
	$(MAKE) -C target/python build
	$(MAKE) -C target/elixir build
	$(MAKE) -C target/erlang build

.PHONY: test
test:
	$(MAKE) -C target/python test
	$(MAKE) -C target/elixir test
	$(MAKE) -C target/erlang test

.PHONY: dist
dist:
	$(MAKE) -C target/python dist
	$(MAKE) -C target/elixir dist
	$(MAKE) -C target/erlang dist

.PHONY: publish-dry-run
publish-dry-run:
	$(MAKE) -C target/python pypi/publish-dry-run
	$(MAKE) -C target/elixir hex/publish-dry-run
	$(MAKE) -C target/erlang hex/publish-dry-run
