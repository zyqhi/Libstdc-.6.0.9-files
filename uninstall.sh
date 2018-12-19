# !/usr/bin/sh

device_dir="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/"
device_tbds=(`ls ./iPhone-Device`)

simulator_dylib_dir="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/"
simulator_dylibs=(`ls ./iPhone-Simulator/*.dylib | xargs -n 1 basename`)

simulator_tbd_dir="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/"
simulator_tbds=(`ls ./iPhone-Simulator/*.tbd | xargs -n 1  basename`)

rm_files_in_directory() {
    dir=$1
    shift
    files=("$@")

    for i in "${files[@]}"
    do
        rm "$dir$i"
    done
}

rm_files_in_directory $device_dir ${device_tbds[@]} 
rm_files_in_directory $simulator_dylib_dir ${simulator_dylibs[@]} 
rm_files_in_directory $simulator_tbd_dir ${simulator_tbds[@]} 


