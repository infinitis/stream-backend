import hls from 'hls.js';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
	}
	componentDidMount() {
		const player = this.videoRef;
		if(hls.isSupported()) {
			const Hls = new hls();
			Hls.loadSource(process.env.__STREAM_URL__);
			Hls.attachMedia(player);
			Hls.on(hls.Events.MANIFEST_PARSED,() => {
				player.play();
			});
			Hls.on(hls.Events.ERROR,(event,data) => {
				console.log(event);
				console.log(data);
			});
		} else if(player.canPlayType('application/vnd.apple.mpegurl')) {
			player.src = process.env.__STREAM_URL__;
			player.addEventListener('loadmetadata', () => {
				player.play();
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