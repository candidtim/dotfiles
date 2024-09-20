#!/bin/bash

pipx ensurepath
pipx install python-lsp-server
pipx inject python-lsp-server python-lsp-black python-lsp-isort
pipx install black
pipx install isort
pipx install flake8
pipx install poetry
