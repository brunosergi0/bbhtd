#!/bin/bash
################INFO#################
# Title: Bug Bounty Hunting Tookit in Docker 
# Author: Bruno Sergio @brunosgio
# Github Link: https://github.com/brunosgio/bbhtd/

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`

function ctrl_c(){
  echo -e "${red}\n[!] Ctrl + C pressed. Script ended...${reset}\n"
  exit 1
}
trap ctrl_c INT

echo -e "${blue}                
            Ndhhhd         dhhhh          
           do/:--:+yN     s+:--:+s        
           s/------+sN   s/------+s       
           s+-------oy Ns+------:oh       
           dso+/:---:syss+++++++oshdN     
       Nhs+oooooo++++o+oooo+:-----:/+shN  
      hs/:ooooo:----/oooo+:-----------/sd 
     ho::ooooo:----/oooo+--------------:od
   hys/-/oooo/-----+oooo----/:--------::/s
  soos:-+oooo:-----ooooo----::--------:::s
  Ndys/-/oooo/-----+oooo:---------------/s
     do:-ooooo:----:oooo+--------------/o 
       s+:+oooo/---:/oooo+:----------:+s  
        dyooooooo/ooo++oooo+/:--:::/oyd   
          N soooysooossoosssoosyhhd N     
           yooossoooooooossoooy           
          hooo++ooo++ooo+ooooh            
           y+/////////////+hN             
           y/////////////+/d              
           y///////+/+/+/+/d              
           y///////+/+/+/+/d              
           y///////+/+/+//+d              
           Ndyo+///+/+/+sh                
               Nhs++oydN                                                                     
${reset}Bug Bounty Hunting Toolkit in Docker
\t${yellow}Created by @brunosgio${reset}
"

echo "${green}[+] Building the Dockerfile. This will take a while...${reset}"
sleep 2
docker build --pull --rm -f 'Dockerfile' -t bbhtd:docker '.'

echo -e "[~] I recommend adding the alias below to your ${yellow}~/.bashrc${reset} or ${yellow}~/.zshrc${reset} to start the\ncontainer with the properties needed to run the Bug Bounty Hunting Toolkit in Docker." 
echo -e "\n${yellow}alias bbhtd='sudo xhost +local:docker && docker container start bbhtd; docker container attach bbhtd'${reset}\n"

echo "${green}[+] Getting an interactive shell capable of opening GUI applications.${reset}" 
sleep 2
sudo xhost +local:docker && docker run \
  --name bbhtd --hostname bbhtd \
  -it --privileged --env DISPLAY=unix$DISPLAY \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
  --volume="/sys/fs/cgroup/:/sys/fs/cgroup:ro" \
  --device /dev/snd --device /dev/dri --device /dev/net/tun:/dev/net/tun \
  --network host --cap-add=NET_ADMIN \
  bbhtd:docker /bin/bash

exit 0
