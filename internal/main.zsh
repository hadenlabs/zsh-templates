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

if ! core::exists rsync > /dev/null; then core::install rync; fi
if ! core::exists most > /dev/null; then core::install most; fi
if ! core::exists less > /dev/null; then core::install less; fi
if ! core::exists fzf > /dev/null; then core::install fzf; fi
