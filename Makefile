compile:
	@echo [building]
	@npx hardhat compile --show-stack-traces

test:
	@echo [testing]
	@npx hardhat test

deploy-local:
	@echo [deploying localhost…]
	@npx hardhat run scripts/deploy.ts --network localhost

deploy-goerli:
	@echo [deploying goerli…]
	@npx hardhat run scripts/deploy.ts --network goerli

.PHONY: compile test deploy-local deploy-goerli