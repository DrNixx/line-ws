#!/bin/sh

APP=lila-ws-3.3

package_dir="target/universal"
package="$package_dir/$APP"
stage="$package_dir/stage"

echo "Build $APP"

rm $package.zip
rm -rf $package
rm -rf $stage

sbt universal:packageBin

if [ $? != 0 ]; then
  echo "Build canceled"
  exit 1
fi

unzip $package.zip -d $package_dir
cp -r $package $stage