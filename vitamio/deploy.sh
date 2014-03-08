#!/bin/sh

version=4.2.1
libdir=../dist/arm_x86/libs

deploy(){
mvn deploy:deploy-file \
    -Dfile=$3 \
    -DrepositoryId=uphyjp-thirdparty \
    -Durl=http://uphy.jp/nexus/content/repositories/thirdparty/ \
    -DartifactId=vitamio-vinit \
    -DgroupId=io.vov.vitamio \
    -Dversion=$1 \
    -Dclassifier=$2 \
    -Dpackaging=so
}

deploy $version "ARMv5" ${libdir}/armeabi/libvinit.so
deploy $version "ARMv7" ${libdir}/armeabi-v7a/libvinit.so
deploy $version "x86" ${libdir}/x86/libvinit.so

mvn -U clean deploy -PARMv5
mvn -U clean deploy -PARMv7
mvn -U clean deploy -Px86