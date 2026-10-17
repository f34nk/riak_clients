VERSION := $(shell cat VERSION)

M2_LOCAL := file://$(HOME)/.m2/repository
MAVEN_CENTRAL := https://repo.maven.apache.org/maven2
export SMITHY_MAVEN_REPOS := $(M2_LOCAL)|$(MAVEN_CENTRAL)

JDK21 := $(shell asdf where java openjdk-21 2>/dev/null)
ifeq ($(strip $(JDK21)),)
JDK21 := $(shell /usr/libexec/java_home -v 21 2>/dev/null)
endif
ifeq ($(strip $(JDK21)),)
JDK21 := $(JAVA_HOME)
endif

CODEGEN_JAVA := generated/client/java-codegen/java
CODEGEN_RESOURCES := generated/client/java-codegen/resources
MODEL_JSON := generated/client/model/model.json
PACKAGE_MARKER := src/main/java/openriak/v3_4/api/client/OpenRiakClient.java
MVN := JAVA_HOME="$(JDK21)" mvn -q -Drevision=$(VERSION)

.PHONY: build/smithy
build/smithy:
	@test -n "$(JDK21)" || { echo "Java 21 required (asdf openjdk-21, JAVA_HOME, or /usr/libexec/java_home -v 21)"; exit 1; }
	JAVA_HOME="$(JDK21)" smithy build 2>build-errors.log || (cat build-errors.log; exit 1)
	rm -f build-errors.log

.PHONY: sync
sync: build/smithy
	@test -d "$(CODEGEN_JAVA)/openriak/v3_4" || { echo "missing $(CODEGEN_JAVA)/openriak/v3_4; run make build/smithy"; exit 1; }
	rm -rf src/main/java/openriak/v3_4
	mkdir -p src/main/java/openriak
	cp -R "$(CODEGEN_JAVA)/openriak/v3_4" src/main/java/openriak/
	rm -rf src/main/resources/META-INF
	mkdir -p src/main/resources
	cp -R "$(CODEGEN_RESOURCES)/META-INF" src/main/resources/
	mkdir -p src/main/resources/openriak
	cp "$(MODEL_JSON)" src/main/resources/openriak/openriak-3.4.model.json

.PHONY: compile
compile:
	@test -f "$(PACKAGE_MARKER)" || { echo "missing $(PACKAGE_MARKER); run make sync"; exit 1; }
	@test -n "$(JDK21)" || { echo "Java 21 required (asdf openjdk-21, JAVA_HOME, or /usr/libexec/java_home -v 21)"; exit 1; }
	$(MVN) -DskipTests compile

.PHONY: build
build: sync compile

.PHONY: test
test: compile
	$(MVN) test

.PHONY: dist
dist: compile
	$(MVN) -DskipTests package

.PHONY: maven/publish-dry-run
maven/publish-dry-run: dist
	# Stages a Central Portal bundle without uploading (skipUpload=true).
	$(MVN) -Pcentral -DskipTests -DskipUpload=true deploy

.PHONY: maven/publish
maven/publish: dist
	# Uploads and auto-publishes to Maven Central Portal.
	# Requires a ~/.m2/settings.xml server id central (CENTRAL_USERNAME / CENTRAL_PASSWORD)
	# and GPG signing (performRelease=true).
	$(MVN) -Pcentral -DskipTests -DperformRelease=true -DautoPublish=true -DwaitUntil=published deploy

.PHONY: clean
clean:
	rm -rf target generated build-errors.log .flattened-pom.xml
