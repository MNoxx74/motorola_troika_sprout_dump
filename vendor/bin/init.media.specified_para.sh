#!/vendor/bin/sh

if [ "`getprop ro.vendor.hw.hwrev`" == "0xA100" -o "`getprop ro.vendor.hw.hwrev`" == "0xB1A0" ]
then
    setprop media.profiles.xml /vendor/etc/media_profiles_vendor.xml
else
    setprop media.profiles.xml /vendor/etc/media_profiles_vendor_V1.xml
fi
