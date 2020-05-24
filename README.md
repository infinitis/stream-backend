## Stream Backend Project

Environmental Variables Required:

endpoint:
- ENDPOINT_KEY

pull_relay:
- PULL_ENDPOINT

push_relay:
- PUSH_ENDPOINT

### To Do:
- [x] create w/ nginx + rtmp module
	- [ ] modify endpoint so only single key can push to it
		- [ ] env ENDPOINT_KEY
- [ ] create on k8s cluster
	- [ ] push live

### Later
- [ ] integrate w/ bitcoin/lightning project
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend