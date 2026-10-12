VERSION := $(shell cat VERSION)

M2_LOCAL := file://$(HOME)/.m2/repository
MAVEN_CENTRAL := https://repo.maven.apache.org/maven2
export SMITHY_MAVEN_REPOS := $(M2_LOCAL)|$(MAVEN_CENTRAL)

OPENRIAK_CODEGEN_JAR := $(HOME)/.m2/repository/openriak/openriak-elixir-codegen/0.1.0/openriak-elixir-codegen-0.1.0.jar
OPENRIAK_CODEGEN_SRCS := $(shell find codegen/src codegen/pom.xml -type f 2>/dev/null)
JDK21 := $(shell asdf where java openjdk-21 2>/dev/null)
CODEGEN_DIR := generated/source/elixir-client-codegen

.PHONY: build/smithy
build/smithy: install-openriak-codegen
	@test -n "$(JDK21)" || { echo "openjdk-21 not found via asdf"; exit 1; }
	JAVA_HOME="$(JDK21)" smithy build 2>build-errors.log || (cat build-errors.log; exit 1)
	rm -f build-errors.log

.PHONY: install-openriak-codegen
install-openriak-codegen: $(OPENRIAK_CODEGEN_JAR)

$(OPENRIAK_CODEGEN_JAR): $(OPENRIAK_CODEGEN_SRCS)
	cd codegen && JAVA_HOME="$(JDK21)" mvn -q install

.PHONY: sync
sync: build/smithy
	@test -d "$(CODEGEN_DIR)" || { echo "missing $(CODEGEN_DIR); run make build/smithy"; exit 1; }
	mkdir -p lib
	rm -f lib/*.ex
	cp "$(CODEGEN_DIR)"/*.ex lib/

.PHONY: build
build: sync
	mix deps.get
	mix compile

.PHONY: test
test: build
	MIX_ENV=test mix test

.PHONY: dist
dist: build
	mix hex.build

.PHONY: hex/publish-dry-run
hex/publish-dry-run: dist
	mix hex.publish --yes --dry-run

.PHONY: hex/publish
hex/publish: dist
	mix hex.publish --yes

.PHONY: clean
clean:
	mix clean
	rm -rf _build deps *.tar generated build-errors.log codegen/target
