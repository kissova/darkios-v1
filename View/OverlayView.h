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

// HATA ÇÖZÜMÜ: 'mi' sınıfı yerine genel bir UIView kullanıyoruz.
// Çünkü FloatView bir UIView'dir ve 'mi' sınıfı projede yoktur.
@property (nonatomic, strong) UIView *mi;

// HATA ÇÖZÜMÜ: Parametre tipi 'mi*' yerine 'UIView*' olarak değiştirildi.
- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control :(UIView*)menu;

@end

NS_ASSUME_NONNULL_END
