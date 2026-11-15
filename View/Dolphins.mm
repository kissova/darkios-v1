#import <Foundation/Foundation.h>
#import "FloatView.h"
#import "OverlayView.h"
#include "dolphins.h"
#import <mach-o/dyld.h>
#include <stdio.h>
#include <vector>
#include <iostream>
#include "../utils/module_tools.h"
#include "../dobby/dobby.h"
#include "../utils/log.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define __fastcall
using namespace std;
typedef long kaddr;

// Modül Fonksiyon Kontrolcüsü
ModuleControl moduleControl;

// Kütüphane Giriş Fonksiyonu
__attribute__((constructor)) static void initialize() {
    NSLog(@"[M7MD] Tweak yüklendi, 5 saniye sonra arayüz eklenecek...");
    
    // 5 saniye bekle ve sonra ana thread'de çalıştır
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"[M7MD] 5 saniye doldu, keyWindow aranıyor...");
        
        // 1. iOS 15+ için doğru pencereyi (UIWindowScene) bulma
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

        NSLog(@"[M7MD] keyWindow bulundu, TEST KARESI ekleniyor...");

        // 2. TEST: Ekrana kırmızı bir kare ekle (Görüp görmediğimizi anlamak için)
        UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
        testView.backgroundColor = [UIColor redColor];
        testView.alpha = 0.8; // Yarı saydam
        [keyWindow addSubview:testView];
        
        NSLog(@"[M7MD] TEST KARESI EKLENDI. Eger bunu goruyorsaniz, sorun FloatView/OverlayView'de.");
        
        // 3. Gerçek Arayüz (Test başarılıysa buradaki yorumları kaldıracağız)
        /*
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
        [keyWindow addSubview:floatView];
        
        OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds :&moduleControl :floatView];
        [keyWindow addSubview:overlayView];
        */
    });
}
