## Stream Backend Project

Environmental Variables Required:

endpoint:
- ENDPOINT_KEY
- PUSH_ENDPOINT (empty stream disables push)

pull_relay:
- ENDPOINT_KEY
- PULL_ENDPOINT

### To Do:
- [x] create w/ nginx + rtmp module
- [x] reintegrate push_relay
- [x] k8s
- [ ] popout link to twitch chat

### Later
- [ ] integrate w/ bitcoin/lightning project
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend