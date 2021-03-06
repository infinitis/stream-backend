const path = require('path');
const webpack = require('webpack');

module.exports = {
	target:'web',
	entry:'./src/index.js',
	module: {
		rules: [
			{
				test: /\.css$/,
				use: [
					'style-loader',
					{
						loader:	'css-loader',
						options: {
							modules: true
						}
					}
				],
			}
		]
	},
	devServer: {
		disableHostCheck: true
	},
	plugins:[
		new webpack.ProvidePlugin({
			React:'react',
			createElement:['react','createElement']
		}),
		new webpack.EnvironmentPlugin(['__STREAM_URL__'])
	],
	resolve: {
		modules:[
			path.resolve('./src'),
			path.resolve('./node_modules')
		]
	},
	output: {
		filename: 'stream.client.min.js',
		path: path.resolve(__dirname,'./')
	}
};