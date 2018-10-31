'use strict';

const express = require('express');
const service = express();
const request = require('superagent');
const moment = require('moment');

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

            const location = response.body.results[0].geometry.location;
            const timestamp = +moment().format('X');

            request.get('https://maps.googleapis.com/maps/api/timezone/json')
                .query({
                    location: location.lat +','+ location.lng,
                    timestamp: timestamp,
                    key: gKey
                })
                .end((err, response) => {
                    if(err) {
                        console.log(err);
                        return res.sendStatus(500);
                    }

                    const result = response.body;
                    const timeString = moment.unix(
                        timestamp + result.dstOffset + 
                        result.rawOffset
                    ).utc().format('dddd, MMMM Do YYYY, h:mm:ss a');

                    res.json({
                        result: timeString
                    })

                });
        });
});


module.exports = service;