#!/usr/bin/env bash

HAXM_ROOT_DIR=$(pwd)
BUILD_DIR=$(pwd)/haxm-dkms

echo "Intel Hardware Accelerated Execution Manager Linux Installer"


if [ -d "$BUILD_DIR" ]; then
  echo pass
else
  echo create directory
  mkdir $BUILD_DIR
fi

cp -r $HAXM_ROOT_DIR/core/ $BUILD_DIR/
cp -r $HAXM_ROOT_DIR/include/ $BUILD_DIR/

cp $HAXM_ROOT_DIR/platforms/linux/* $BUILD_DIR/

echo replace Makefile...
rm $BUILD_DIR/Makefile
cp $HAXM_ROOT_DIR/build_script/Makefile $BUILD_DIR/

echo replace Kbuild...
rm $BUILD_DIR/Kbuild
cp $HAXM_ROOT_DIR/build_script/Kbuild $BUILD_DIR/

echo add dkms.conf
cp $HAXM_ROOT_DIR/build_script/dkms.conf $BUILD_DIR/


