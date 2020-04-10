import hls from 'hls.js';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
	}
	componentDidMount() {
		if(hls.isSupported()) {
			const Hls = new hls();
			Hls.loadSource(process.env.__STREAM_URL__);
			Hls.attachMedia(this.videoRef);
			Hls.on(hls.Events.MANIFEST_PARSED,() => {
				this.videoRef.play();
			});
		} else if(this.videoRef.canPlayType('application/vnd.apple.mpegurl')) {
			this.videoRef.src = process.env.__STREAM_URL__;
			this.videoRef.addEventListener('loadmetadata', () => {
				this.videoRef.play();
			});
		} else {
			throw new Error("hls not supported");
		}
	}
	render() {
		return createElement("div",{className:style.container},
			createElement("video",{ref:this.videoRef})
		);
	}
}