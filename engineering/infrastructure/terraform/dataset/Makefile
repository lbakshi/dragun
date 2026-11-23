TERRAFORM_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)
include $(TERRAFORM_DIR)/common.mk

DATASET_DIR := $(abspath $(TERRAFORM_DIR)/../../../dataset)

.PHONY: pull push

pull:
	@mkdir -p "$(DATASET_DIR)"
	@bucket="$$(terraform output -raw bucket_name)" && \
	 profile="$$(terraform output -raw aws_profile)" && \
	 region="$$(terraform output -raw aws_region)" && \
	 aws s3 sync "s3://$$bucket/dataset/" "$(DATASET_DIR)/" --profile "$$profile" --region "$$region"

push:
	@test -d "$(DATASET_DIR)" || { printf 'Dataset directory not found: %s\n' "$(DATASET_DIR)" >&2; exit 1; }
	@bucket="$$(terraform output -raw bucket_name)" && \
	 profile="$$(terraform output -raw aws_profile)" && \
	 region="$$(terraform output -raw aws_region)" && \
	 aws s3 sync "$(DATASET_DIR)/" "s3://$$bucket/dataset/" --profile "$$profile" --region "$$region"
