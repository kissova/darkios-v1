#import "FloatView.h"
#import "../utils/module_tools.h"

@implementation FloatView

- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control {
    self = [super initWithFrame:frame];
    if (self) {
        self.moduleControl = control;
        
        // 1. GÖRÜNÜM: Siyah, dairesel ve %30 şeffaf
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // Siyah, 0.3 alpha
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.masksToBounds = YES;
        
        // 2. DOKUNMA ALGILAYICI: Tıklama olayını yakala
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

// Çarka tıklandığında çalışacak fonksiyon
- (void)handleTap:(UITapGestureRecognizer *)gesture {
    if (self.moduleControl) {
        // Menü durumunu tersine çevir (Açıksa kapat, kapalıysa aç)
        self.moduleControl->menuStatus = !self.moduleControl->menuStatus;
        NSLog(@"[M7MD] Butona tiklandi. Menu durumu: %d", self.moduleControl->menuStatus);
    }
}

// OverlayView tarafından çağrılır (Referans ataması)
- (void)setOverlayView:(id)overlay {
    self.overlayView = overlay;
}

// OverlayView tarafından çağrılır (Menü çizimi)
- (void)drawMenuWindow {
    // Menü durumu açıksa ve overlay referansı varsa
    if (self.moduleControl->menuStatus && self.overlayView) {
        // Menüyü çizen kodlar buraya gelecek.
        // Eğer OverlayView içinde menü çizimi yapılıyorsa, bu fonksiyon boş kalabilir.
    }
}

@end
