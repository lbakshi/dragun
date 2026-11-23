.DEFAULT_GOAL := help

MINIKUBE ?= minikube
PROFILE ?= dragun
DRIVER ?= docker

.PHONY: help setup check start stop status

help:
	@printf '%s\n' \
	  'setup             Check prerequisites and start the local cluster' \
	  'check             Check local prerequisites' \
	  'start             Start the local cluster' \
	  'stop              Stop the local cluster' \
	  'status            Show local cluster status' \
	  'ENV=local selects the local cluster; dev and prod are not configured yet.' \
	  'Overrides: PROFILE=$(PROFILE) DRIVER=$(DRIVER)'

setup: check
	$(MINIKUBE) start --profile "$(PROFILE)" --driver "$(DRIVER)"

check:
	@for tool in "$(MINIKUBE)" kubectl helm "$(DRIVER)"; do \
	  if ! command -v "$$tool" >/dev/null 2>&1; then \
	    printf 'Missing prerequisite: %s\n' "$$tool" >&2; missing=1; \
	  fi; \
	done; \
	if [ "$${missing:-0}" -ne 0 ]; then exit 1; fi
	@if [ '$(DRIVER)' = docker ]; then docker info >/dev/null 2>&1 || { printf '%s\n' 'Docker is not running or is not accessible.' >&2; exit 1; }; fi

start:
	$(MINIKUBE) start --profile "$(PROFILE)" --driver "$(DRIVER)"

stop:
	$(MINIKUBE) stop --profile "$(PROFILE)"

status:
	$(MINIKUBE) status --profile "$(PROFILE)"
