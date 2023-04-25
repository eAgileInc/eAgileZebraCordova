var exec = require('cordova/exec');

/**
 * This must be the first function that gets called, and a valid develop key must be passed in, and validated, BEFORE any other functions get executed.
 * @param {string} key The developer key given by eAgile
 */
exports.setDeveloperKey = function (key, error) {
  exec(null, error, 'eAgileZebra', 'setDeveloperKey', [key]);
};

exports.startSession = function (error) {
  exec(null, error, 'eAgileZebra', 'startSession', []);
};

exports.endSession = function (error) {
  exec(null, error, 'eAgileZebra', 'endSession', []);
};

exports.getTags = function (success, error) {
  exec(success, error, 'eAgileZebra', 'getTags', []);
};

exports.addBarcodes = function (csvBarcodes, error) {
  exec(null, error, 'eAgileZebra', 'addBarcodes', [csvBarcodes]);
};

 exports.addTags = function (jsonTags, error) {
  exec(null, error, 'eAgileZebra', 'addTags', [jsonTags]);
};

exports.setTransmitPower = function (power, error) {
  exec(null, error, 'eAgileZebra', 'setTransmitPower', [power]);
};

exports.setRssiFilter = function (filter, error) {
  exec(null, error, 'eAgileZebra', 'setRssiFilter', [filter]);
};

exports.setTagCallback = function (callback) {
  exec(callback, null, 'eAgileZebra', 'setTagCallback', []);
};

exports.setConnectionCallback = function (callback) {
  exec(callback, null, 'eAgileZebra', 'setConnectionCallback', []);
};
