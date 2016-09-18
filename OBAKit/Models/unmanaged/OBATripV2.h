#import <OBAKit/OBAHasReferencesV2.h>
#import <OBAKit/OBARouteV2.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBATripV2 : OBAHasReferencesV2

@property (nonatomic, strong) NSString * tripId;
@property (nonatomic, strong) NSString * routeId;
@property (nonatomic, strong) NSString * routeShortName;
@property (nonatomic, strong) NSString * tripShortName;
@property (nonatomic, strong) NSString * tripHeadsign;
@property (nonatomic, strong) NSString * serviceId;
@property (nonatomic, strong) NSString * shapeId;
@property (nonatomic, strong) NSString * directionId;
@property (nonatomic, strong) NSString * blockId;

@property(weak, nonatomic, readonly) OBARouteV2 * route;

@property(nonatomic,copy,readonly) NSString *asLabel;

@end

NS_ASSUME_NONNULL_END
