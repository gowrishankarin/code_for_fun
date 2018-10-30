'use strict';

const express = require('express');
const service = express();
const request = require('superagent');

let gKey = '';

// https://maps.googleapis.com/maps/api/timezone/json?location=39.6034810,-119.6822510&timestamp=1331161200&key=YOUR_API_KEY
// https://maps.googleapis.com/maps/api/geocode/json?address=Berlin&key=
service.get('/service/:location', (req, res, next) => {

    request.get('https://maps.googleapis.com/maps/api/geocode/json')
        .query({address: req.params.location})
        .query({key: gKey})
        .end((err, response) => {
            if(err) {
                console.log(err);
                return res.sendStatus(500);
            }

            res.json(response.body.results[0].geometry.location);
        });
});

module.exports = service;