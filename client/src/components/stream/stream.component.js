import hls from 'hls.js';

import style from './stream.css';

export default class Stream extends React.Component {
	constructor(props) {
		super(props);
		this.videoRef = React.createRef();
	}
	componentDidMount() {
		console.log(hls);
		console.log(new Hls());
	}
	render() {
		return createElement("div",{className:style.container},
			createElement("video",{ref:this.videoRef})
		);
	}
}