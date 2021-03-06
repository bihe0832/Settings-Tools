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

# 卸载旧版本的nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm --version
nvm install node
cd ~/.nvm 
git fetch -p
git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
nvm --version

npm config delete proxy
npm config set registry https://registry.npm.taobao.org -g
npm config get registry
npm config get proxy
npm install -g nrm
nrm test
nrm use taobao
