#!/bin/sh
./makereadme.rb | sed -e 's/$/\r/' > Readme.txt
zip Bagel0.5pre_rev`../../../showrev.sh`.zip Bagel.exe Readme.txt Warning.txt defaults/*

