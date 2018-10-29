'use strict';

const RTMClient = require('@slack/client').RTMClient;
const CLIENT_EVENTS = require('@slack/client').CLIENT_EVENTS;
let rtm = null;
let nlp = null;

function handleOnAuthenticated(rtmStartData) {
    console.log(`Logged in as ${rtmStartData.self.name} of team ${rtmStartData.team.name}, but not yet connected to a channel`);
}

function handleOnMessage(message) {
    nlp.ask(message.text, (err, res) => {
        if(err) {
            console.log('ASK Error: ' + err);
            return;
        }

        if(!res.intent) {
            return rtm.sendMessage(
                "Sorry, I do not know what you are talking about", 
                message.channel,
                function messageSent() {

                }
            );
        } else if(res.intent[0].value == 'time' && res.location) {
            return rtm.sendMessage(
                `I don't yet know the time in ${res.location[0].value}`, 
                message.channel,
                function messageSent() {
                    
                }
            );
        } else {
            return rtm.sendMessage(
                `Sorry, I don't yet know what you are talking`, 
                message.channel,
                function messageSent() {

                }
            );
        }

        rtm.sendMessage('Sorry, I did not understand', message.channel, function messageSent() {

        });
    });


}

function addAuthenticatedHandler(rtm, handler) {
    // rtm.on(CLIENT_EVENTS.RTM.AUTHENTICATED, handler);
    rtm.on('authenticated', handler);
}

module.exports.init = function slackClient(token, logLevel, nlpClient) {
    rtm = new RTMClient(token, {
        logLevel: logLevel
    });

    nlp = nlpClient;

    addAuthenticatedHandler(rtm, handleOnAuthenticated);
    rtm.on('message',  handleOnMessage);

    return rtm;
}

