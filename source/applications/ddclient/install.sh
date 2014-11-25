#!/bin/bash

cp ddclient /usr/sbin/ddclient
cp sample-etc_rc.d_init.d_ddclient.ubuntu /etc/init.d/ddclient
mkdir -p /etc/ddclient/
[ -e /etc/ddclient/ddclient.conf ] || cp -f sample-etc_ddclient.conf /etc/ddclient/ddclient.conf
mkdir -p /var/cache/ddclient
