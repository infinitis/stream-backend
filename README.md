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
- [x] reintegrate push_relay
- [ ] fix playback issues
- [ ] k8s

### Later
- [ ] integrate w/ bitcoin/lightning project
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend