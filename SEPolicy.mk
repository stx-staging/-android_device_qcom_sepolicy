# Board specific SELinux policy variable definitions
ifeq ($(call is-vendor-board-platform,QCOM),true)
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy-legacy-um/generic/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy-legacy-um/generic/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy-legacy-um/qva/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy-legacy-um/qva/private

#once all the services are moved to Product /ODM above lines will be removed.
# sepolicy rules for product images
PRODUCT_PUBLIC_SEPOLICY_DIRS += \
    device/qcom/sepolicy-legacy-um/generic/product/public \
    device/qcom/sepolicy-legacy-um/qva/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS += \
    device/qcom/sepolicy-legacy-um/generic/product/private \
    device/qcom/sepolicy-legacy-um/qva/product/private

ifeq (,$(filter sdm845 sdm710 sdm660 msm8937 msm8953 msm8998, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS += \
       device/qcom/sepolicy-legacy-um \
       device/qcom/sepolicy-legacy-um/generic/vendor/common \
       device/qcom/sepolicy-legacy-um/qva/vendor/common/sysmonapp \
       device/qcom/sepolicy-legacy-um/qva/vendor/ssg \
       device/qcom/sepolicy-legacy-um/qva/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/generic/vendor/$(TARGET_BOARD_PLATFORM)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/qva/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/generic/vendor/$(TARGET_SEPOLICY_DIR)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/qva/vendor/$(TARGET_SEPOLICY_DIR)
    endif

    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/generic/vendor/test
    BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/qva/vendor/test
    endif
endif

ifneq (,$(filter sdm845 sdm710 sdm660 msm8937 msm8953 msm8998, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS += \
                 device/qcom/sepolicy-legacy-um \
                 device/qcom/sepolicy-legacy-um/legacy/vendor/common/sysmonapp \
                 device/qcom/sepolicy-legacy-um/legacy/vendor/ssg \
                 device/qcom/sepolicy-legacy-um/legacy/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/legacy/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/legacy/vendor/$(TARGET_SEPOLICY_DIR)
    endif
    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    BOARD_SEPOLICY_DIRS += device/qcom/sepolicy-legacy-um/legacy/vendor/test
    endif
endif
endif
