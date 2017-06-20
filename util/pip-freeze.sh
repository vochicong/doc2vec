#!/bin/bash

VENV=$1
REQUIREMENT_FILE=$2

source $VENV
pip freeze -r $REQUIREMENT_FILE | grep -v \
		-E "pkg-resources|ansible-container|ipython|pyknp" \
		> $REQUIREMENT_FILE
