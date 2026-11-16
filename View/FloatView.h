#import <UIKit/UIKit.h>
#import "../utils/module_tools.h"

NS_ASSUME_NONNULL_BEGIN

@interface FloatView : UIView

@property (nonatomic, assign) ModuleControl *moduleControl;

// HATA ÇÖZÜMÜ: OverlayView referansını tutmak için bu property'yi ekliyoruz
@property (nonatomic, strong) id overlayView;

- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control;

@end

NS_ASSUME_NONNULL_END
