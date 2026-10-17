OPENRIAK_CLIENT ?= ../../target/java
JDK21 := $(shell asdf where java openjdk-21 2>/dev/null)
ifeq ($(strip $(JDK21)),)
JDK21 := $(shell /usr/libexec/java_home -v 21 2>/dev/null)
endif
ifeq ($(strip $(JDK21)),)
JDK21 := $(JAVA_HOME)
endif
VERSION := $(shell cat $(OPENRIAK_CLIENT)/VERSION)
MVN := JAVA_HOME="$(JDK21)" mvn -q
CLIENT_MVN := JAVA_HOME="$(JDK21)" mvn -q -Drevision=$(VERSION)

.PHONY: install-client
install-client:
	@test -n "$(JDK21)" || { echo "Java 21 required (asdf openjdk-21, JAVA_HOME, or /usr/libexec/java_home -v 21)"; exit 1; }
	cd "$(OPENRIAK_CLIENT)" && $(CLIENT_MVN) -DskipTests install

.PHONY: demo
demo: install-client
	$(MVN) -Dopenriak.version=$(VERSION) -DskipTests package
	RIAK_HOST=$${RIAK_HOST:-127.0.0.1} RIAK_PORT=$${RIAK_PORT:-8098} java -jar target/app.jar

.PHONY: test
test: install-client
	cd "$(OPENRIAK_CLIENT)" && $(CLIENT_MVN) test

.PHONY: clean
clean:
	rm -rf target
