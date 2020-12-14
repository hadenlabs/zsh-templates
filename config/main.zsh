#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function templates::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_TEMPLATES_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_TEMPLATES_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_TEMPLATES_PATH}"/config/linux.zsh
      ;;
    esac
}

templates::config::main::factory
