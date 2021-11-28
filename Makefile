TARGET := iphone:clang:latest:10.0
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Awatara

Awatara_FILES = Tweak.x
Awatara_CFLAGS = -fobjc-arc
Awatara_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += awataraprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
