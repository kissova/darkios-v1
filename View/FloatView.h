#import <UIKit/UIKit.h>
#import "../utils/module_tools.h"

NS_ASSUME_NONNULL_BEGIN

@interface FloatView : UIView

@property (nonatomic, assign) ModuleControl *moduleControl;

// OverlayView'i tutmak için (Menüyü çizmek için gerekli)
@property (nonatomic, strong) id overlayView;

// Başlatma metodu
- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control;

// OverlayView'i ayarlamak için (OverlayView.mm içinden çağrılıyor)
- (void)setOverlayView:(id)overlay;

// Menüyü çizmek için (OverlayView.mm içinden çağrılıyor)
- (void)drawMenuWindow;

@end

NS_ASSUME_NONNULL_END
