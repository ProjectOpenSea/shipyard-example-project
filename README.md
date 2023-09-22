# Example Shipyard Project

[Shipyard](https://github.com/ProjectOpenSea/shipyard) is a Forge template for smart contract development.

This repository is a basic example of how one might use Shipyard, along with [an accompanying tutorial](exampleNFTTutorial/Overview.md) for getting set up.

The idea is to clone this repo, play around with it a bit, take a pass through the tutorial, and discard it for a clean start with [Shipyard](https://github.com/ProjectOpenSea/shipyard). In other words, start with `git clone git@github.com:ProjectOpenSea/shipyard-example-project.git`, but once familiar with the patterns, be ready to `forge init --template projectopensea/shipyard` from scratch. More detail on that later.

## Installation

Both Shipyard and this tutorial require Foundry. You can find specific install instructions [here](https://book.getfoundry.sh/getting-started/installation#using-foundryup).

But most likely, you can install Foundry with the following commands:

```bash
# this installs Foundryup, the Foundry installer and updater
curl -L https://foundry.paradigm.xyz | bash
# follow the onscreen instructions output by the previous command to make Foundryup available in your CLI (or else restart your CLI), then run:
foundryup
```

If you plan on generating coverage reports, you'll need to install [`lcov`](https://github.com/linux-test-project/lcov) as well.

On macOS, you can do this with the following command:

```bash
brew install lcov
```

## Overview

### Shipyard proper
Shipyard can be used as a starting point or a toolkit in a wide variety of circumstances. In general, if you're building something NFT related, you're likely to find something useful here. For more info on [Shipyard](https://github.com/ProjectOpenSea/shipyard), check out its repository.

### Shipyard tutorial
The tutorial covers the process of deploying an NFT contract, ranging from [ERC721 concepts](exampleNFTTutorial/ERC721Concepts.md), [setting up a dev environment](exampleNFTTutorial/EnvironmentSetup.md), [running tests](exampleNFTTutorial/Testing.md), [customizing the behavior of an NFT contract](exampleNFTTutorial/CustomNFTFunctionality.md), to [deploying](exampleNFTTutorial/Deploying.md).

The table of contents and a brief intro can be found [here](exampleNFTTutorial/Overview.md).

## Quick Deploy Guide

To deploy an NFT contract to the Goerli testnet, fund an address with 0.25 Goerli ETH, swap in the appropriate value `<your_pk>` in this command, open a terminal window, and run the following:

```
mkdir my-shipyard-based-project &&
cd my-shipyard-based-project &&
curl -L https://foundry.paradigm.xyz | bash &&
foundryup &&
forge init --template projectopensea/shipyard &&
forge build &&
export GOERLI_RPC_URL='https://goerli.blockpi.network/v1/rpc/public &&
export MY_ACTUAL_PK_BE_CAREFUL='<your_pk>' &&
forge create --rpc-url $GOERLI_RPC_URL \
    --private-key $MY_ACTUAL_PK_BE_CAREFUL \
    src/Dockmaster.sol:Dockmaster \
    --constructor-args "Tutorial Dockmaster NFT" "TDNFT"
```

A quick breakdown of each step follows.

Create a directory, `cd` into it, :
```
mkdir my-shipyard-based-project &&
cd my-shipyard-based-project &&
curl -L https://foundry.paradigm.xyz | bash
```

Install the `foundryup` up command and run it, which in turn installs forge, cast, anvil, and chisel:
```
curl -L https://foundry.paradigm.xyz | bash &&
foundryup
```

Create a new Foundry project based on Shipyard, which also initializes a new git repository.
```
forge init --template projectopensea/shipyard
```

Install dependencies and compile the contracts:
```
forge build
```

Set up your environment variables:
```
export GOERLI_RPC_URL='https://goerli.blockpi.network/v1/rpc/public	 &&
export MY_ACTUAL_PK_BE_CAREFUL='<your_pk>'
```

Run the `forge create` command, which deploys the contract:
```
forge create --rpc-url $GOERLI_RPC_URL \
    --private-key $MY_ACTUAL_PK_BE_CAREFUL \
    src/Dockmaster.sol:Dockmaster \
    --constructor-args "Tutorial Dockmaster NFT" "TDNFT"
```

See https://book.getfoundry.sh/reference/forge/forge-create for more information on `forge create`.

Running this command merely deploys the example Dockmaster NFT contract, but it's a good way to check for a properly functioning dev environment. Deploying to mainnet instead of Goerli just requires using a mainnet RPC URL instead of a Goerli RPC URL, and it costs real money.

### Reinitialize Submodules
When working across branches with different dependencies, submodules may need to be reinitialized. Run
```bash
./reinit-submodules
```

### Coverage Reports
Run
```bash
./coverage-report
```

### Useful Aliases
```
alias gm="foundryup"
alias ff="forge fmt"
```

