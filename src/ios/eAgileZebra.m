/********* eAgileZebra.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <eAgileZebraSdk/eAgileZebraSdk.h>

@interface eAgileZebra : CDVPlugin

- (void)getTags:(CDVInvokedUrlCommand*)command;

@end

@implementation eAgileZebra

- (void)getTags:(CDVInvokedUrlCommand*)command {
    NSLog(@"Call getTags");
    CDVPluginResult *pluginResult = nil;
    eAgileZebraApi *api = [[eAgileZebraApi alloc] init];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[api getTags]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
