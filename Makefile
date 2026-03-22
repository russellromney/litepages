CARGO := $(shell which cargo || echo ~/.cargo/bin/cargo)

.PHONY: help test build check fmt clippy clean publish

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

test: ## Run tests
	$(CARGO) test

build: ## Build the crate
	$(CARGO) build --release

check: ## Run cargo check
	$(CARGO) check

fmt: ## Format code
	$(CARGO) fmt

clippy: ## Run clippy linter
	$(CARGO) clippy --all-targets --all-features -- -D warnings

clean: ## Clean build artifacts
	$(CARGO) clean

publish: ## Publish to crates.io (dry-run first)
	@echo "Running dry-run publish..."
	$(CARGO) publish --dry-run
	@echo ""
	@echo "Dry-run successful! Run 'cargo publish' to publish for real."
	@echo "Or run: make publish-real"

publish-real: ## Actually publish to crates.io
	$(CARGO) publish

.DEFAULT_GOAL := help
