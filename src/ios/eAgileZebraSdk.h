#import <Foundation/Foundation.h>

@interface eAgileZebraSdk : NSObject

+ (instancetype)sharedDevice;

- (void)setDeveloperKey:(NSString*)key;
- (void)startSession;
- (void)endSession;
- (NSString*)getTags;
- (void)addBarcodes:(NSString*)csvBarcodes;
- (void)addTags:(NSString*)jsonTags;

@end
