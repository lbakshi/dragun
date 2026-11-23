.DEFAULT_GOAL := help
ENGINEERING_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

ifeq ($(ENV),local)
-include $(ENGINEERING_DIR)/infrastructure/minikube/Makefile
else ifeq ($(ENV),)
# Terraform targets do not require a cluster environment.
else ifeq ($(ENV),dev)
$(error ENV=$(ENV) is not configured yet)
else ifeq ($(ENV),prod)
$(error ENV=$(ENV) is not configured yet)
else
$(error Invalid ENV '$(ENV)': use local, dev, or prod)
endif

include $(ENGINEERING_DIR)/infrastructure/terraform/Makefile

ifeq ($(ENV),)
.PHONY: help
help: tf-help
else ifeq ($(wildcard $(ENGINEERING_DIR)/infrastructure/minikube/Makefile),)
.PHONY: help
help: tf-help
endif
