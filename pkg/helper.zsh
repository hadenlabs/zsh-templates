#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# edittemplates edit settings for templates
function edittemplates {
    if [ -z "${EDITOR}" ]; then
        message_warning "it's neccesary the var EDITOR"
        return
    fi
    "${EDITOR}" "${TEMPLATES_FILE_TEMPLATES}"
}
