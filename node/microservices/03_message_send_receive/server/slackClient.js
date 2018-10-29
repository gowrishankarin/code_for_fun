'use strict';

const RTMClient = require('@slack/client').RTMClient;
const CLIENT_EVENTS = require('@slack/client').CLIENT_EVENTS;
let rtm = null;

function handleOnAuthenticated(rtmStartData) {
    console.log(`Logged in as ${rtmStartData.self.name} of team ${rtmStartData.team.name}, but not yet connected to a channel`);
}

function handleOnMessage(message) {
    console.log(message);

    rtm.sendMessage('This is test message', message.channel, function messageSent() {

    })
}

function addAuthenticatedHandler(rtm, handler) {
    // rtm.on(CLIENT_EVENTS.RTM.AUTHENTICATED, handler);
    rtm.on('authenticated', handler);
}

module.exports.init = function slackClient(token, logLevel) {
    rtm = new RTMClient(token, {
        logLevel: logLevel
    });

    addAuthenticatedHandler(rtm, handleOnAuthenticated);
    rtm.on('message',  handleOnMessage);

    return rtm;
}

