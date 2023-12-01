#!/system/bin/sh

# Flash Csot Novatek Touch Firmware
if [ -d /sys/class/touchscreen/NVT-ts ]; then
   firmware_path=/vendor/firmware
   touch_path=/sys/class/touchscreen/NVT-ts
   firmware_file=csot_novatek_ts_fw.bin
   cd $firmware_path
   echo "csot_novatek_ts"
   echo $firmware_file > $touch_path/doreflash
   echo 1 > $touch_path/reset

# Flash Tm Novatek Touch Firmware
elif [ -d /sys/class/touchscreen/primary ]; then 
   firmware_path=/vendor/firmware
   touch_path=/sys/class/touchscreen/primary
   firmware_file=tm_novatek_ts_fw.bin
   cd $firmware_path
   echo "tm_novatek_ts"
   echo $firmware_file > $touch_path/doreflash
   echo 1 > $touch_path/reset
   #echo 1 > /proc/nvt_update

# Unsupported Touchscreen
else
echo "Unsupported Touchscreen Detected"
fi

sleep 5

# A-Team Custom Patches
mount -o rw /system_root
mount -o rw /system_ext
mount -o rw /product
mount -o rw /vendor
svc usb setFunctions mtp

exit
