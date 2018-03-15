# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := busybox
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/sbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := busybox-smp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := fsck.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := iostat
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := mkfs.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := mkntfs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := mount.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := ntfs-3g
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := ntfs-3g.probe
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := data_resume.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := data_copy.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := data_backup_cmcc.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/sbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := data_resume_cmcc.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/sbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################

include $(CLEAR_VARS)
LOCAL_MODULE := preinstall.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := mke2fs.ext4
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := su
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := flushcache.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := nfsprobe
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := logger.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := mtop
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := memtester
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := cpu_monitor
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)

#######################
include $(CLEAR_VARS)
LOCAL_MODULE := log_bg.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := FAKE
include $(BUILD_PREBUILT)


