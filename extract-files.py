#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/xiaomi/rodin',
    'hardware/mediatek',
    'hardware/xiaomi',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/bin/hw/android.hardware.security.keymint@3.0-service.mitee': blob_fixup()
        .replace_needed('android.hardware.security.keymint-V3-ndk.so', 'android.hardware.security.keymint-V4-ndk.so'),
    (
        'vendor/bin/mnld',
        'vendor/lib64/libpqconfig.so',
        'vendor/lib64/libaalservice.so',
        'odm/lib64/hw/displayfeature.default.so',
        'odm/lib64/libpaperMode.so',
        'odm/lib64/libmiBrightness.so',
        'odm/lib64/libmiSensorCtrl.so',
        'odm/lib64/libcolortempmode.so',
        'odm/lib64/libtruetone.so',
        'odm/lib64/libsre.so',
        'odm/lib64/libsdr2hdr.so',
        'odm/lib64/libdither.so',
        'odm/lib64/libhistprocess.so',
        'odm/lib64/libadaptivehdr.so',
        'odm/lib64/librhytheyecare.so',
        'odm/lib64/libflatmode.so',
        'odm/lib64/libvideomode.so',
    ): blob_fixup()
        .replace_needed('android.hardware.sensors-V2-ndk.so', 'android.hardware.sensors-V3-ndk.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'rodin',
    'xiaomi',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
