build: build_push_relay

run: run_push_relay

build_push_relay:
	cd push_relay && $(MAKE) build

run_push_relay:
	cd push_relay && $(MAKE) run