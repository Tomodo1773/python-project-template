#!/usr/bin/env bash
set -euo pipefail

echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc

uv sync || true
uv run pre-commit install || true

