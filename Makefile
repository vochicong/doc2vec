freeze:
	pip freeze -r requirements.txt | grep -v "pkg-resources" | grep -v "ansible-container" > requirements.txt
