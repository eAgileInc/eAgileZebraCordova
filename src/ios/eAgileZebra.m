/********* eAgileZebra.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "eAgileZebraSdk.h"

@interface eAgileZebra : CDVPlugin<eAgileZebraDelegate>

@property (strong, nonatomic) eAgileZebraSdk *sdk;
@property (nonatomic, strong) NSString *tagCallbackId;
@property (nonatomic, strong) NSString *connectionCallbackId;

- (void)setDeveloperKey:(CDVInvokedUrlCommand *)command;
- (void)startSession:(CDVInvokedUrlCommand *)command;
- (void)endSession:(CDVInvokedUrlCommand *)command;
- (void)getTags:(CDVInvokedUrlCommand*)command;
- (void)addBarcodes:(CDVInvokedUrlCommand *)command;
- (void)addTags:(CDVInvokedUrlCommand *)command;
- (void)setTransmitPower:(CDVInvokedUrlCommand *)command;
- (void)setRssiFilter:(CDVInvokedUrlCommand *)command;

@end

@implementation eAgileZebra

- (void)setDeveloperKey:(CDVInvokedUrlCommand *)command {
  NSString* key = [command.arguments objectAtIndex:0];
  self.sdk = [eAgileZebraSdk sharedDevice];
  [self.sdk setDeveloperKey:key];
  [self.sdk setDelegate:self];
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

- (void)setTransmitPower:(CDVInvokedUrlCommand *)command {
  NSString* power = [command.arguments objectAtIndex:0];
  self.sdk = [eAgileZebraSdk sharedDevice];
  [self.sdk setTransmitPower:[power integerValue]];
}

- (void)setRssiFilter:(CDVInvokedUrlCommand *)command {
  NSString* filter = [command.arguments objectAtIndex:0];
  self.sdk = [eAgileZebraSdk sharedDevice];
  [self.sdk setRssiFilter:[filter integerValue]];
}

- (void)setTagCallback:(CDVInvokedUrlCommand *)command {
  if (self.tagCallbackId != nil) {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.tagCallbackId];
  }
  self.tagCallbackId = command.callbackId;
  CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
  [pluginResult setKeepCallbackAsBool:YES];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setConnectionCallback:(CDVInvokedUrlCommand *)command {
  if (self.connectionCallbackId != nil) {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.connectionCallbackId];
  }
  self.connectionCallbackId = command.callbackId;
  CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
  [pluginResult setKeepCallbackAsBool:YES];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)tagDataReported:(NSString*)jsonTag {
  if (self.tagCallbackId != nil) {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:jsonTag];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.tagCallbackId];
  }
}

- (void)readerChanged:(NSString*)jsonReader {
  if (self.connectionCallbackId != nil) {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:jsonReader];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.connectionCallbackId];
  }
}

@end
