#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(BlurViewViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(gradientMask, NSString)
RCT_EXPORT_VIEW_PROPERTY(maxBlurRadius, NSNumber)

@end
