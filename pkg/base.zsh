#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# execute find and load template
function templates::run {
    local filename
    filename="$(templates::internal::find)"
    if [ -z "${filename}" ]; then
        return
    fi
    templates::internal::load "${filename}" && zle accept-line
}
