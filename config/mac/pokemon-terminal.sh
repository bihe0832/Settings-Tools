#!/bin/sh
# author zixie code@bihe0832.com

# cd ~/zixie/github/ 

# git clone https://github.com/zixieTools/Pokemon-Terminal.git 

# cd Pokemon-Terminal 

# python3.7 setup.py install
	

function testPokemon() {
   pokemon -$1 $2 -v
   sleep 1
}
export -f testPokemon

# echo "normal
# fire
# fighting
# water
# flying
# grass
# poison
# electric
# ground
# psychic
# rock
# ice
# bug
# dragon
# ghost
# dark
# steel
# fairy" | xargs -I {} bash -c 'testPokemon t "{}"'

# echo "kanto
# johto
# hoenn
# sinnoh
# unova
# kalos" | xargs -I {} bash -c 'testPokemon r "{}"'


pokemon -t fire -ss 1