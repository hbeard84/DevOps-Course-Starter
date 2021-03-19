#! /usr/bin/env bash

# Check which Python versions are available
python --version
 
# The first step for Python 3 is to install  Xcode program which is necessary for iOS development
xcode-select --install
 
# Use XCode to install Homebrew, we need this for installing python 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Use Homebrew to Install Python 3.7+
brew install python@3.8 

# Check Python version installed
python --version

# Check if poetry is already installed 

poetry --version

#  Install Poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# Create a virtual environment + Install application dependencies
poetry install