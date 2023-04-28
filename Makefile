compile:
	@echo [building]
	@npx hardhat compile --show-stack-traces

test:
	@echo [testing]
	@npx hardhat test

deploy-local:
	@echo [deploying localhost…]
	@npx hardhat run scripts/deploy.ts --network localhost

.PHONY: compile test deploy-local
