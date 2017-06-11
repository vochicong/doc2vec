all: freeze freeze-p2

freeze:
	./util/pip-freeze.sh /workspace/venv/nlp/bin/activate  requirements.txt

freeze-p2:
	./util/pip-freeze.sh /workspace/venv/nlp-p2/bin/activate  requirements-p2.txt

