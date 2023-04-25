#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol eAgileZebraDelegate

- (void)tagDataReported:(NSString*)jsonTag;
- (void)readerChanged:(NSString*)jsonReader;

@end

@interface eAgileZebraSdk : NSObject

+ (instancetype)sharedDevice;

- (void)setDelegate:(id<eAgileZebraDelegate>)newDelegate;
- (void)setDeveloperKey:(NSString*)key;
- (void)startSession;
- (void)endSession;
- (NSString*)getTags;
- (void)addBarcodes:(NSString*)csvBarcodes;
- (void)addTags:(NSString*)jsonTags;
- (void)setTransmitPower:(NSInteger)power;
- (void)setRssiFilter:(NSInteger)filter;

@end

NS_ASSUME_NONNULL_END
