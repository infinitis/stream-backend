import hls from 'hls.js';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
		this.manifest_found = this.manifest_found.bind(this);
		this.handle_hls_error = this.handle_hls_error.bind(this);
	}
	componentDidMount() {
		const player = this.videoRef;
		if(hls.isSupported()) {
			const Hls = new hls();
			Hls.loadSource(process.env.__STREAM_URL__);
			Hls.attachMedia(player);
			Hls.on(hls.Events.MANIFEST_PARSED,this.manifest_found);
			Hls.on(hls.Events.ERROR,this.handle_hls_error);
			this.hls_instance = Hls;
		} else if(player.canPlayType('application/vnd.apple.mpegurl')) {
			player.src = process.env.__STREAM_URL__;
			player.addEventListener('loadmetadata', () => {
				player.play();
			});
		} else {
			throw new Error("hls not supported");
		}
	}
	manifest_found() {
		console.log('play');
		console.log(this.videoRef);
		this.videoRef.play();
	}
	handle_hls_error(event,data) {
		if (data.fatal) {
			switch(data.type) {
				case hls.ErrorTypes.NETWORK_ERROR:
					// try to recover network error
					console.log("fatal network error encountered, try to recover");
					this.hls_instance.startLoad();
					break;
				case hls.ErrorTypes.MEDIA_ERROR:
					console.log("fatal media error encountered, try to recover");
					this.hls_instance.recoverMediaError();
					break;
				default:
					// cannot recover
					this.hls_instance.destroy();
					break;
			}
		}
	}
	render() {
		return createElement("div",{className:style.container},
			createElement("video",{ref:this.videoRef})
		);
	}
}