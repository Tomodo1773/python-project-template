.PHONY: all act-pytest check
all: requirements.txt

requirements.txt: uv.lock
	uv export -o $@

act-pytest:
	act -W .github/workflows/pytest.yml

check:
	uv run ruff check .
	uv run ruff format .
	uv run ty check .
