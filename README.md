# Dockeriezed Bitcoin-core (bitcoind)

Quick example:
```bash
docker run --name bitcoind -d codeadjust/bitcoin
```

Additional flags can be passed to bitcoind:
```bash
docker run --name bitcoind -d -p 8332:8332 codeadjust/bitcoin \
    -server \
    -rpcport=8332 \
    -rpcuser=user \
    -rpcpassword=pass
```
