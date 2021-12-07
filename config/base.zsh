#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export TEMPLATES_MESSAGE_RVM="Please install rvm or use antibody bundle hadenlabs/zsh-rvm branch:develop"
export TEMPLATES_TEMPLATES_PATH="${ZSH_TEMPLATES_PATH}"/templates
export TEMPLATES_PACKAGE_NAME=templates
[ -z "${EDITOR}" ] && export EDITOR="vim"
