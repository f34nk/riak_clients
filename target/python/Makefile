VERSION := $(shell cat VERSION)

M2_LOCAL := file://$(HOME)/.m2/repository
MAVEN_CENTRAL := https://repo.maven.apache.org/maven2
export SMITHY_MAVEN_REPOS := $(M2_LOCAL)|$(MAVEN_CENTRAL)

SMITHY_PYTHON_SRC ?= $(CURDIR)/.smithy-python
SMITHY_PYTHON_REPO ?= https://github.com/smithy-lang/smithy-python.git
SMITHY_PYTHON_REF ?= develop
CODEGEN_JAR := $(HOME)/.m2/repository/software/amazon/smithy/python/codegen/core/0.3.0/core-0.3.0.jar
OPENRIAK_CODEGEN_JAR := $(HOME)/.m2/repository/openriak/openriak-python-codegen/0.1.0/openriak-python-codegen-0.1.0.jar
CODEGEN_SRCS := $(shell find codegen/src codegen/pom.xml -type f 2>/dev/null)
JDK21 := $(shell asdf where java openjdk-21 2>/dev/null)
CLIENT_DIR := generated/client/python-client-codegen
SYNC_SRC := $(CLIENT_DIR)/src/openriak

.PHONY: install-codegen
install-codegen: $(CODEGEN_JAR)

$(CODEGEN_JAR):
	@test -d "$(SMITHY_PYTHON_SRC)/codegen" || { \
		echo "Cloning smithy-python ($(SMITHY_PYTHON_REF))..."; \
		git clone --depth 1 --branch "$(SMITHY_PYTHON_REF)" "$(SMITHY_PYTHON_REPO)" "$(SMITHY_PYTHON_SRC)"; \
	}
	cd "$(SMITHY_PYTHON_SRC)/codegen" && ./gradlew publishToMavenLocal

.PHONY: install-openriak-codegen
install-openriak-codegen: $(OPENRIAK_CODEGEN_JAR)

$(OPENRIAK_CODEGEN_JAR): $(CODEGEN_SRCS)
	cd codegen && JAVA_HOME="$(JDK21)" mvn -q install

.PHONY: build/smithy
build/smithy: install-codegen install-openriak-codegen
	@test -n "$(JDK21)" || { echo "openjdk-21 not found via asdf"; exit 1; }
	JAVA_HOME="$(JDK21)" smithy build 2>build-errors.log || (cat build-errors.log; exit 1)
	rm -f build-errors.log

.PHONY: sync
sync: build/smithy
	@test -d "$(SYNC_SRC)" || { echo "missing $(SYNC_SRC); run make build/smithy"; exit 1; }
	rm -rf src/openriak
	mkdir -p src
	cp -R "$(SYNC_SRC)" src/openriak
	@printf '%s\n' \
		'# Synced from Smithy python-client-codegen. Prefer importing from submodules.' \
		'from .client import OpenRiak' \
		'from .config import Config' \
		'' \
		'__all__ = ["OpenRiak", "Config"]' \
		> src/openriak/__init__.py

.PHONY: build
build: sync
	rm -rf dist
	uv build --out-dir dist

.PHONY: test
test: sync
	uv run --with . --with pytest --with pytest-asyncio python -m pytest test/ -q

.PHONY: dist
dist: build

.PHONY: pypi/publish-dry-run
pypi/publish-dry-run: dist
	# Placeholder token avoids an interactive username prompt; nothing is uploaded.
	UV_PUBLISH_TOKEN=dry-run uv publish --dry-run --trusted-publishing never dist/*

.PHONY: pypi/publish
pypi/publish: dist
	# automatic: OIDC Trusted Publishing in CI; UV_PUBLISH_TOKEN locally
	uv publish --trusted-publishing automatic dist/*

.PHONY: clean
clean:
	rm -rf dist build *.egg-info .pytest_cache generated build-errors.log .smithy-python codegen/target
	find . -type d -name __pycache__ -exec rm -rf {} +
