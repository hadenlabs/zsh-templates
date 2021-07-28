#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# shellcheck disable=SC2154  # Unused variables left for readability
function templates::internal::list {
    # shellcheck disable=SC2002
    find "${TEMPLATES_TEMPLATES_PATH}" -type f | sed "s/.*templates//"
}

function templates::internal::find {
    templates::internal::list \
                    | fzf --height 40% --layout=reverse --border \
                    | awk '{print $(NF -1)}'
}

# find command for read
function templates::internal::templates::read {
    local parse_cmd
    if type -p less > /dev/null; then
        parse_cmd="less"
    elif type -p most > /dev/null; then
        parse_cmd="most"
    else
        parse_cmd="cat"
    fi
    "${parse_cmd}" "${1}"
}

# load template by filename
function templates::internal::load {
    local filename
    filename="${1}"
    if [ -z "${filename}" ]; then
        message_warning "Please is necessary filename path"
        return
    fi
    templates::internal::templates::read "${TEMPLATES_TEMPLATES_PATH}/${filename}" | pbcopy
}
