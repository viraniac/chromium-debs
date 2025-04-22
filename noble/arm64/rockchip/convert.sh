#!/bin/bash


for deb in `ls *.deb`
do
	echo "Converting $deb ...${deb::-4}"
	dpkg -x $deb ${deb::-4}
	dpkg -e $deb ${deb::-4}/DEBIAN
	fakeroot dpkg-deb --build -Zxz ${deb::-4} .
	rm -rf ${deb::-4}
done
