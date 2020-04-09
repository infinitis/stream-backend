import hls from 'hls.js';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
	}
	componentDidMount() {
		if(hls.isSupported()) {
			const hls = new hls();
			hls.loadSource("https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8");
			hls.attachMedia(this.videoRef);
			hls.on(Hls.Events.MANIFEST_PARSED,() => {
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