## Stream Backend Project

Environmental Variables Required:

endpoint:
- ENDPOINT_KEY

pull_relay:
- ENDPOINT_KEY
- PULL_ENDPOINT

push_relay:
- ENDPOINT_KEY
- PUSH_ENDPOINT

### To Do:
- [x] create w/ nginx + rtmp module
- [ ] fix playback issues
- [ ] create on k8s cluster
	- [ ] push live

### Later
- [ ] integrate w/ bitcoin/lightning project
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend