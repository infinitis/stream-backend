import style from './main.css';

export default class Main extends React.Component {
	render() {
		return createElement("div",null,
			createElement("span",null,"Test SPAN")
		);
	}
}