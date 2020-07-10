#/bin/bash

cd ~/zixie/github

echo "============ zixe check git status start ======================"
for file in ./*
do
	cd ~/zixie/github/$file
	echo `pwd`"/ start to check:"
	git config --add core.filemode false
	git config --global  --add core.filemode false
	if [ `git status | wc -l` -gt 4 ]
	then
		echo "==================================" 
		echo `pwd`"/ have uncommit changes:" 
		git status
	fi
done
echo "============ zixe check git status finished ======================"
