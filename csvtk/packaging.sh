#!/usr/bin/env sh

gox -os="windows darwin linux";

dir=binaries
mkdir -p $dir;
rm -rf $dir/$f;

for f in csvtk_*; do
    mkdir -p $dir/$f;
    mv $f $dir/$f;
    cd $dir/$f;
    brename -s '_[^\.]+';
    tar -zcf $f.tar.gz csvtk*;
    mv *.tar.gz ../;
    cd ..;
    rm -rf $f;
    cd ..;
done;
