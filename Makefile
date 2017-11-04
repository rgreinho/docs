# General.
SHELL = /bin/bash
TOPDIR = $(shell git rev-parse --show-toplevel)

default: setup

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

build: ## Build the documentatrion site
	mkdocs build

setup: venv ## Setup the full environment (default)

venv: venv/bin/activate ## Setup local venv

venv/bin/activate: requirements/local.txt
	test -d venv || python3 -m venv venv
	. venv/bin/activate && pip install -U pip setuptools && pip install -r requirements/local.txt

.PHONY: setup venv
