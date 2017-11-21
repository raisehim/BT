'use strict;'

const Node = require('./node');
const Sensor = require('./sensor');

console.log("ID_RSA");

const startBT = async () => {
};

const testBT = async () => {
    return "A";
};


let BT = module.exports = testBT()
    .then(console.info, console.error);

BT.Node = Node;
BT.Sensor = Sensor;