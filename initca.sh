#!/usr/bin/env bash

if [ ! -e ca-key.pem ]
then
   echo generating CA key, csr, and cert...;
   cfssl genkey -initca ca.json | cfssljson -bare ca;
   echo done building CA;
fi

function getkey
{
    HOSTNAME=$1
    if [ ! -e $HOSTNAME-key.pem ]
    then
	cfssl gencert -ca ca.pem -ca-key ca-key.pem -hostname=$HOSTNAME,centos-7.vagrant,'*.centos-7.vagrant' host.json | cfssljson -bare $HOSTNAME
    fi
}

for hostid in '01' '02' '03'
do
    getkey centos-7-$hostid.vagrant
done
