#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function templates::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_TEMPLATES_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_TEMPLATES_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_TEMPLATES_PATH}"/internal/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_TEMPLATES_PATH}"/internal/helper.zsh
}

templates::internal::main::factory

if ! type -p rsync > /dev/null; then templates::internal::rync::install; fi
if ! type -p most > /dev/null; then templates::internal::most::install; fi
if ! type -p less > /dev/null; then templates::internal::less::install; fi
if ! type -p fzf > /dev/null; then templates::internal::fzf::install; fi
