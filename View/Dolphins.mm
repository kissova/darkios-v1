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

// UI Giriş Fonksiyonu
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // HATA ÇÖZÜMÜ: iOS 15+ için keyWindow yerine aktif UIWindowScene'i buluyoruz
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

        NSLog(@"[M7MD] keyWindow bulundu, arayüz ekleniyor...");

        // 1. FloatView (Küçük Yüzen Buton)
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
        [keyWindow addSubview:floatView];
        
        // 2. OverlayView (Menü)
        OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds :&moduleControl :floatView];
        [keyWindow addSubview:overlayView];
        
        NSLog(@"[M7MD] Arayüz başarıyla eklendi.");
    });
}

// Kütüphane Giriş Fonksiyonu
__attribute__((constructor)) static void initialize() {
    // Uygulama başladığında didFinishLaunching fonksiyonunu çağır
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
}
