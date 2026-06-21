#!/bin/bash

pipx ensurepath
pipx install uv ruff ty python-lsp-server
pipx inject python-lsp-server python-lsp-ruff
