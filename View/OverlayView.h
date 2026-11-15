#import "../CustomView/UIView+YYAdd.h"
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import "菜单.h"
#include "../imgui/imgui_impl_metal.h"
#include "../utils/module_tools.h"
#include "../utils/imgui_tools.h"

NS_ASSUME_NONNULL_BEGIN

@interface OverlayView : MTKView <MTKViewDelegate>
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, strong) MTKTextureLoader *loader;

@property (nonatomic, assign) ModuleControl *moduleControl;

// 'mi' sınıfı yerine, FloatView'in de bir alt sınıfı olduğu UIView kullanılıyor.
@property (nonatomic, strong) UIView *mi;

// Başlatma metodu: Menü (FloatView) parametresi UIView olarak alınıyor.
- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control :(UIView*)menu;

@end

NS_ASSUME_NONNULL_END
