#!/bin/sh
BASEDIR=source-Osmocom

[ -d $BASEDIR ] || mkdir -p $BASEDIR
cd $BASEDIR

for proj in \
  asn1c \
  libasn1c \
  libosmo-abis \
  libosmocore \
  libosmo-dsp \
  libosmo-netif \
  libosmo-sccp \
  libsmpp34 \
  openbsc \
  osmo-bsc \
  osmo-msc \
  osmo-mgw \
  osmo-ggsn \
  osmo-sgsn \
  osmo-bts \
  osmo-gmr \
  osmo-iuh \
  osmo-pcu \
  osmo-sip-connector \
  osmo-trx \
  osmo-hlr \
  ; do

	if [ -d $proj ]; then
		(cd $proj && git fetch && git checkout -f -B master origin/master)
	else
		git clone git://git.osmocom.org/$proj
	fi
done

git clone git://git.sysmocom.de/sysmo-bts/layer1-api

#IU git -C asn1c checkout aper-prefix
#IU git -C libosmo-netif checkout sysmocom/sctp
#IU git -C libosmo-sccp checkout sysmocom/iu
#IU git -C openbsc checkout sysmocom/iu
