build: build_endpoint build_pull_relay build_push_relay

run: run_endpoint run_pull_relay run_push_relay

build_endpoint:
	cd endpoint && $(MAKE) build

build_pull_relay:
	cd pull_relay && $(MAKE) build

build_push_relay:
	cd push_relay && $(MAKE) build

run_endpoint:
	cd endpoint && $(MAKE) build

run_pull_relay:
	cd pull_relay && $(MAKE) run

run_push_relay:
	cd push_relay && $(MAKE) run