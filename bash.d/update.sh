#!/bin/bash

function update_dotfiles(){
  (cd ~/.dotfiles && git up > /dev/null 2>&1)
}

function needs_update(){
  cd ~/.dotfiles && git log -n1|awk '{print $2}'|grep -c 'week'
}