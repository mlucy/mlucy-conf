#!/bin/bash

dir=`mktemp -d ~/.conf.bak.XXXXXX`
for i in * .*; do 
    if [[ $i != . \
	  && $i != .. \
          && $i != .git \
          && $i != impl.sh \
          && $i != packages.t \
       ]]; then
	mv ~/$i $dir/$i
	ln -s `pwd`/$i ~/$i
    fi
done