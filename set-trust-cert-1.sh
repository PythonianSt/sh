#!/bin/sh
echo -n | openssl s_client -connect 10.104.11.155:9999 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >server-cert.pem

sudo keytool -delete -alias denodo-server -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit

sudo keytool -import -alias denodo-server -file ./server-cert.pem -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit
