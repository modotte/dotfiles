#!/bin/bash

# Copyright (C) 2021 Modotte
# Create a new Common Lisp project template with cl-project system.

set -ef -o pipefail

PROJECT_NAME=""
LISP="sbcl"
LOCAL_PROJECTS_DIRECTORY="$HOME/quicklisp/local-projects"

Help()
{
    echo "$0 - Create a new common lisp program"
    echo "Usage: $0 name [-h|-l]"
    echo "options:"
    echo "-h    Print this help message"
    echo "-n    Project name"
    echo "-l    Lisp compiler to use. Defaults to sbcl"
    echo "-d    Quicklisp's local-projects directory"
    echo '        Defaults to $HOME/quicklisp/local-projects'
    echo
    echo "Example: $0 -n MY_PROJECT -l ccl -d ."
    echo
}

while getopts ":hn:l:d:" option; do
    case "$option" in
	h)
	    Help
	    exit;;
	n)
	    PROJECT_NAME="$OPTARG";;
	l)
	    LISP="$OPTARG";;
	d)
	    LOCAL_PROJECTS_DIRECTORY="$OPTARG";;
	\?)
	    echo "Error: Invalid option" >&2
	    exit 1;;
    esac
done

if [[ -z "$PROJECT_NAME" ]];then
    echo "Project name is empty" >&2
    exit 1
fi

if [[ -z "$LISP" ]];then
    echo "Lisp compiler doesn't exist" >&2
    exit 1
fi

if [[ -z "$LOCAL_PROJECTS_DIRECTORY" ]];then
    echo "Quicklisp's local project directory path doesn't exist" >&2
    exit 1
fi

DIRECTORY="$LOCAL_PROJECTS_DIRECTORY/$PROJECT_NAME"
"$LISP" --eval '(ql:quickload :cl-project)' \
      --eval "(cl-project:make-project (pathname \"$DIRECTORY\"))" \
      --eval '(uiop:quit 0)'

exit
