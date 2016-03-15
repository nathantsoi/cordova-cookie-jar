# Cordova Cookie Jar

use plugman to rebuild!

Your Cordova app needs more persistent cookie based sessions.

    <script>

       // ... somewhere after cookies have been created
       cordova.plugins.CDVCookieJar.storeCookiesForDomain("your-domain.com");

       // ... somewhere before you wish those cookies didn't disappear
       cordova.plugins.CDVCookieJar.restoreCookiesForDomain("your-domain.com");

       // ... somewhere after those cookies are no good anymore
       cordova.plugins.CDVCookieJar.emptyCookiesForDomain("your-domain.com");

    </script>
