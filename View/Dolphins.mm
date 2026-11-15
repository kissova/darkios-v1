#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

__attribute__((constructor)) static void initialize() {
    NSLog(@"[M7MD] Tweak yüklendi, 5 saniye bekleniyor...");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"[M7MD] 5 saniye doldu. Ekran kirmizi yapiliyor...");
        
        // 1. Pencereyi bul
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

        NSLog(@"[M7MD] keyWindow bulundu. Ekran boyaniyor...");

        // 2. Tüm ekranı kaplayan kırmızı bir katman (overlay) ekle
        UIView *redOverlay = [[UIView alloc] initWithFrame:keyWindow.bounds];
        redOverlay.backgroundColor = [UIColor redColor];
        redOverlay.alpha = 0.5; // Yarı saydam, arkasını görebilelim
        redOverlay.userInteractionEnabled = NO; // Dokunmayı engellemesin
        
        [keyWindow addSubview:redOverlay];
        
        NSLog(@"[M7MD] TEST: Tum ekran kirmizi yapildi.");
    });
}
