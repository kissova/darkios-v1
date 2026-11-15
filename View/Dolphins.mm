#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Test için diğer sınıfları (FloatView, OverlayView) devre dışı bırakıyoruz.
// #import "FloatView.h"
// #import "OverlayView.h"
// #include "dolphins.h"

__attribute__((constructor)) static void initialize() {
    NSLog(@"[M7MD] Tweak yüklendi, 5 saniye bekleniyor...");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"[M7MD] 5 saniye doldu. Test dairesi ekleniyor...");
        
        // 1. Pencereyi bul (iOS 15+ uyumlu)
        UIWindow *keyWindow = nil;
        if (@available(iOS 13.0, *)) {
            for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
                if ([scene isKindOfClass:[UIWindowScene class]] && scene.activationState == UISceneActivationStateForegroundActive) {
                    keyWindow = ((UIWindowScene *)scene).windows.firstObject;
                    break;
                }
            }
        } else {
            keyWindow = [UIApplication sharedApplication].keyWindow;
        }

        if (!keyWindow) {
            NSLog(@"[M7MD] HATA: keyWindow bulunamadi!");
            return;
        }

        NSLog(@"[M7MD] keyWindow bulundu. Kirmizi daire ekleniyor...");

        // 2. Kırmızı Test Dairesi (Buton simülasyonu)
        UIView *testButton = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 45, 45)];
        testButton.backgroundColor = [UIColor redColor]; // Kırmızı renk
        testButton.layer.cornerRadius = 22.5; // Daire yapmak için yarıçap
        testButton.layer.masksToBounds = YES;
        testButton.alpha = 0.8; // Yarı şeffaf
        
        [keyWindow addSubview:testButton];
        
        NSLog(@"[M7MD] TEST: Kirmizi daire basariyla eklendi.");
    });
}
