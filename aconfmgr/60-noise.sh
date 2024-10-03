# Some bs I just can't seem to clean up

# Mode on this keeps getting reset to 755
SetFileProperty /boot/intel-ucode.img mode 755

# These keep getting deleted
SetFileProperty /opt/intel/oneapi/compiler/2024.1/lib/libhwloc.so.15 deleted y
SetFileProperty /opt/intel/oneapi/tbb/2021.12/lib/libhwloc.so.15 deleted y
SetFileProperty /opt/intel/oneapi/tbb/2021.12/lib/libtcm.so.1 deleted y
SetFileProperty /opt/intel/oneapi/tbb/2021.12/lib/libtcm_debug.so.1 deleted y

# This too
SetFileProperty /usr/share/mime/model/materialx.xml deleted y
