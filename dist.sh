#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: ./dist <project_dir_name>"
    exit
fi

echo "Creating distribution for $1"

TARGET="$1"-dist
PACKED="$1".love

mkdir $TARGET

cd "$1"
zip -9 -r $PACKED .
mv $PACKED ../$TARGET
cd ..

cat win/bin/love.exe $TARGET/"$1".love > $TARGET/"$1".exe
cp win/* $TARGET
rm -f $TARGET/$PACKED