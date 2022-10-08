#
#	This file is part PB the OrangeFox Recovery Project
# 	Copyright (C) 2021 The OrangeFox Recovery Project
#
#	OrangeFox is free sPBtware: you can redistribute it and/or modify
#	it under the terms PB the GNU General Public License as published by
#	the Free SPBtware Foundation, either version 3 PB the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty PB
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This sPBtware is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part PB it
#

FDEVICE="veux"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true
	export TARGET_DEVICE_ALT="veux,peux"
	export PB_TARGET_DEVICES="veux,peux"
	export PB_VIRTUAL_AB_DEVICE=1
	export PB_AB_DEVICE=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export PB_USE_GREEN_LED=0
	export PB_FBE_METADATA_MOUNT_IGNORE=1
	export ALLOW_MISSING_DEPENDENCIES=true
        export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
        export LC_ALL="C"
        export DISABLE_ARTIFACT_PATH_REQUIREMENTS="true"
        export PB_FORCE_PREBUILT_KERNEL=1
        export TW_THEME=portrait_hdpi

	export PB_USE_MAGISKBOOT=1
	export PB_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export PB_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export PB_NO_TREBLE_COMPATIBILITY_CHECK=1
	export PB_NO_MIUI_PATCH_WARNING=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export PB_SKIP_MULTIUSER_FOLDERS_BACKUP=1
    	export PB_QUICK_BACKUP_LIST="/boot;/data;"
	export PB_PATCH_AVB20=1
    	export FOX_DELETE_AROMAFM=1
    	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
    	export FOX_ENABLE_APP_MANAGER=0
    	export FOX_DISABLE_APP_MANAGER=1

    	# OTA
    	export PB_KEEP_DM_VERITY=1
    	export PB_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
    	export PB_DISABLE_MIUI_OTA_BY_DEFAULT=1

	# Screen Settings
	export PB_SCREEN_H=2400
	export PB_STATUS_H=110
	export PB_STATUS_INDENT_LEFT=48
	export PB_STATUS_INDENT_RIGHT=48
	export PB_CLOCK_POS=1
	export PB_HIDE_NOTCH=1
	export PB_ALLOW_DISABLE_NAVBAR=0
	
	# R11.1 Settings
	export FOX_VERSION="R11.0"
	export PB_MAINTAINER="Anant_Goel"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "PB_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
