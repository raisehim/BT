'use strict;'

const Node = require('./node');

const startBT = async () => {

};

const testBT = async () => {
    return "A";
};


module.exports = testBT()
    .then(console.info, console.error);