#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install template for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
template_package_name=template

TEMPLATE_PLUGIN_DIR="$(dirname "${0}":A)"
TEMPLATE_SOURCE_PATH="$TEMPLATE_PLUGIN_DIR"/src
TEMPLATE_TEMPLATES_PATH="$TEMPLATE_SOURCE_PATH"/templates

TEMPLATE_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"

# shellcheck source=/dev/null
source "$TEMPLATE_SOURCE_PATH"/base.zsh

# shellcheck source=/dev/null
source "$TEMPLATE_SOURCE_PATH"/templates.zsh


function template::packages {
    message_info "Install packages for $template_package_name"
    message_success "Installed packages for $template_package_name"
}

function template::install {
    message_info "Installing $template_package_name"
    message_success "Installed $template_package_name"
}

function template::post_install {
    message_info "Post Install $template_package_name"
    message_success "Success Install $template_package_name"
}

# load template by filename
function template::load {
    local filename
    filename="${1}"
    if [ -z "${filename}" ]; then
        message_warning "Please is neccesary filename path"
        return
    fi
    template::read "${TEMPLATE_TEMPLATES_PATH}/${filename}" | pbcopy
}

# execute find and load template
function template::run {
    local filename
    filename="$(template::find)"
    if [ -z "${filename}" ]; then
        message_warning "Please select one option"
        return
    fi
    template::load "${filename}"
}

zle -N template::run
bindkey '^T' template::run
