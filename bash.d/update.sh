#!/bin/bash

function update_dotfiles(){
  (cd ~/.dotfiles && git reset --hard && git up > /dev/null 2>&1)
}

function needs_update(){
  (cd ~/.dotfiles && git log -n1|awk -F] '{print $1}'|grep -c 'week')
}