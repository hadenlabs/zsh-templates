#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# execute find and load template
function templates::run {
    local filename
    filename="$(templates::internal::find)"
    if [ -z "${filename}" ]; then
        message_warning "Please select one option"
        return
    fi
    templates::internal::load "${filename}"
}
