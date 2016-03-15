/********* CDVCookieJar.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface CDVCookieJar : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation CDVCookieJar

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) emptyCookiesForDomain:(CDVInvokedUrlCommand*)cdvCommand
{
    NSString *domain = (NSString*) [cdvCommand.arguments objectAtIndex:0];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:[NSString stringWithFormat:@"cdvCookieJar:@%@", domain]];
}

- (void) storeCookiesForDomain:(CDVInvokedUrlCommand*)cdvCommand
{
    NSString *domain = (NSString*) [cdvCommand.arguments objectAtIndex:0];
    NSMutableArray *cookieArray = [[NSMutableArray alloc] init];
    NSHTTPCookie *cookie;
    for (cookie in [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies) {
        if ([cookie.domain isEqualToString:domain]) {
            [cookieArray addObject:cookie.properties];
        }
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSArray arrayWithArray:cookieArray] forKey:[NSString stringWithFormat:@"cdvCookieJar:@%@", domain]];
}

- (void) restoreCookiesForDomain:(CDVInvokedUrlCommand*)cdvCommand
{
    NSString *domain = (NSString*) [cdvCommand.arguments objectAtIndex:0];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSHTTPCookie  *cookie;
    NSArray *cookieArray = (NSArray*)[defaults objectForKey:[NSString stringWithFormat:@"cdvCookieJar:@%@", domain]];
    for (NSDictionary *cookieProps in cookieArray) {
        cookie = [[NSHTTPCookie alloc] initWithProperties:cookieProps];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
}

@end
