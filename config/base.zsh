#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export TEMPLATES_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export TEMPLATES_MESSAGE_RVM="Please install rvm or use antibody bundle luismayta/zsh-rvm branch:develop"

export TEMPLATES_TEMPLATES_PATH="${ZSH_TEMPLATES_PATH}"/templates
export TEMPLATES_FILE_TEMPLATES="${TEMPLATES_TEMPLATES_PATH}"/data.json

export TEMPLATES_PACKAGE_NAME=templates

[ -z "${EDITOR}" ] && export EDITOR="vim"