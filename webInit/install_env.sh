#!/bin/bash
# author code@bihe0832.com

function checkResult() {  
   result=$?
   echo "result : $result"
   if [ $result -eq 0 ];then
      echo "checkResult: execCommand succ"
   else
    echo "checkResult: execCommand failed"
    exit $result
   fi
}  
#zsh git
sudo yum update
sudo yum -y install tree
sudo yum -y install rz
sudo yum -y install lrzsz

sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
cd /usr/local/src
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/git-core/git-1.9.0.tar.gz
tar -zxvf git-1.9.0.tar.gz
sudo yum -y install perl-CPAN
cd git-1.9.0 
make configure
./configure --prefix=/usr/local/ --with-iconv=/usr/local/libiconv/
make && make install


/usr/sbin/groupadd -f www
/usr/sbin/useradd -g www www

sudo yum update
sudo yum -y install nginx
sudo yum -y install php
sudo yum -y install mysql
sudo yum -y install php-fpm
sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
sudo yum -y install mysql-server