VERSION := $(shell cat VERSION)

.PHONY: build
build:
	@test "$(VERSION)" = "$$(sed -n 's/^version = \"\(.*\)\"/\1/p' pyproject.toml | head -1)" \
		|| (echo "VERSION ($(VERSION)) does not match pyproject.toml" && exit 1)
	uv build --out-dir dist

.PHONY: test
test:
	uv run --with . python -c "from openriak import OpenRiakClient; c = OpenRiakClient(); assert c.endpoint"

.PHONY: dist
dist: build

.PHONY: pypi/publish-dry-run
pypi/publish-dry-run: dist
	uv publish --dry-run dist/*

.PHONY: pypi/publish
pypi/publish: dist
	uv publish --trusted-publishing always dist/*
