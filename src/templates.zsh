#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# shellcheck disable=SC2154  # Unused variables left for readability

function template::list {
    # shellcheck disable=SC2002
    cat "${TEMPLATE_SOURCE_PATH}"/data.json | jq '.templates[] | "\(.name) | \(.description) | \(.tool) | \(.type) | \(.filename)"'
}

function template::find {
    local filename
    filename=$(template::list \
                    | fzf \
                    | awk '{print $(NF -0)}' \
                    | perl -pe 'chomp' \
                    | sed 's/\"//g'
                )
    if [ -n "${filename}" ]; then
        echo "${filename}"
    fi
}
