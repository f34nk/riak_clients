X:=$(shell find service/*/Dockerfile -type f -maxdepth 1 -exec dirname {} \;)
SERVICES:=$(foreach x,$(X),$(x)/)
BUILD_LOGS=build.log

.PHONY: all
all: build

.PHONY: build/smithy
build/smithy:
	$(MAKE) -C target/python build/smithy
	$(MAKE) -C target/elixir build/smithy
	$(MAKE) -C target/erlang build/smithy

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

.PHONY: clean
clean:
	$(MAKE) -C target/python clean
	$(MAKE) -C target/elixir clean
	$(MAKE) -C target/erlang clean

.PHONY: demo
demo:
	#
	# Demo
	#
	time make docker/up  2>&1 | tee -i $(BUILD_LOGS)
	if grep -q "All demos finished" $(BUILD_LOGS); then \
		echo "build.log ...ok"; \
	else \
		make docker/logs; \
		echo "build.log ...failed"; \
		exit 1 ; \
	fi;

.PHONY: docker/up
docker/up:
	#
	# Docker/up
	#
	docker compose down -v
	bash -ec 'set -o pipefail; \
		if docker image inspect riak_clients-openriak:demo >/dev/null 2>&1; then \
			echo "Using existing riak_clients-openriak:demo image" | tee compose.log; \
		else \
			echo "Building riak_clients-openriak:demo (this can take several minutes)" | tee compose.log; \
			DOCKER_BUILDKIT=1 BUILDKIT_PROGRESS=plain docker compose build openriak 2>&1 | tee -a compose.log; \
		fi; \
		DOCKER_BUILDKIT=1 BUILDKIT_PROGRESS=plain docker compose build python-demo elixir-demo erlang-demo 2>&1 | tee -a compose.log; \
		docker compose up -d --no-build 2>&1 | tee -a compose.log'
	i=0; \
	while [ $$i -lt 180 ]; do \
		state=$$(docker compose ps -a --format '{{.State}}' demo-done 2>/dev/null | head -1); \
		printf "state=%s\n" "$$state" >&2; \
		case "$$state" in \
			exited) \
				code=$$(docker compose ps -a --format '{{.ExitCode}}' demo-done 2>/dev/null | head -1); \
				if [ "$$code" = "0" ]; then break; fi; \
				echo "demo-done exited with code $$code"; \
				make docker/logs; \
				exit 1; \
				;; \
		esac; \
		sleep 1; \
		i=$$((i + 1)); \
	done; \
	if [ $$i -ge 180 ]; then \
		echo "timed out waiting for demo-done"; \
		make docker/logs; \
		exit 1; \
	fi
	make docker/logs
	docker compose down -v > /dev/null 2>&1
	echo "All demos finished" >> $(BUILD_LOGS)

.PHONY: docker/down
docker/down:
	#
	# Docker/down
	#
	docker compose down -v --rmi local

.SILENT: docker/logs
.PHONY: docker/logs
docker/logs:
	mkdir -p build/; \
	build_log=build/docker.log; \
	rm -rf $$build_log; \
	touch $$build_log; \
	for demo in $(SERVICES); do \
		name="$$(echo $$demo|cut -d/ -f2)"; \
		logfile="build/docker-$$name.log"; \
		echo "========== $$name =========="; \
		docker compose logs --no-color "$$name"|tee $$logfile; \
		echo; \
		if [ "$$name" != "openriak" ]; then \
			if grep -q "Demo complete" $$logfile; then \
				echo "$$logfile ...ok" >> $$build_log; \
			else \
				echo "$$logfile ...failed" >> $$build_log; \
			fi; \
		fi; \
	done; \
	cat $$build_log;
