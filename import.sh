#!/bin/sh

for org in `ls ~/.*rc`
do
	echo $org
	new=`echo $org | sed -e 's/.*\/\./dot\./'`
	cp -f $org ./$new
	echo $new
done
