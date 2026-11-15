#import "FloatView.h"
#import "../utils/module_tools.h"
#import <objc/runtime.h>

@implementation FloatView

// Başlatma metodu
- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control {
    self = [super initWithFrame:frame];
    if (self) {
        self.moduleControl = control;
        
        // Buton görünümünü ayarla (Görünmez veya şeffaf bir arka plan)
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.masksToBounds = YES;
        
        // İsterseniz buraya bir ikon veya resim ekleyebilirsiniz
        // Örnek: UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
        // icon.frame = self.bounds;
        // [self addSubview:icon];
        
        // Dokunma olaylarını (tıklamayı) algıla
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
    }
}

// OverlayView tarafından çağrılır (Menüyü çizmek için referans)
- (void)setOverlayView:(id)overlay {
    self.overlayView = overlay;
}

// OverlayView tarafından çağrılır (Menü çizimi)
- (void)drawMenuWindow {
    // Eğer menü durumu açıksa ve overlayView varsa menüyü çiz
    if (self.moduleControl->menuStatus && self.overlayView) {
        // Menü çizim kodları buraya gelecek
        // Örneğin: [self.overlayView renderMenu];
        // Şimdilik sadece log basalım:
        // NSLog(@"[M7MD] Menu ciziliyor...");
    }
}

@end
