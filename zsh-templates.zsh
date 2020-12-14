#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install template for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
ZSH_TEMPLATES_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_TEMPLATES_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_TEMPLATES_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_TEMPLATES_PATH}"/pkg/main.zsh

zle -N templates::run
bindkey '^Xt' templates::run
