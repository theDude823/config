#!/bin/bash
# if ["$(date -r ~/code.cpp)"="$(cat ~/bin/modDateOld)"]
LOC=~/cpp_code/code.cpp
DATE=$(date -r $LOC)
DATE1=$(cat ~/bin/modDateOld)
if [ "$DATE" = "$DATE1" ]
then
	set -x
	~/cpp_code/a.out
else
	g++ -std=c++11 -O2 -Wall $LOC -o ~/cpp_code/a.out
	date -r $LOC>~/bin/modDateOld
	set -x
    ~/cpp_code/a.out
fi
