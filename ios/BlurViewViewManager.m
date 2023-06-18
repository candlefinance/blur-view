#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(BlurViewViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(blurTintColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(blurRadius, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(blurEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(colorTintOpacity, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scale, NSNumber)

@end
