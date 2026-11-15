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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"[M7MD] 5 saniye doldu. Arayüz başlatılıyor...");
        
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

        NSLog(@"[M7MD] keyWindow bulundu, FloatView ve OverlayView ekleniyor...");

        // 2. FloatView (Küçük Yüzen Buton)
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
        [keyWindow addSubview:floatView];
        
        // 3. OverlayView (Menü)
        OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds :&moduleControl :floatView];
        [keyWindow addSubview:overlayView];
        
        NSLog(@"[M7MD] Arayüz başarıyla eklendi.");
    });
}
