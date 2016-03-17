# Cordova Cookie Jar

Your Cordova app needs more persistent cookie based sessions.

    <script>

       // ... somewhere after cookies have been created
       cordova.plugins.CDVCookieJar.storeCookies();

       // ... somewhere before you wish those cookies didn't disappear
       cordova.plugins.CDVCookieJar.restoreCookies();

       // ... somewhere after those cookies are no good anymore
       cordova.plugins.CDVCookieJar.emptyCookies();

    </script>

> use plugman to recreate project!
