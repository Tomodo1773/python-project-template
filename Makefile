.PHONY: all act-pytest ty
all: requirements.txt

requirements.txt: uv.lock
	uv export -o $@

act-pytest:
	act -W .github/workflows/pytest.yml

ty:
	uv run ty check .
