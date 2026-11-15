#import "FloatView.h"
#import "../utils/module_tools.h"
#import <objc/runtime.h>

@implementation FloatView

// Başlatma metodu
- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control {
    self = [super initWithFrame:frame];
    if (self) {
        self.moduleControl = control;
        
        // 1. GÖRÜNÜM AYARLARI: Siyah, dairesel ve %30 şeffaf
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // Siyah renk, 0.3 alpha (şeffaflık)
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.masksToBounds = YES;
        
        // İsterseniz buraya bir ikon ekleyebilirsiniz (Şu an sadece siyah daire)
        
        // 2. DOKUNMA ALGILAYICI: Tıklama olayını yakala
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

// Butona tıklandığında çalışacak fonksiyon
- (void)handleTap:(UITapGestureRecognizer *)gesture {
    if (self.moduleControl) {
        // Menü durumunu tersine çevir (Açıksa kapat, kapalıysa aç)
        self.moduleControl->menuStatus = !self.moduleControl->menuStatus;
        NSLog(@"[M7MD] Butona tiklandi. Menu durumu: %d", self.moduleControl->menuStatus);
        
        // 3. ŞEFFAFLIK DEĞİŞİMİ: Tıklanınca tamamen görünür yap (Alpha 1.0)
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1.0; 
        }];
        
        // 4. 5 SANİYE SONRA TEKRAR %30 ŞEFFAF YAP
        // Önceki zamanlayıcıyı iptal et (üst üste tıklamalarda sorun olmasın diye)
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(makeTransparentAgain) object:nil];
        
        // 5 saniye sonra makeTransparentAgain fonksiyonunu çağır
        [self performSelector:@selector(makeTransparentAgain) withObject:nil afterDelay:5.0];
    }
}

// 5 saniye sonra çağrılacak fonksiyon
- (void)makeTransparentAgain {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.3; // Tekrar %30 şeffaf yap
    }];
    NSLog(@"[M7MD] Buton tekrar seffaf hale getirildi.");
}

// OverlayView tarafından çağrılır (Menüyü çizmek için referans)
- (void)setOverlayView:(id)overlay {
    self.overlayView = overlay;
}

// OverlayView tarafından çağrılır (Menü çizimi)
- (void)drawMenuWindow {
    if (self.moduleControl->menuStatus && self.overlayView) {
        // Menü çizim kodları buraya gelecek
    }
}

@end
