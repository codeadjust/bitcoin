FROM ubuntu:20.04

ENV BITCOIN_URL='https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz' \
    BITCOIN_SHA256=59ebd25dd82a51638b7a6bb914586201e67db67b919b2a1ff08925a7936d1b16 \
    BITCOIN_DIST='bitcoin.tar.gz' \
    BITCOIN_BIN='bitcoin_bin'

WORKDIR /

ADD $BITCOIN_URL /$BITCOIN_DIST

RUN set -ex \
    && echo "$BITCOIN_SHA256  $BITCOIN_DIST" | sha256sum -c - \
    && mkdir $BITCOIN_BIN \
    && tar -xzvf $BITCOIN_DIST -C $BITCOIN_BIN --strip-components=2 --exclude=*-qt \
    && mv $BITCOIN_BIN/bitcoind $BITCOIN_BIN/bitcoin-cli $BITCOIN_BIN/bitcoin-tx /usr/local/bin/ \
    && rm -r bitcoin* \
    && useradd -m user

USER user

ENTRYPOINT [ "bitcoind" ]
