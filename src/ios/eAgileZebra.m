/********* eAgileZebra.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "eAgileZebraSdk.h"

@interface eAgileZebra : CDVPlugin

@property (strong, nonatomic) eAgileZebraSdk *sdk;

- (void)setDeveloperKey:(CDVInvokedUrlCommand *)command;
- (void)startSession:(CDVInvokedUrlCommand *)command;
- (void)endSession:(CDVInvokedUrlCommand *)command;
- (void)getTags:(CDVInvokedUrlCommand*)command;
- (void)addBarcodes:(CDVInvokedUrlCommand *)command;
- (void)addTags:(CDVInvokedUrlCommand *)command;

@end

@implementation eAgileZebra

- (void)setDeveloperKey:(CDVInvokedUrlCommand *)command {
	NSString* key = [command.arguments objectAtIndex:0];
    self.sdk = [eAgileZebraSdk sharedDevice];
    [self.sdk setDeveloperKey:key];
}

- (void)startSession:(CDVInvokedUrlCommand *)command {
    self.sdk = [eAgileZebraSdk sharedDevice];
	[self.sdk startSession];
}

- (void)endSession:(CDVInvokedUrlCommand *)command {
    self.sdk = [eAgileZebraSdk sharedDevice];
	[self.sdk endSession];
}

- (void)getTags:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult = nil;
    self.sdk = [eAgileZebraSdk sharedDevice];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[self.sdk getTags]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addBarcodes:(CDVInvokedUrlCommand*)command {
	NSString* csvBarcodes = [command.arguments objectAtIndex:0];
    self.sdk = [eAgileZebraSdk sharedDevice];
    [self.sdk addBarcodes:csvBarcodes];
}

- (void)addTags:(CDVInvokedUrlCommand*)command {
	NSString* jsonTags = [command.arguments objectAtIndex:0];
    self.sdk = [eAgileZebraSdk sharedDevice];
    [self.sdk addTags:jsonTags];
}

@end
