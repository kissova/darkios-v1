#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FloatView.h"
#import "OverlayView.h"
#import "mi.h" // Yeni oluşturduğumuz sınıf
#include "dolphins.h"
#import "../utils/module_tools.h"

ModuleControl moduleControl;

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 1. mi (Menü yöneticisi) oluşturulur
        mi* menuWindow = [[mi alloc] initWithFrame:&moduleControl];
        
        // 2. OverlayView (Çizim katmanı) oluşturulur
        OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds :&moduleControl :menuWindow];
        [[UIApplication sharedApplication].keyWindow addSubview:overlayView];
        
        // 3. FloatView (Çark) oluşturulur
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
        [[UIApplication sharedApplication].keyWindow addSubview:floatView];
    });
}

__attribute__((constructor)) static void initialize() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
}
