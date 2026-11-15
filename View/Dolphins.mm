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
        
        // HATA ÇÖZÜMÜ: 'mi' sınıfı yerine doğrudan OverlayView kullanıyoruz.
        // OverlayView'i başlat (Menü ve çizim katmanı)
        OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds:&moduleControl:nil];
        [[UIApplication sharedApplication].keyWindow addSubview:overlayView];
        
        // Küçük yüzen butonu (FloatView) başlat
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
        [[UIApplication sharedApplication].keyWindow addSubview:floatView];
    });
}

// Kütüphane Giriş Fonksiyonu (Constructor)
__attribute__((constructor)) static void initialize() {
    // Uygulama başladığında didFinishLaunching fonksiyonunu çağır
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
}
