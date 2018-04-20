#!/usr/bin/env bash

# TODO: Replace this with reading from vault
echo -n "Enter Password:"
read pass

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out releasekey.x509.pem -days 10000 -subj '/C=US/ST=Louisiana/L=Monroe/O=CenturyLink/OU=Monitoring Anywhere/CN=watcher.ctl.io'
openssl pkcs12 -export -inkey temp.pem  -in releasekey.x509.pem -name watcher_mobile_signing_key -passout pass:$pass -out watcher_mobile_signing_key.pfx

keytool -importkeystorlse -deststorepass $pass -destkeypass $pass -destkeystore watcher_signing_keystore.jks -srckeystore watcher_mobile_signing_key.pfx -srcstoretype PKCS12 -srcstorepass $pass