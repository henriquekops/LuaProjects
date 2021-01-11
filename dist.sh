#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: ./dist <project_dir_name>"
fi

TARGET="$1"-dist

mkdir $TARGET

cd "$1"
zip -9 -r "$1".love .
mv "$1".love $TARGET
cd ..

cat win/bin/love.exe $TARGET/"$1".love > $TARGET/"$1".exe
cp win/* $TARGET
cp "$1"/game.ico $TARGET
