const path = require('path');
const merge = require('webpack-merge');
const baseConfig = require('./webpack.config.js');

module.exports = merge(baseConfig,{
	mode:'production',
	output: {
		filename: 'stream.client.min.js',
		path: path.resolve(__dirname,'./')
	}
});