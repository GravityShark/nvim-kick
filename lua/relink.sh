#!/bin/sh
find . -xtype l -delete # delete all broken symlns
ln -s main/* ./
ln -s extra/* ./

if [ $1 != "" ]; then
        ln -s ../colors/$1.lua
fi
