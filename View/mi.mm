#import "mi.h"
#import "OverlayView.h"

@implementation mi

- (instancetype)initWithFrame:(ModuleControl*)control {
    self = [super init];
    if (self) {
        self.moduleControl = control;
    }
    return self;
}

// OverlayView her karede bu metodu çağıracak
- (void)drawMenuWindow {
    if (self.moduleControl->menuStatus) {
        // Menü açıksa çizim kodları buraya gelecek.
        // Eğer OverlayView içinde ImGui çizimi yapılıyorsa, burayı boş bırakabilirsiniz.
    }
}

@end
