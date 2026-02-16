.PHONY: install virtualenv ipython clean test

install:
	@echo "Installing for dev environment"

# only works when the .venv is activated
	@pip install -e .[dev] 

# install in the right environment without it being activated. check what is the path for windows! 
# 	@.venv/bin/python -m pip install -e .[dev] 


virtualenv:
	@.venv/bin/python -m pip -m venv .venv


ipython:
	@.venv/bin/ipython

test:
	@.venv/bin/pytest -vv -s tests/

clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build
