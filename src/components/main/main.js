import {connect} from 'react-redux';

import Main from './main.component.js';

const mapStateToProps = (state) => {
	return {};
};

const mapDispatchToProps = (dispatch,ownProps) => {
	return {};
};


export const main = connect(
	mapStateToProps,
	mapDispatchToProps
)(Main);