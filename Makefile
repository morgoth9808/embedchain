# Variables
PYTHON := python3
PIP := $(PYTHON) -m pip
PROJECT_NAME := embedchain

# Targets
.PHONY: install format lint clean test ci_lint ci_test coverage

install:
	poetry install

install_es:
	poetry install --extras elasticsearch

install_opensearch:
	poetry install --extras opensearch

shell:
	poetry shell

py_shell:
	poetry run python

format:
	$(PYTHON) -m black .
	$(PYTHON) -m isort .

lint:
	$(PYTHON) -m ruff .

clean:
	rm -rf dist build *.egg-info

test:
	$(PYTHON) -m pytest

ci_lint:
	poetry run ruff .

ci_test:
	poetry run pytest

coverage:
	poetry run pytest --cov=$(PROJECT_NAME) --cov-report=xml
