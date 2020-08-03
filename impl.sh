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

ln -s ~/Dropbox ~/dbox
ln -s ~/dbox/config/.kube ~/.kube
ln -s ~/dbox/config/gcloud ~/.config/gcloud
