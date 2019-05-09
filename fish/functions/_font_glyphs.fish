function _font_glyphs -S -d 'Define glyphs used by my shell'
    # Powerline glyphs
    set -x branch_glyph            \uE0A0
    set -x right_black_arrow_glyph \uE0B0
    set -x right_arrow_glyph       \uE0B1
    set -x left_black_arrow_glyph  \uE0B2
    set -x left_arrow_glyph        \uE0B3

    # Additional glyphs
    set -x detached_glyph          \u27A6
    set -x tag_glyph               \u2302
    set -x nonzero_exit_glyph      '! '
    set -x superuser_glyph         '$ '
    set -x bg_job_glyph            '% '
    set -x hg_glyph                \u263F

    set branch_glyph     \uF418
    set detached_glyph   \uF417
    set tag_glyph        \uF412

    set git_dirty_glyph      \uF448 '' # nf-oct-pencil
    set git_staged_glyph     \uF0C7 '' # nf-fa-save
    set git_stashed_glyph    \uF0C6 '' # nf-fa-paperclip
    set git_untracked_glyph  \uF128 '' # nf-fa-question
    set git_ahead_glyph      '⇡'
    set git_behind_glyph     '⇣'

    set git_plus_glyph       \uF0DE # fa-sort-asc
    set git_minus_glyph      \uF0DD # fa-sort-desc
    set git_plus_minus_glyph \uF0DC # fa-sort

    set ruby_glyph           \uf43b # nf_oct_ruby
    set git_glyph            \ue702 # nf-dev-git
    set timer_glyph          \u25F7 # fake timer
    set double_arrow_glyph   \u00BB # nf-fa-angle_double_right
    set k8s_glyph            \ufd31 # nf-mdi-ship-wheel
  end