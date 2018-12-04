# vim: set noet:
#
# Set the default prompt command.

function __fish_prompt_duration
  set --local duration (echo "$CMD_DURATION 1000" | awk '{printf "%.2fs", $1 / $2}')
  set --local last (string split " " (echo $history[1]))

  set_color 777
  echo -n "  $last[1] took ~"
  echo $duration
  set_color normal
end

function __default_fish_prompt --description "Write out the prompt"
    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end



set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_shorten_branch_len 10
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_describe_style branch

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
  echo -n -s "$USER" @ (prompt_hostname) (prompt_pwd) (set_color normal) (__fish_git_prompt) "> "
end