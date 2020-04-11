## Stream Backend Project

### To Do:
- [x] create w/ nginx + rtmp module
	- [ ] modify endpoint so only single key can push to it
		- [ ] env ENDPOINT_KEY
- [ ] create k8s cluster
	- [x] add letsencrypt
	- [ ] create yamls
		- [ ] setup registry in k8s
			- [ ] setup new repo
			- [ ] point registry.infiniteadaptability.org to big server
			- [ ] verify vhosts works
			- [ ] update registry to use certs
		- [ ] login to registry from dev (using https)
		- [ ] figure out best way to push images to registry
		- [ ] figure out space/storage requirements best practices
	- [ ] push live

### Later
- [ ] integrate w/ bitcoin/lightning project
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend