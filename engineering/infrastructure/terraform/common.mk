TERRAFORM ?= terraform
.PHONY: init validate plan deploy

init:
	$(TERRAFORM) init -backend-config="$(TERRAFORM_DIR)/backend.hcl"

validate:
	$(TERRAFORM) validate

plan:
	$(TERRAFORM) plan

deploy:
	$(TERRAFORM) apply
