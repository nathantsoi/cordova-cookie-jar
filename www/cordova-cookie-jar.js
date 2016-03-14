var exec = require('cordova/exec');

var cookieJar = {
  storeCookiesForDomain: function(domain) {
    exec(null, null, "CDVCookieJar", "storeCookiesForDomain", [domain]);
  },
  restoreCookiesForDomain: function(domain) {
    exec(null, null, "CDVCookieJar", "restoreCookiesForDomain", [domain]);
  },
  emptyCookiesForDomain: function(domain) {
    exec(null, null, "CDVCookieJar", "emptyCookiesForDomain", [domain]);
  }
}


module.exports = cookieJar;