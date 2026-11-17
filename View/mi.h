#import <UIKit/UIKit.h>
#import "../utils/module_tools.h"

NS_ASSUME_NONNULL_BEGIN

@interface mi : NSObject

@property (nonatomic, assign) ModuleControl *moduleControl;
@property (nonatomic, strong) id overlayView;

- (instancetype)initWithFrame:(ModuleControl*)control;
- (void)drawMenuWindow;

@end

NS_ASSUME_NONNULL_END
