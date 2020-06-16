## Stream Backend Project

Environmental Variables Required:

endpoint:
- ENDPOINT_KEY
- PUSH_ENDPOINT (empty stream disables push)

pull_relay:
- PULL_ENDPOINT

### To Do:
- [x] create w/ nginx + rtmp module
- [x] reintegrate push_relay
- [x] k8s
- [ ] views?
	- [ ] title?
	- [ ] offline header?
	- [ ] streamer went live?
- [ ] chat
	- [ ] link to popout twitch chat?
		- [ ] position?
	- [ ] embed twitch chat?popout link to twitch chat
- [ ] offramps
	- [ ] test events in stream.component.js
		- [ ] behavior when no stream
		- [ ] behavior when stream ends
		- [ ] behavior when stream starts
- [ ] vods
	- [ ] on start
		- [ ] mv current.mp4 to old.mp4
		- [ ] start saving to current.mp4

### Later
- [ ] integrate w/ bitcoin/lightning project
- [ ] advanced settings/bitrates
- [ ] security considerations
- [ ] replace rtmp w/ custom implementation?
- [ ] setup custom frontend