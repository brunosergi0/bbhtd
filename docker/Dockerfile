FROM kalilinux/kali-rolling:latest

# Setting up the working environment
RUN echo "xhost local:" >> ~/.bashrc
RUN echo "export DISPLAY=:0" >> ~/.profile
WORKDIR /root
RUN mkdir -p /root/go/bin && mkdir /root/tools
RUN echo "alias burpsuite='java -jar -Xmx2G /usr/bin/burpsuite -P --no-remote --no-sandbox &> /dev/null &'" | tee -a ~/.bashrc
RUN echo "alias firefox='/usr/bin/firefox -P --no-remote --no-sandbox &> /dev/null &'" | tee -a ~/.bashrc
RUN echo "alias chromium='/usr/bin/chromium -P --no-remote --no-sandbox &> /dev/null &'" | tee -a ~/.bashrc
RUN echo "alias zaproxy='/usr/bin/zaproxy -P --no-remote --no-sandbox &> /dev/null &'" | tee -a ~/.bashrc

# Installing essential programs
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y build-essential apt-utils sudo locate vim nano tmux wget curl whois host xclip upx netcat traceroute tor proxychains prips awscli ftp ssh

# Installing utilities and libraries
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y libpcap-dev pv net-tools dnsutils iputils-ping libldns-dev libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev libgmp-dev libcanberra-gtk* libgl1-mesa-dri libgl1-mesa-glx libpangox-1.0-0 libpulse0 libv4l-0 fonts-symbola apt-transport-https xvfb x11-xserver-utils ca-certificates

# Installing development tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y golang python3 python3-pip python3-dev gcc cmake ruby openjdk-11-jdk-headless git dpkg unrar zip

# Setting environment variables
ENV GOPATH=/root/go
ENV PATH=$GOPATH/bin:$PATH
ENV GO111MODULE=on
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN . /root/.cargo/env

# Add a '#' to the line of the tool you don't want to install

# Installing GUI and headless tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y burpsuite chromium firefox-esr zaproxy

# AltDNS
RUN pip3 install py-altdns

# Amass
RUN apt-get update && apt-get install -y amass

# Anew
RUN go get -ldflags="-s -w" github.com/tomnomnom/anew

# Anubis
RUN pip3 install anubis-netsec

# Anti-burl
RUN go get -ldflags="-s -w" github.com/tomnomnom/hacks/anti-burl

# Arjun
RUN pip3 install arjun

# ASNLookup
RUN mkdir /root/tools/asnlookup && git clone https://github.com/yassineaboukir/Asnlookup /root/tools/asnlookup

# Assetfinder
RUN go get -ldflags="-s -w" github.com/tomnomnom/assetfinder

# Brutespray
RUN apt-get update && apt-get install -y brutespray

# CeWL
RUN apt-get update && apt-get install -y cewl

# CF-check
RUN go get -ldflags="-s -w" github.com/dwisiswant0/cf-check

# Chaos
RUN go get -ldflags="-s -w" github.com/projectdiscovery/chaos-client/cmd/chaos

# Commix
RUN mkdir /root/tools/commix && git clone https://github.com/commixproject/commix /root/tools/commix

# Commonspeak2
RUN go get -ldflags="-s -w" github.com/assetnote/commonspeak2

# Corsy
RUN mkdir /root/tools/corsy && git clone https://github.com/s0md3v/Corsy /root/tools/corsy

# Crobat
RUN go get -ldflags="-s -w" github.com/pry0cc/crobat-client

# Ctfr
RUN mkdir /root/tools/ctfr && git clone https://github.com/UnaPibaGeek/ctfr /root/tools/ctfr && cd /root/tools/ctfr && pip3 install -r requirements.txt

# Dalfox
RUN go get -ldflags="-s -w" github.com/hahwul/dalfox

# Dirdar
RUN go get -ldflags="-s -w" github.com/m4dm0e/dirdar

# Dirhunt
RUN pip3 install dirhunt

# Dirsearch
RUN apt-get update && apt-get install -y dirsearch

# DNSGen
RUN mkdir /root/tools/dnsgen && git clone https://github.com/ProjectAnte/dnsgen /root/tools/dnsgen

# DNSprobe
RUN mkdir /root/tools/dnsprobe && git clone https://github.com/projectdiscovery/dnsprobe /root/tools/dnsprobe && cd /root/tools/dnsprobe; go build -ldflags="-s -w" .; mv dnsprobe /root/go/bin/dnsprobe

# DNSrecon
RUN apt-get update && apt-get install -y dnsrecon

# DNSvalidator
RUN mkdir /root/tools/dnsvalidator && git clone https://github.com/vortexau/dnsvalidator /root/tools/dnsvalidator

# DNSx
RUN go get -ldflags="-s -w" github.com/projectdiscovery/dnsx/cmd/dnsx

# FavFreak
RUN mkdir /root/tools/favfreak && git clone https://github.com/devanshbatham/FavFreak /root/tools/favfreak 

# Feroxbuster
RUN apt-get update && apt-get install -y feroxbuster

# Filter-resolved
RUN go get -ldflags="-s -w" github.com/tomnomnom/hacks/filter-resolved

# Findomain
RUN mkdir /root/tools/findomain && git clone https://github.com/Findomain/Findomain /root/tools/findomain && cd /root/tools/findomain && /root/.cargo/bin/cargo build --release && mv /root/tools/findomain/target/release/findomain /usr/bin/findomain

# Fuff
RUN go get -ldflags="-s -w" github.com/ffuf/ffuf

# Gargs
RUN go get -ldflags="-s -w" github.com/brentp/gargs

# Gau
RUN go get -ldflags="-s -w" github.com/lc/gau

# Gauplus
RUN go get -ldflags="-s -w" github.com/bp0lr/gauplus

# GetJS
RUN go get -ldflags="-s -w" github.com/003random/getJS

# Gf
RUN go get -ldflags="-s -w" github.com/tomnomnom/gf

# Gf-Patterns
RUN mkdir /root/tools/gf-patterns && git clone https://github.com/1ndianl33t/Gf-Patterns /root/tools/gf-patterns && mkdir ~/.gf && mv /root/tools/gf-patterns/*.json ~/.gf

# GitDorker
RUN mkdir /root/tools/gitdorker && git clone https://github.com/obheda12/GitDorker /root/tools/gitdorker 

# Github-Search
RUN mkdir /root/tools/github-search && git clone https://github.com/gwen001/github-search /root/tools/github-search

# Gobuster
RUN apt-get update && apt-get install -y gobuster

# Goop
RUN pip3 install goop

# GoSpider
RUN go get -ldflags="-s -w" github.com/jaeles-project/gospider

# Gowitness
RUN go get -ldflags="-s -w" github.com/sensepost/gowitness

# Gxss
RUN go get -ldflags="-s -w" github.com/KathanP19/Gxss

# Hakrawler
RUN go get -ldflags="-s -w" github.com/hakluke/hakrawler

# HakrevDNS
RUN go get -ldflags="-s -w" github.com/hakluke/hakrevdns

# Haktldextract
RUN go get -ldflags="-s -w" github.com/hakluke/haktldextract

# Haktrails
RUN go get -ldflags="-s -w" github.com/hakluke/haktrails

# Html-tool
RUN go get -ldflags="-s -w" github.com/tomnomnom/hacks/html-tool

# HTTProbe
RUN go get -ldflags="-s -w" github.com/tomnomnom/httprobe

# HTTPx
RUN go get -ldflags="-s -w" github.com/projectdiscovery/httpx/cmd/httpx

# Jaeles
RUN go get -ldflags="-s -w" github.com/jaeles-project/jaeles

# Jq
RUN apt-get update && apt-get install -y jq

# JSParser
RUN mkdir /root/tools/jsparser && git clone https://github.com/nahamsec/JSParser /root/tools/jsparser

# Jsubfinder
RUN go get -ldflags="-s -w" github.com/hiddengearz/jsubfinder

# KiteRunner
RUN mkdir /root/tools/kiterunner && git clone https://github.com/assetnote/kiterunner /root/tools/kiterunner && cd /root/tools/kiterunner/cmd/kiterunner && go build -ldflags="-s -w" .; mv kiterunner /root/go/bin/kiterunner

# Knockpy
RUN apt-get update && apt-get install -y knockpy

# Kxss
RUN go get -ldflags="-s -w" github.com/tomnomnom/hacks/kxss

# LinkFinder
RUN mkdir /root/tools/linkfinder && git clone https://github.com/GerbenJavado/LinkFinder /root/tools/linkfinder && cd /root/tools/linkfinder && python3 setup.py install

# Masscan
RUN apt-get update && apt-get install -y masscan

# MassDNS
RUN mkdir /root/tools/massdns && git clone https://github.com/blechschmidt/massdns /root/tools/massdns; cd /root/tools/massdns && make; cd bin; mv massdns /usr/local/bin/massdns

# Medusa 
RUN apt-get update && apt-get install -y medusa

# Meg
RUN go get -ldflags="-s -w" github.com/tomnomnom/meg

# Metabigor
RUN go get -ldflags="-s -w" github.com/j3ssie/metabigor

# Naabu
RUN mkdir /root/tools/naabu && git clone https://github.com/projectdiscovery/naabu.git /root/tools/naabu; cd /root/tools/naabu/v2/cmd/naabu; go build -ldflags="-s -w" .; mv naabu /root/go/bin/naabu

# Nmap
RUN apt-get update && apt-get install -y nmap

# Notify
RUN mkdir /root/tools/notify && git clone https://github.com/projectdiscovery/notify.git /root/tools/notify; cd /root/tools/notify/cmd/notify; go build -ldflags="-s -w" .; mv notify /root/go/bin/notify; cd /root/tools/notify/cmd/intercept; go build -ldflags="-s -w" .; mv intercept /root/go/bin/intercept

# Nuclei
RUN mkdir /root/tools/nuclei && git clone https://github.com/projectdiscovery/nuclei /root/tools/nuclei && cd /root/tools/nuclei/v2/cmd/nuclei; go build -ldflags="-s -w" .; mv nuclei /root/go/bin/nuclei; nuclei -update-templates

# OpenRedireX
RUN mkdir /root/tools/openredirex && git clone https://github.com/devanshbatham/openredirex /root/tools/openredirex

# ParamSpider
RUN mkdir /root/tools/paramspider && git clone https://github.com/devanshbatham/ParamSpider /root/tools/paramspider

# Prips
RUN apt-get update && apt-get install -y prips

# PureDNS
RUN go get -ldflags="-s -w" github.com/d3mondev/puredns

# Purl
RUN go get -ldflags="-s -w" github.com/a3kSec/purl

# Qsreplace
RUN go get -ldflags="-s -w" github.com/tomnomnom/qsreplace

# Rush
RUN go get -ldflags="-s -w" github.com/shenwei356/rush

# Rustscan
RUN /root/.cargo/bin/cargo install rustscan

# SecLists
RUN apt-get update && apt-get install -y seclists

# SecretFinder
RUN mkdir /root/tools/secretfinder && git clone https://github.com/m4ll0k/SecretFinder /root/tools/secretfinder

# Shodan
RUN pip3 install shodan

# ShuffleDNS
RUN go get -ldflags="-s -w" github.com/projectdiscovery/shuffledns

# Soxy
RUN go get -ldflags="-s -w" github.com/pry0cc/soxy

# SQLMap
RUN apt-get update && apt-get install -y sqlmap

# Subfinder
RUN go get -ldflags="-s -w" github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# Subgen
RUN go get -ldflags="-s -w" github.com/pry0cc/subgen

# Subjack
RUN apt-get update && apt-get install -y subjack

# SubJS
RUN go get -ldflags="-s -w" github.com/lc/subjs

# Sublert
RUN mkdir /root/tools/sublert && git clone https://github.com/yassineaboukir/sublert /root/tools/sublert 

# Sublist3r
RUN apt-get update && apt-get install -y sublist3r

# TestSSL
RUN mkdir /root/tools/testssl && git clone https://github.com/drwetter/testssl.sh /root/tools/testssl 

# The_s3_Bucketeers
RUN mkdir /root/tools/teh_s3_bucketeers && git clone https://github.com/tomdev/teh_s3_bucketeers /root/tools/teh_s3_bucketeers

# TheHarvester
RUN apt-get update && apt-get install -y theharvester

# ToJSON
RUN go get -ldflags="-s -w" github.com/tomnomnom/hacks/tojson

# Unew
RUN go get -ldflags="-s -w" github.com/dwisiswant0/unew

# Unfurl
RUN go get -ldflags="-s -w" github.com/tomnomnom/unfurl

# Unimap
RUN /root/.cargo/bin/cargo install unimap

# Updog
RUN pip3 install updog

# URLprobe
RUN go get -ldflags="-s -w" github.com/1ndianl33t/urlprobe

# Virtual-Host-Discovery
RUN mkdir /root/tools/virtual-host-discovery && git clone https://github.com/jobertabma/virtual-host-discovery /root/tools/virtual-host-discovery

# X8
RUN /root/.cargo/bin/cargo install x8

# XSStrike
RUN mkdir /root/tools/xsstrike && git clone https://github.com/s0md3v/XSStrike /root/tools/xsstrike

# Wafw00f
RUN apt-get update && apt-get install -y wafw00f

# WaybackURLs
RUN go get -ldflags="-s -w" github.com/tomnomnom/waybackurls

# Webscreenshot
RUN pip3 install webscreenshot

# Wfuzz
RUN apt-get update && apt-get install -y wfuzz

# zDNS
RUN mkdir /root/tools/zdns && git clone https://github.com/zmap/zdns /root/tools/zdns && cd /root/tools/zdns/zdns; go build -ldflags="-s -w" .; mv zdns /root/go/bin/zdns

# zMap
RUN apt-get update && apt-get install -y zmap

# Installing requirements and compressing binaries
RUN find /root/tools/ -name requirements.txt | xargs -I@ sh -c 'pip3 install -r @'
RUN upx /root/go/bin/*
