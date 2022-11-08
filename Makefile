
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[32m%-25s\033[m %s\n", $$1, $$2}'

.PHONY: install
install: # Install dependencies (CocoaPods & Carthage)
	@printf '\n\033[32m===== Install tools and dependencies =====\033[0m\n'
	@echo "install tools"
	swiftlint
