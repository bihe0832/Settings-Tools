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

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install ruby-2.4.1
rvm 2.4.1 --default
ruby -v
rvm install rubygems 2.6.12 --force
gem -v
gem sources -l
gem install jekyll bundler github-pages jekyll-paginate
jekyll -v

chmod 755 /usr/local/rvm/gems/ruby-2.4.1/bin/*


