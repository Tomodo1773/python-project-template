#!/usr/bin/env bash
set -euo pipefail

echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc

git config --global devcontainers-theme.hide-status 1
git config --global codespaces-theme.hide-status 1

uv sync || true
uv run pre-commit install || true
