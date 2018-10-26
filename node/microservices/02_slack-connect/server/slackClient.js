'use strict';

var RTMClient = require('@slack/client').RTMClient;

//var token = process.env.SLACK_API_ROKEN || 'xoxb-464822094500-466054506327-3GNScD7iLgLMDY5AT9nwc5T4';

module.exports.init = function slackClient(token, logLevel) {
    const rtm = new RTMClient(token, {
        logLevel: logLevel
    });

    return rtm;
}

