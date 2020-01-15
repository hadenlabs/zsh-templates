#!/usr/bin/env ksh
# -*- coding: utf-8 -*-


function less::install {
    message_info "Installing less for ${template_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATE_MESSAGE_BREW}"
        return
    fi
    brew install less
    message_success "Installed less for ${template_package_name}"

}

function most::install {
    message_info "Installing most for ${template_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATE_MESSAGE_BREW}"
        return
    fi
    brew install most
    message_success "Installed most for ${template_package_name}"

}


# find command for read
function template::read {
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

function fzf::install {
    # shellcheck disable=SC2154
    message_info "Installing fzf for ${template_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATE_MESSAGE_BREW}"
        return
    fi
    brew install fzf
    message_success "Installed fzf for ${template_package_name}"
}

if ! type -p fzf > /dev/null; then fzf::install; fi
if ! type -p most > /dev/null; then most::install; fi
if ! type -p less > /dev/null; then less::install; fi