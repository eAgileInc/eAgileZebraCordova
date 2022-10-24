//
//  eAgileZebraSdk.h
//  eAgileZebraSdk
//
//  Created by Benjamin Schippers on 10/21/22.
//

#import <Foundation/Foundation.h>

//! Project version number for eAgileZebraSdk.
FOUNDATION_EXPORT double eAgileZebraSdkVersionNumber;

//! Project version string for eAgileZebraSdk.
FOUNDATION_EXPORT const unsigned char eAgileZebraSdkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <eAgileZebraSdk/PublicHeader.h>

@interface eAgileZebraApi:NSObject

- (NSString*) getTags;

@end
