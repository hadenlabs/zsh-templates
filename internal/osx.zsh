#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function templates::internal::reattach-to-user-namespace::install {
    if ! type -p brew > /dev/null; then
        message_warning "${TEMPLATES_MESSAGE_BREW}"
        return
    fi
    message_info "Installing reattach-to-user-namespace for ${TEMPLATES_PACKAGE_NAME}"
    brew install reattach-to-user-namespace
    message_success "Installed reattach-to-user-namespace ${TEMPLATES_PACKAGE_NAME}"
}

if ! type -p reattach-to-user-namespace > /dev/null; then templates::internal::reattach-to-user-namespace::install; fi