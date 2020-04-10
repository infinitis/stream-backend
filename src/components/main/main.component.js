import style from './main.css';

import {stream} from '../stream/stream.js';

export default class Main extends React.Component {
	render() {
		return createElement("div",{className:style.container},
			createElement(stream,null)
		);
	}
}