#import "FloatView.h"
#import "../utils/module_tools.h"

@implementation FloatView

- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control {
    self = [super initWithFrame:frame];
    if (self) {
        self.moduleControl = control;
        
        // Dokunma algılayıcı ekle
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
        
        // Görünüm (çark veya daire)
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // İsterseniz burayı değiştirin
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)handleTap:(UITapGestureRecognizer *)gesture {
    if (self.moduleControl) {
        // Menü durumunu tersine çevir (Aç/Kapa)
        self.moduleControl->menuStatus = !self.moduleControl->menuStatus;
        NSLog(@"[M7MD] Butona tiklandi. Menu durumu: %d", self.moduleControl->menuStatus);
    }
}

// OverlayView tarafından çağrılır
- (void)setOverlayView:(id)overlay {
    self.overlayView = overlay;
}

// OverlayView tarafından çağrılır
- (void)drawMenuWindow {
    if (self.moduleControl->menuStatus && self.overlayView) {
        // Menü çizim kodları (eğer varsa)
    }
}

@end
