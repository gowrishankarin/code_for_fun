'use strict';

const slackClient = require('../server/slackClient');
const service = require('../server/service');
const http = require('http');

const server = http.createServer(service);

const witToken = 'XTJWRO65TFUDGBVBPPD4TYUVCOZFSOHK';
const witClient = require('../server/witClient')(witToken);

const slackToken = 'xoxb-464822094500-466054506327-3GNScD7iLgLMDY5AT9nwc5T4';
const slackLogLevel = 'info';

const serviceRegistry = service.get('serviceRegistry');
const rtm = slackClient.init(slackToken, slackLogLevel, witClient, serviceRegistry);
rtm.start();

server.listen(3000);

server.on('listening', function() {
    console.log(`MICROSERVICE is listening on ${server.address().port} in ${service.get('env')} mode.`)
});