# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file lists the product definition files that define
# configurations which are actually buildable (e.g. through lunch)
#

LOCAL_PATH := $(call my-dir)

### NASTY DEVICE NAME - but this is what the system is looking for. Will have to find a more sophisticated way to fix this
include $(CLEAR_VARS)
LOCAL_SRC_FILES := kbd_pp2106.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

include $(call all-makefiles-under,$(LOCAL_PATH))
