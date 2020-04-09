import hls from 'hls.js';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
	}
	componentDidMount() {
		console.log(hls);
		if(hls.isSupported()) {
			const Hls = new hls();
			Hls.loadSource("https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8");
			Hls.attachMedia(this.videoRef);
			Hls.on(hls.Events.MANIFEST_PARSED,() => {
				this.videoRef.play();
			});
		} else if(this.videoRef.canPlayType('application/vnd.apple.mpegurl')) {
			this.videoRef.src = "https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8";
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