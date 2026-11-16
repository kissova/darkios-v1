ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless

# macOS/Linux mühitində strip xətasını aradan qaldırmaq üçün
STRIP = strip

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = M7MD

# Framework-lər (JRMemory framework olaraq qaytarıldı)
M7MD_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController JRMemory

# Kitabxanalar
M7MD_LIBRARIES = c++ objc z

# CFLAGS tənzimləmələri (birləşdirildi ki, -I/opt/theos/include itməsin)
M7MD_CCFLAGS = -w -std=gnu++14 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c
M7MD_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -I/opt/theos/include

# Framework, kitabxana yolları və linker bayraqları (-fuse-ld=lld əlavə olundu)
M7MD_LDFLAGS += -F$(THEOS_PROJECT_DIR) -framework JRMemory -L$(THEOS_PROJECT_DIR)/API -lAPIClient -fuse-ld=lld

# Menux qovluğu ÇIXARILDI (KeySystem.mm ən sona əlavə edildi)
M7MD_FILES = $(wildcard View/*.mm) $(wildcard CustomView/*.m) $(wildcard utils/*.cpp) $(wildcard utils/*.m) $(wildcard imgui/*.mm) $(wildcard imgui/*.cpp) $(wildcard ESP/*.mm) $(wildcard ESP/*.cpp) $(wildcard SDK/*.cpp) $(wildcard NSURL+hook/*.h) $(wildcard NSURL+hook/*.m) $(wildcard MBProgressHUD/*.m) $(wildcard FCFileManager/*.m) $(wildcard NSEtcHosts/*.m) $(wildcard AppDelegate/*.h) $(wildcard ZXRequestBlock/*.h) $(wildcard DBLOCKRASHID/*.m) $(wildcard ZXURLProtocol/*.m) $(wildcard ZXURLProtocol/*.h) $(wildcard EtcHostsURLProtocol/*.m) $(wildcard MBProgressHUD/*.m) $(wildcard NSObject+URL/*.m) $(wildcard NSURL+hook/*.m) $(wildcard MBProgressHUD/*.h) $(wildcard FCFileManager/*.h) $(wildcard ViewController/*.m) $(wildcard ZXHttpIPGet/*.m) $(wildcard NSURLSession+ZXHttpProxy/*.m) $(wildcard EtcHostsURLProtocol/*.h) $(wildcard ZXURLProtocol/*.m) $(wildcard NSURLSession+ZXHttpProxy/*.h) $(wildcard main/*.m) $(wildcard ZXHttpIPGet/*.h) $(wildcard NSURL+hook/*.h) $(wildcard ViewController/*.h) $(wildcard NSObject+URL/*.h) $(wildcard 旁路/*.mm) $(wildcard behaviorbypassforESP/*.h) $(wildcard View/*.m) KeySystem.mm

M7MD_RESOURCE_FILES = bypass.lua skin.lua
M7MD_INSTALL_PATH = /Library/Application Support/M7MD/

include $(THEOS_MAKE_PATH)/tweak.mk
