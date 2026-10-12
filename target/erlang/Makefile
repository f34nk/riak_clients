VERSION := $(shell cat VERSION)

M2_LOCAL := file://$(HOME)/.m2/repository
MAVEN_CENTRAL := https://repo.maven.apache.org/maven2
export SMITHY_MAVEN_REPOS := $(M2_LOCAL)|$(MAVEN_CENTRAL)

OPENRIAK_CODEGEN_JAR := $(HOME)/.m2/repository/openriak/openriak-erlang-codegen/0.1.0/openriak-erlang-codegen-0.1.0.jar
OPENRIAK_CODEGEN_SRCS := $(shell find codegen/src codegen/pom.xml -type f 2>/dev/null)
JDK21 := $(shell asdf where java openjdk-21 2>/dev/null)

.PHONY: build/smithy
build/smithy: install-openriak-codegen
	@test -n "$(JDK21)" || { echo "openjdk-21 not found via asdf"; exit 1; }
	JAVA_HOME="$(JDK21)" smithy build 2>build-errors.log || (cat build-errors.log; exit 1)
	rm -f build-errors.log

.PHONY: install-openriak-codegen
install-openriak-codegen: $(OPENRIAK_CODEGEN_JAR)

$(OPENRIAK_CODEGEN_JAR): $(OPENRIAK_CODEGEN_SRCS)
	cd codegen && JAVA_HOME="$(JDK21)" mvn -q install

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
	rm -rf _build *.tar generated build-errors.log codegen/target
