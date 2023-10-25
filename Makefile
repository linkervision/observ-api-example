GIT = $(shell which git)
PIP = $(shell which pip)

.PHONY: help
help: ## Show help messages
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {gsub("\\\\n",sprintf("\n%22c",""), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install-dev
install-dev: install-dev-pkgs install-git-hooks install-commit-message-template ## install dev tools

.PHONY: install-dev-pkgs
install-dev-pkgs: ci/dev.txt ## install dev pacakges
	# Installing dev pacakges
	@$(PIP) install -q -r $<

###########################################################
# git hooks
###########################################################
.PHONY: install-git-hooks
install-git-hooks: .pre-commit-config.yaml ## install git hooks
	# Installing git hook
	@pre-commit install -c $< --install-hooks -t pre-commit -t commit-msg -t pre-push

.PHONY: uninstall-git-hooks
uninstall-git-hooks: ## uninstall git hooks
	# Uninstalling git hooks
	@pre-commit uninstall -t pre-commit -t commit-msg -t pre-push


###########################################################
# commit message template
###########################################################
.PHONY: install-commit-message-template
install-commit-message-template: ci/COMMIT_MESSAGE_TEMPLATE ## install commit-message template in repository
	# Installing commit-message template
	@$(GIT) config commit.template $<

.PHONY: uninstall-commit-message-template
uninstall-commit-message-template: ## uninstall commit message template in repo
	# Uninstalling commit-message template
	@$(GIT) config --unset commit.template || true
