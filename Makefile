# General.
SHELL = /bin/bash
TOPDIR = $(shell git rev-parse --show-toplevel)

default: setup

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

build: venv ## Build the documentatrion site
	. venv/bin/activate && cd ryr-docs && mkdocs build -v -s

setup: venv ## Setup the full environment (default)

publish: venv ## Publish the site to github pages
	. venv/bin/activate && cd ryr-docs && mkdocs gh-deploy -v --clean

venv: venv/bin/activate ## Setup local venv

venv/bin/activate: requirements/local.txt
	test -d venv || python3 -m venv venv
	. venv/bin/activate && pip install -U pip setuptools && pip install -r requirements/local.txt

.PHONY: setup venv
