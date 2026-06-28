.PHONY: install virtualenv ipython clean test watch lint

install:
	@echo "Installing for dev environment"
	
	# only works when the .venv is activated
# 	@pip install -e .[dev] 

	# install in the right environment without it being activated. check what is the path for windows! 
# 	@.venv/bin/python -m pip install -e .[dev] 
# 	@.venv/Scripts/python -m pip install -e .[dev] 

	python -m pip install -e .[dev]


virtualenv:
# 	@.venv/bin/python -m pip -m venv .venv
# 	@.venv/Scripts/python -m pip -m venv .venv
	python -m pip -m venv .venv


ipython:
# 	@.venv/bin/ipython
# 	@.venv/Scripts/ipython
	ipython

lint:
# 	.venv/bin/pflake8
# 	.venv/Scripts/pflake8
	python -m pflake8 .

test:
# 	@.venv/bin/pytest -vv -s tests/
# 	@.venv/Scripts/pytest -vv -s tests/
	python -m pytest -vv -s tests/


testci:
# 	@.venv/bin/pytest -v --junitxml=test-result.xml
# 	@.venv/Scripts/pytest -v --junitxml=test-result.xml
	python -m pytest -v --junitxml=test-result.xml

watch:
# 	@.venv/bin/ptw -- -vv -s tests/
# 	@.venv/Scripts/ptw -- -vv -s tests/
	python -m ptw -- -vv -s tests/

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
