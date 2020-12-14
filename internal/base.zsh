#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function templates::internal::less::install {
    message_info "Installing less for ${TEMPLATES_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATE_MESSAGE_BREW}"
        return
    fi
    brew install less
    message_success "Installed less for ${TEMPLATES_PACKAGE_NAME}"

}

function templates::internal::most::install {
    message_info "Installing most for ${TEMPLATES_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATE_MESSAGE_BREW}"
        return
    fi
    brew install most
    message_success "Installed most for ${TEMPLATES_PACKAGE_NAME}"

}

function templates::internal::rsync::install {
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATES_MESSAGE_BREW}"
        return
    fi
    message_info "Installing rsync for ${TEMPLATES_PACKAGE_NAME}"
    brew install rsync
    message_success "Installed rsync ${TEMPLATES_PACKAGE_NAME}"
}

function templates::internal::fzf::install {
    # shellcheck disable=SC2154
    message_info "Installing fzf for ${TEMPLATES_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATES_MESSAGE_BREW}"
        return
    fi
    brew install fzf
    message_success "Installed fzf for ${TEMPLATES_PACKAGE_NAME}"
}

# find command for read
function templates::read {
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
