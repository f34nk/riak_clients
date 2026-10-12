VERSION := $(shell cat VERSION)

M2_LOCAL := file://$(HOME)/.m2/repository
MAVEN_CENTRAL := https://repo.maven.apache.org/maven2
export SMITHY_MAVEN_REPOS := $(M2_LOCAL)|$(MAVEN_CENTRAL)

OPENRIAK_CODEGEN_JAR := $(HOME)/.m2/repository/openriak/openriak-elixir-codegen/0.1.0/openriak-elixir-codegen-0.1.0.jar
OPENRIAK_CODEGEN_SRCS := $(shell find codegen/src codegen/pom.xml -type f 2>/dev/null)
JDK21 := $(shell asdf where java openjdk-21 2>/dev/null)
ifeq ($(strip $(JDK21)),)
JDK21 := $(shell /usr/libexec/java_home -v 21 2>/dev/null)
endif
ifeq ($(strip $(JDK21)),)
JDK21 := $(JAVA_HOME)
endif
CODEGEN_DIR := generated/source/elixir-client-codegen
PACKAGE_MARKER := lib/open_riak_client.ex

.PHONY: build/smithy
build/smithy: install-openriak-codegen
	@test -n "$(JDK21)" || { echo "Java 21 required (asdf openjdk-21, JAVA_HOME, or /usr/libexec/java_home -v 21)"; exit 1; }
	JAVA_HOME="$(JDK21)" smithy build 2>build-errors.log || (cat build-errors.log; exit 1)
	rm -f build-errors.log

.PHONY: install-openriak-codegen
install-openriak-codegen: $(OPENRIAK_CODEGEN_JAR)

$(OPENRIAK_CODEGEN_JAR): $(OPENRIAK_CODEGEN_SRCS)
	@test -n "$(JDK21)" || { echo "Java 21 required (asdf openjdk-21, JAVA_HOME, or /usr/libexec/java_home -v 21)"; exit 1; }
	cd codegen && JAVA_HOME="$(JDK21)" mvn -q install

.PHONY: sync
sync: build/smithy
	@test -d "$(CODEGEN_DIR)" || { echo "missing $(CODEGEN_DIR); run make build/smithy"; exit 1; }
	mkdir -p lib
	rm -f lib/*.ex
	cp "$(CODEGEN_DIR)"/*.ex lib/

.PHONY: compile
compile:
	@test -f "$(PACKAGE_MARKER)" || { echo "missing $(PACKAGE_MARKER); run make sync"; exit 1; }
	mix deps.get
	mix compile

.PHONY: build
build: sync compile

.PHONY: test
test: compile
	MIX_ENV=test mix test

.PHONY: dist
dist: compile
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
