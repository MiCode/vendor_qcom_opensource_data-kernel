ifeq ($(TARGET_BOARD_PLATFORM), sun)
PRODUCT_PACKAGES += smem-mailbox.ko
endif

ifeq ($(TARGET_BOARD_PLATFORM), canoe)
PRODUCT_PACKAGES += smem-mailbox.ko
endif

ifeq ($(TARGET_BOARD_PLATFORM), hamoa)
PRODUCT_PACKAGES += smem-mailbox.ko
endif

ifeq ($(TARGET_BOARD_PLATFORM), chora)
PRODUCT_PACKAGES += smem-mailbox.ko
endif

ifeq ($(TARGET_BOARD_PLATFORM), malabar)
PRODUCT_PACKAGES += smem-mailbox.ko
endif
