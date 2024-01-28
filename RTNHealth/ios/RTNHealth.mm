#ifdef RCT_NEW_ARCH_ENABLED
#import "RTNHealthSpec.h"
#endif
#import "RTNHealth.h"

@implementation RTNHealth

RCT_EXPORT_MODULE();

- (instancetype)init {
    self = [super init];
    
    if (self && [CMPedometer isStepCountingAvailable]) {
        self.pedometer = [[CMPedometer alloc] init];
    }
    
    return self;
}

+ (BOOL)requiresMainQueueSetup {
    return NO;
}

RCT_EXPORT_METHOD(isStepCountingAvailable:(RCTResponseSenderBlock)callback) {
    callback(@[@([CMPedometer isStepCountingAvailable])]);
}

RCT_EXPORT_METHOD(hasMotionPermissions:(RCTResponseSenderBlock)callback) {
    CMAuthorizationStatus authorizationStatus = [CMPedometer authorizationStatus];
    BOOL isAuthorized = authorizationStatus == CMAuthorizationStatusAuthorized;
    
    callback(@[@(isAuthorized)]);
}

RCT_EXPORT_METHOD(queryStepsCount:(NSDate *)startDate endDate:(NSDate *)endDate callback:(RCTResponseSenderBlock)callback) {
    [self.pedometer queryPedometerDataFromDate:startDate
                                        toDate:endDate
                                   withHandler:^(CMPedometerData *pedometerData, NSError *error) {
        if (error) {
            callback(@[[NSNull null]]);
        } else {
            callback(@[pedometerData.numberOfSteps]);
        }
    }];
}

#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
(const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeHealthSpecJSI>(params);
}
#endif



@end
