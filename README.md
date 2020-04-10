## Stream Backend Project

- [x] create w/ nginx + rtmp module
	- [x] basic setup
	- [x] setup basic node endpoint
	- [x] setup hls
	- [x] move to docker-compose (easier testing)
	- [ ] create basic client side browser implementation
		- [x] create basic functionality
		- [x] add to docker-compose
			- [x] env considerations (pass/subst in stream url)
			- [x] copy stream.client.js & index.html to nginx pull_relay
- [ ] create k8s cluster

### Later
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend
- [ ] integrate w/ bitcoin/lightning project