# !/usr/bin/sh

device_dir="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/"
device_tbds=(`ls -d $PWD/iPhone-Device/*`)

simulator_dylib_dir="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/"
simulator_dylibs=(`ls -d $PWD/iPhone-Simulator/*.dylib`)

simulator_tbd_dir="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/"
simulator_tbds=(`ls -d $PWD/iPhone-Simulator/*.tbd`)

mv_files_to_directory() {
    dir=$1
    shift
    files=("$@")

    for i in "${files[@]}"
    do
       cp $i $dir 
    done
}

mv_files_to_directory $device_dir ${device_tbds[@]} 
mv_files_to_directory $simulator_dylib_dir ${simulator_dylibs[@]} 
mv_files_to_directory $simulator_tbd_dir ${simulator_tbds[@]} 


