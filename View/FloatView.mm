#import "FloatView.h"
#import "../utils/module_tools.h"

@implementation FloatView

- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control {
    self = [super initWithFrame:frame];
    if (self) {
        self.moduleControl = control;
        
        // 1. GÖRÜNÜM: Siyah, dairesel ve %30 şeffaf
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; 
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.masksToBounds = YES;
        
        // 2. DOKUNMA ALGILAYICI: Çarka tıklandığında menüyü aç/kapa
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
        
        // Tıklama anında butonu tamamen görünür yap (isteğe bağlı)
        self.alpha = 1.0;
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(makeTransparentAgain) object:nil];
        [self performSelector:@selector(makeTransparentAgain) withObject:nil afterDelay:5.0];
    }
}

// 5 saniye sonra butonu tekrar şeffaf yap
- (void)makeTransparentAgain {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.3;
    }];
}

// OverlayView tarafından çağrılır
- (void)setOverlayView:(id)overlay {
    self.overlayView = overlay;
}

// OverlayView tarafından çağrılır (Menü çizimi)
- (void)drawMenuWindow {
    if (self.moduleControl->menuStatus && self.overlayView) {
        // Menü çizim kodları
    }
}

@end
