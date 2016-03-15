/********* CDVCookieJar.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface CDVCookieJar : CDVPlugin {
  // Member variables go here.
}

- (void) emptyCookies:(CDVInvokedUrlCommand*)cdvCommand;
- (void) storeCookies:(CDVInvokedUrlCommand*)cdvCommand;
- (void) restoreCookies:(CDVInvokedUrlCommand*)cdvCommand;

@end

@implementation CDVCookieJar

- (void) emptyCookies:(CDVInvokedUrlCommand*)cdvCommand
{
    NSString *key = @"cdvCookieJar";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
}

- (void) storeCookies:(CDVInvokedUrlCommand*)cdvCommand
{
    NSMutableArray *cookieArray = [[NSMutableArray alloc] init];
    NSHTTPCookie *cookie;
    for (cookie in [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies) {
        [cookieArray addObject:cookie.properties];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = @"cdvCookieJar";
    [defaults setObject:[NSArray arrayWithArray:cookieArray] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) restoreCookies:(CDVInvokedUrlCommand*)cdvCommand
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSHTTPCookie  *cookie;
    NSString *key = @"cdvCookieJar";
    NSArray *cookieArray = (NSArray*)[defaults objectForKey:key];
    for (NSDictionary *cookieProps in cookieArray) {
        cookie = [[NSHTTPCookie alloc] initWithProperties:cookieProps];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
}

@end
