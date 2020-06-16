import {MediaPlayer} from 'dashjs';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
	}
	componentDidMount() {
		const url = process.env.__STREAM_URL__;
		const player = MediaPlayer().create();
		player.initialize(this.videoRef.current,url,true);
		player.on(dashjs.MediaPlayer.events["ERROR"],this.onError);
		player.on(dashjs.MediaPlayer.events["MANIFEST_LOADED"],this.onManifestLoaded);
		player.on(dashjs.MediaPlayer.events["PLAYBACK_ENDED"],this.onPlaybackEnded);
		player.on(dashjs.MediaPlayer.events["PLAYBACK_STALLED"],this.onPlaybackStalled);
		player.on(dashjs.MediaPlayer.events["SOURCE_INITIALIZED"],this.onSourceInitialized);
		player.on(dashjs.MediaPlayer.events["STREAM_INITIALIZED"],this.onStreamInitialized);
	}
	onError(event) {
		console.log('error',event);
	}
	onManifestLoaded(event) {
		console.log('onmanifestloaded',event);
	}
	onPlaybackEnded(event) {
		console.log('pb ended',event);
	}
	onPlaybackStalled(event) {
		console.log('pb stalled',event);
	}
	onSourceInitialized(event) {
		console.log('src init',event);
	}
	onStreamInitialized(event) {
		console.log('stream init',event);
	}
	render() {
		return createElement("div",{className:style.container},
			createElement("video",{ref:this.videoRef,className:style.player,controls:true,autoPlay:true})
		);
	}
}