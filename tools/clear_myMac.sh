#/bin/bash

size=100	
sourcepath=`pwd`
echo "size:"$size
echo "path:"$sourcepath
echo "" > ~/temp/a.log
 
cd ~/Documents && echo "~/Documents" >> ~/temp/a.log

sudo du -sm * | sort -r | awk -v awk_var="$size" '{if ($1>awk_var) print $0}' >> ~/temp/a.log

cd ~/Documents/Library && echo "~/Documents/Library" >> ~/temp/a.log

sudo du -sm * | sort -r | awk -v awk_var="$size" '{if ($1>awk_var) print $0}' >> ~/temp/a.log

cd ~/Documents/temp && echo "~/Documents/temp" >> ~/temp/a.log

sudo du -sm * | sort -r | awk -v awk_var="$size" '{if ($1>awk_var) print $0}' >> ~/temp/a.log

cd ~/Library/Application\ Support  && echo "~/Library/Application\ Support" >> ~/temp/a.log

sudo du -sm * | sort -r | awk -v awk_var="$size" '{if ($1>awk_var) print $0}' >> ~/temp/a.log

cd ~/Library/Containers  && echo "~/Library/Containers" >> ~/temp/a.log

sudo du -sm * | sort -r | awk -v awk_var="$size" '{if ($1>awk_var) print $0}' >> ~/temp/a.log

cat ~/temp/a.log

# cd $sourcepath

# sudo du -sm * | sort -r | awk -v awk_var="$size" '{if ($1>awk_var) print $0}' 
