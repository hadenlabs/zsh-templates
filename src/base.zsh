#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# find command for read
function template::read {
    local parse_cmd
    if type -p gtac > /dev/null; then
        parse_cmd="gtac"
    elif type -p tac > /dev/null; then
        parse_cmd="tac"
    else
        parse_cmd="tail -r"
    fi
    "${parse_cmd}" "${1}"
}

function fzf::install {
    # shellcheck disable=SC2154
    message_info "Installing fzf for ${template_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
        return
    fi
    brew install fzf
    message_success "Installed fzf for ${template_package_name}"
}

if ! type -p fzf > /dev/null; then fzf::install; fi