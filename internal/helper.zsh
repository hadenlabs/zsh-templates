#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# shellcheck disable=SC2154  # Unused variables left for readability
function templates::internal::list {
    # shellcheck disable=SC2002
    cat "${TEMPLATES_FILE_TEMPLATES}" | jq '.templates[] | "\(.name) | \(.description) | \(.tool) | \(.type) | \(.filename)"'
}

function templates::internal::find {
    local filename
    filename=$(templates::internal::list \
                    | fzf \
                    | awk '{print $(NF -0)}' \
                    | perl -pe 'chomp' \
                    | sed 's/\"//g'
                )
    if [ -n "${filename}" ]; then
        echo "${filename}"
    fi
}

# find command for read
function templates::internal::templates::read {
    local parse_cmd
    if type -p most > /dev/null; then
        parse_cmd="most"
    elif type -p less > /dev/null; then
        parse_cmd="less"
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
        message_warning "Please is neccesary filename path"
        return
    fi
    templates::internal::templates::read "${TEMPLATES_TEMPLATES_PATH}/${filename}" | pbcopy
}
