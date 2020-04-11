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
		player.initialize(this.videoRef.current,url,true)
	}
	render() {
		return createElement("div",{className:style.container},
			createElement("video",{ref:this.videoRef,className:style.player,controls:true})
		);
	}
}