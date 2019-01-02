# vim: set noet:
#
# Set the default prompt command.

function __fish_prompt_duration
  set --local duration (echo "$CMD_DURATION 1000" | awk '{printf "%.2fs", $1 / $2}')
  set --local last (string split " " (echo $history[1]))

  set_color 777
  echo -n "$timer_glyph $last[1] took ~"
  echo $duration
  set_color normal
end

function _rbenv_version
  if test -e .ruby-version
    if type -q rbenv
      echo -s -n $red $ruby_glyph" " (rbenv version | awk '{print $1}')" "$normal
    end
  end
end

function _kctx
  if type -q kubectl
    echo -s -n $blue $k8s_glyph" "(kubectl config current-context)\|(kubectl config view | grep namespace:|awk '{print $2}')" "$normal
  end
end

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)
set cyan (set_color -o cyan)
set blue (set_color -o blue)

# Fish git prompt
set __fish_git_prompt_shorten_branch_len 10
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_describe_style branch
set __fish_git_prompt_showstashstate 'yes'

# Status Chars
_font_glyphs
set __fish_git_prompt_char_dirtystate $git_dirty_glyph
set __fish_git_prompt_char_stagedstate $git_staged_glyph
set __fish_git_prompt_char_untrackedfiles $git_untracked_glyph
set __fish_git_prompt_char_stashstate $git_stashed_glyph
set __fish_git_prompt_char_upstream_ahead $git_ahead_glyph
set __fish_git_prompt_char_upstream_behind $git_behind_glyph

function fish_prompt --description "Write out the prompt"
  if test $CMD_DURATION -gt 1000
    echo (__fish_prompt_duration)
  end

  set -l arrow "$red$double_arrow_glyph $normal"
  echo -n -s (_rbenv_version) (__fish_git_prompt "$yellow$git_glyph %s ") $cyan(prompt_pwd) $normal  \n $arrow ""
end