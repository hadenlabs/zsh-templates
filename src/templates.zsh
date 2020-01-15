#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# shellcheck disable=SC2154  # Unused variables left for readability

function templates::list {
    # shellcheck disable=SC2002
    cat "${TEMPLATE_SOURCE_PATH}"/data.json | jq '.templates[] | "\(.name) | \(.description) | \(.tool) | \(.type) | \(.filename)"'
}

function templates::find {
    local command_value
    command_value=$(templates::list \
                    | fzf \
                    | awk '{print $(NF -0)}' \
                    | perl -pe 'chomp' \
                    | sed 's/\"//g'
                )
    if [ -n "${command_value}" ]; then
        echo "${command_value}"
    fi
}
