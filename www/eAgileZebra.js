var exec = require('cordova/exec');

exports.getTags = function (success, error) {
    exec(success, error, 'eAgileZebra', 'getTags', []);
};
