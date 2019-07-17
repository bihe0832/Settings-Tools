#!/bin/bash
#PATH=$PATH:/usr/local/bin:/usr/bin:/usr/X11R6/bin:/bin:/usr/games:/opt/gnome/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin
   env_check()
{
    if [[ -d /data/app/php ]] || [[ -d /data/app/apache ]] || [[ -d /data/app/mysql ]]
    then
       echo "May be the Initialized environment has been created ; pls check "
      exit 1
   fi
}
      
    if [[ ! -d /data/app/ ]]  
    then
       mkdir -p /data/app
    fi


function install_mysql()
{
      cd /data/software && tar -zxvf mysql-5.1.35.tar.gz
      cd mysql-5.1.35 && ./configure --prefix=/data/app/mysql --datadir=/data/mysql --with-charset=latin1 --with-extra-charsets=binary,gbk,utf8 && make && make install
}

function install_libxml2()
{
    cd  /data/software &&  tar -zxvf libxml2-2.6.30.tar.gz 
    cd  libxml2-2.6.30 
  ./configure --prefix=/data/app/libxml2 && make && make install
}

function install_gd()
{   cd /data/software && tar -zxvf  libpng-1.2.31.tar.gz
    cd libpng-1.2.31 && ./configure --prefix=/data/app/libpng && make && make install
    cd  /data/software && tar -zxvf freetype-2.3.7.tar.gz
    cd  freetype-2.3.7 && ./configure --prefix=/data/app/freetype && make && make install
    cd  /data/software && tar -zxvf jpegsrc.v8b.tar.gz
    cd  jpeg-8b && ./configure --prefix=/data/app/jpeg && make && make install
    cd  /data/software &&  tar -zxvf gd-2.0.33.tar.gz
     sed -i 's#png.h#/data/app/libpng/include/png.h#'   /data/software/gd-2.0.33/gd_png.c
    cd  /data/software/gd-2.0.33 &&  ./configure --prefix=/data/app/gd --with-png=/data/app/libpng --with-jpeg=/data/app/jpeg --with-freetype=/data/app/freetype  && make && make install
}

function install_httpd()
{ 
   cd   /data/software && tar -zxvf httpd-2.2.17.tar.gz
   cd   httpd-2.2.17 &&  ./configure --prefix=/data/app/apache -enable-module=so && make && make install
}

function install_openssl()
{
   cd    /data/software && tar -zxvf openssl-1.0.1e.tar.gz
   cd    openssl-1.0.1e &&  ./configure --prefix=/data/app/ssl/ && make && make install
}

function install_curl()
{
   cd    /data/software && tar -zxvf curl-7.17.1.tar.gz
   cd    curl-7.17.1 &&  ./configure --prefix=/data/app/curl && make && make install
}

function install_php()
{
    cd  /data/software && tar -zxvf  php-5.3.10.tar.gz.gz
    cd   php-5.3.10 && ./configure  --prefix=/data/app/php --with-jpeg-dir=/data/app/jpeg --with-apxs2=/data/app/apache/bin/apxs --with-libxml-dir=/data/app/libxml2 --with-png-dir=/data/app/libpng --with-gd=/data/app/gd --with-freetype-dir=/data/app/freetype --with-curl=/data/app/curl --with-mysql=/data/app/mysql --with-mysqli=/data/app/mysql/bin/mysql_config  && make && make install

}

function install_memcached()
{
     cd /data/software && tar -zxvf libevent-1.4.10-stable.tar.gz
     cd libevent-1.4.10-stable && ./configure --prefix=/data/app/libevent && make && make install
     cd /data/software && tar -zxvf memcached-1.4.5.tar.gz
     cd memcached-1.4.5 && ./configure --prefix=/data/app/memcached --with-libevent=/data/app/libevent && make && make install
     cp /data/app/libevent/lib/libevent-1.4.so.2 /usr/lib/
     ln -s /usr/lib/libevent-1.4.so.2 /usr/lib64/libevent-1.4.so.2
}

function install_memcache()
{
      cd /data/software && tar -zxvf memcache-3.0.4.tar.gz
	  cd memcache-3.0.4 && /data/app/php/bin/phpize ./configure --with-php-config=/data/app/php/bin/php-config && make && make install
}

function install_soap()
{
      cd /data/software/php-5.3.10/ext/soap/
	  /data/app/php/bin/phpize ./configure --with-php-config=/data/app/php/bin/php-config --with-libxml-dir=/data/app/libxml2 && make && make install
}

if [[ "$1" != "-f" ]]
then
    env_check
fi


 install_mysql 1>/dev/null;
 install_libxml2 1>/dev/null;
 install_gd   1>/dev/null;
 install_httpd  1>/dev/null;
 install_curl   1>/dev/null;
 install_php    1>/dev/null;
 install_memcached 1>/dev/null;
 install_memcache 1>/dev/null;
install_soap 1>/dev/null;
echo "install complate"
