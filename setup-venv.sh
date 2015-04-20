#!/bin/bash

VENV_NAME=os

if [ ! -d $VENV_NAME ]; then
    virtualenv $VENV_NAME
    source $VENV_NAME/bin/activate
    pip install python-openstackclient python-saharaclient
    deactivate
else
    echo "Virtualenv at "$VENV_NAME" already set up. Remove it manually and run again to recreate."
fi

