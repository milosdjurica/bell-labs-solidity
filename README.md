# Installation

1. Clone the repository

```bash
git clone https://github.com/milosdjurica/bell-solidity
cd bell-solidity
```

2. Install dependencies

```bash
forge install
```

3. Create .env with ganache private key

```
PRIVATE_KEY="PRIVATE_KEY_HERE"
```

# Deploying contract

1. Start ganache
2. Load .env variables

```bash
source .env
```

3. Run deploy script

```bash
forge script script/Store.s.sol:DeployStore --private-key $PRIVATE_KEY --rpc-url http://127.0.0.1:7545 --broadcast

```

# Coverage and tests

```bash
forge coverage
```
