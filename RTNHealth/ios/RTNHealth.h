#import <React/RCTBridgeModule.h>
#import <CoreMotion/CoreMotion.h>
#ifdef RCT_NEW_ARCH_ENABLED
#import <RTNHealthSpec/RTNHealthSpec.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RTNHealth: NSObject <RCTBridgeModule>

@property (nonatomic, strong) CMPedometer *pedometer;

@end

#ifdef RCT_NEW_ARCH_ENABLED
@interface RTNHealth () <NativeHealthSpec>

@end
#endif

NS_ASSUME_NONNULL_END
