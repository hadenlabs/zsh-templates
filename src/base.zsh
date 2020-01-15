#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function fzf::install {
    message_info "Installing fzf for ${template_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
        return
    fi
    brew install fzf
    message_success "Installed fzf for ${template_package_name}"
}

if ! type -p fzf > /dev/null; then fzf::install; fi