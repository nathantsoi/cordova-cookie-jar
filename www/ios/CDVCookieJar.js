var exec = require('cordova/exec');

exports.storeCookies = function(success, error) {
    exec(success, error, "CDVCookieJar", "storeCookies");
};

exports.restoreCookies = function(success, error) {
    exec(success, error, "CDVCookieJar", "restoreCookies");
};

exports.emptyCookies = function(success, error) {
    exec(success, error, "CDVCookieJar", "emptyCookies");
};