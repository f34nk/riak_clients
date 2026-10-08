VERSION := $(shell cat VERSION)

.PHONY: build
build:
	mix deps.get
	mix compile

.PHONY: test
test:
	MIX_ENV=test mix test

.PHONY: dist
dist:
	mix deps.get
	mix hex.build

.PHONY: hex/publish
hex/publish: dist
	mix hex.publish --yes
