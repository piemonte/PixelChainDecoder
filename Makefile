compile:
	@echo [building]
	@npx hardhat compile --show-stack-traces

deploy-local:
	@echo [deploying localhost…]
	@npx hardhat run scripts/deploy.ts --network localhost

.PHONY: compile deploy-local
