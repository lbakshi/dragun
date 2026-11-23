.DEFAULT_GOAL := help

MINIKUBE ?= minikube
PROFILE ?= dragun
DRIVER ?= docker
CPUS ?= 4
MEMORY ?= 6g
MINIKUBE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SGLANG_IMAGE ?= dragun/sglang-cpu:local
SGLANG_CHART := $(MINIKUBE_DIR)../../deploy/charts/sglang
SGLANG_VALUES := $(MINIKUBE_DIR)../../deploy/environments/local/sglang.yaml

.PHONY: help setup check start stop status teardown sglang-image sglang-deploy

help:
	@printf '%s\n' \
	  'setup             Check prerequisites and start the local cluster' \
	  'check             Check local prerequisites' \
	  'start             Start the local cluster' \
	  'stop              Stop the local cluster' \
	  'status            Show local cluster status' \
	  'teardown          Delete the local cluster and its data' \
	  'sglang-image      Build the local ARM64 CPU image' \
	  'sglang-deploy     Load the image and install the SGLang chart' \
	  'ENV=local (default); dev and prod are not configured yet.' \
	  'Overrides: PROFILE=$(PROFILE) DRIVER=$(DRIVER) CPUS=$(CPUS) MEMORY=$(MEMORY)'

setup: check
	$(MINIKUBE) start --profile "$(PROFILE)" --driver "$(DRIVER)" --cpus "$(CPUS)" --memory "$(MEMORY)"

check:
	@for tool in "$(MINIKUBE)" kubectl helm "$(DRIVER)"; do \
	  if ! command -v "$$tool" >/dev/null 2>&1; then \
	    printf 'Missing prerequisite: %s\n' "$$tool" >&2; missing=1; \
	  fi; \
	done; \
	if [ "$${missing:-0}" -ne 0 ]; then exit 1; fi
	@if [ '$(DRIVER)' = docker ]; then docker info >/dev/null 2>&1 || { printf '%s\n' 'Docker is not running or is not accessible.' >&2; exit 1; }; fi

start:
	$(MINIKUBE) start --profile "$(PROFILE)" --driver "$(DRIVER)" --cpus "$(CPUS)" --memory "$(MEMORY)"

stop:
	$(MINIKUBE) stop --profile "$(PROFILE)"

status:
	$(MINIKUBE) status --profile "$(PROFILE)"

teardown:
	$(MINIKUBE) delete --profile "$(PROFILE)"

sglang-image:
	docker build --platform linux/arm64 -t "$(SGLANG_IMAGE)" "$(MINIKUBE_DIR)sglang-image"

sglang-deploy:
	$(MINIKUBE) image load --profile "$(PROFILE)" "$(SGLANG_IMAGE)"
	helm upgrade --install sglang "$(SGLANG_CHART)" --kube-context "$(PROFILE)" -f "$(SGLANG_VALUES)" --set-string "image.reference=$(SGLANG_IMAGE)"
