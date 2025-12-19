.PHONY: all
all: requirements.txt

requirements.txt: uv.lock
	uv export -o $@

.PHONY: act-pytest
act-pytest:
	act -W .github/workflows/pytest.yml

.PHONY: check
check:
	uv run ruff check .
	uv run ruff format .
	uv run ty check .
