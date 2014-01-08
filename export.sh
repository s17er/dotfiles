#!/bin/sh

for org in `ls dot.*`
do
	new=`echo $org | sed -e 's/dot\./\./'`
	cp -f $org ~/$new
	echo $new
done
