#!/usr/bin/env bash

if [ ! -e ca-key.pem ]
then
   echo generating CA key, csr, and cert...;
   cfssl genkey -initca ca.json | cfssljson -bare ca;
   echo done building CA;
fi
