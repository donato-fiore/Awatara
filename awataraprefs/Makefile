TARGET := iphone:clang:latest:10.0

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = awataraprefs

awataraprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
awataraprefs_FILES = AWARootListController.m
awataraprefs_FRAMEWORKS = UIKit
awataraprefs_PRIVATE_FRAMEWORKS = Preferences
awataraprefs_INSTALL_PATH = /Library/PreferenceBundles
awataraprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
