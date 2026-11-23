.PHONY: tf-help tf-fmt FORCE
FORCE:

tf-help:
	@printf '%s\n' \
	  'init-<name>      Initialize a Terraform environment' \
	  'validate-<name>  Validate a Terraform environment' \
	  'plan-<name>      Plan a Terraform environment' \
	  'deploy-<name>    Apply a Terraform environment' \
	  'pull-dataset     Download dataset files from S3' \
	  'push-dataset     Upload dataset files to S3' \
	  'tf-fmt           Check Terraform formatting' \
	  'Example: make plan-dataset'

init-% validate-% plan-% deploy-% pull-% push-%: FORCE
	$(MAKE) -C "$(ENGINEERING_DIR)/infrastructure/terraform/$*" $(firstword $(subst -, ,$@))

tf-fmt:
	terraform fmt -check -recursive "$(ENGINEERING_DIR)/infrastructure/terraform"
