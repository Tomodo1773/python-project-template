.PHONY: all act-pytest
all: requirements.txt

requirements.txt: uv.lock
	uv export -o $@

act-pytest:
	act -W .github/workflows/pytest.yml
