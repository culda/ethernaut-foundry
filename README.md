# Ethernaut problems solved with Foundry

This is an ongoing playground, so expect things to be likely incomplete and partially working.

# Steps for running

1. setup your Foundry https://book.getfoundry.sh/
2. make an `.env` file according to `env.template`
3. leave anvil running in a terminal
4. Run the script: `forge script script/king.s.sol:KingScript --fork-url http://localhost:8545 --broadcast --sender $SENDER`
5. Enjoy

If you need help creating a wallet, check out https://github.com/culda/rustwallet
