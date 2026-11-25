TARGET := iphone:clang:latest:14.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DoxBonVDS
DoxBonVDS_FILES = packages/DoxBon.dylib.m
DoxBonVDS_FRAMEWORKS = UIKit PhotosUI Vision MobileCoreServices
DoxBonVDS_CFLAGS = -fobjc-arc
# no extra linker flags

include $(THEOS_MAKE_PATH)/tweak.mk
