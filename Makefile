freeze:
	pip freeze -r requirements.txt | grep -v "pkg-resources" > requirements.txt
