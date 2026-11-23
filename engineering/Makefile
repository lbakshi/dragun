.DEFAULT_GOAL := help

ENV ?= local

ifeq ($(ENV),local)
include infrastructure/minikube/Makefile
else ifeq ($(ENV),dev)
$(error ENV=$(ENV) is not configured yet)
else ifeq ($(ENV),prod)
$(error ENV=$(ENV) is not configured yet)
else
$(error Invalid ENV '$(ENV)': use local, dev, or prod)
endif
