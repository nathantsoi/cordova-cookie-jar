var exec = require('cordova/exec');

exports.coolMethod = function(arg0, success, error) {
    exec(success, error, "CDVCookieJar", "coolMethod", [arg0]);
};

exports.storeCookiesForDomain = function(arg0, success, error) {
    exec(success, error, "CDVCookieJar", "storeCookiesForDomain", [arg0]);
};

exports.restoreCookiesForDomain = function(arg0, success, error) {
    exec(success, error, "CDVCookieJar", "restoreCookiesForDomain", [arg0]);
};

exports.emptyCookiesForDomain = function(arg0, success, error) {
    exec(success, error, "CDVCookieJar", "emptyCookiesForDomain", [arg0]);
};