const webpack = require('webpack');
const nodeExternals = require('wepack-node-externals');

module.exports = function(options) {
    return {
        ...options,
        entry: [],
        watch: true,
        externals: [
            nodeExternals({
                whitelist: ['webpack/hot/poll?100']
            })
        ],
        plugins: [...options.plugins, new webpack.HotModuleReplacementPlugin()],
    };
}