# Regular
export txtblk="$(tput setaf 0)"  # Black
export txtred="$(tput setaf 1)"  # Red
export txtgrn="$(tput setaf 2)"  # Green
export txtylw="$(tput setaf 3)"  # Yellow
export txtblu="$(tput setaf 4)"  # Blue
export txtpur="$(tput setaf 5)"  # Purple
export txtcyn="$(tput setaf 6)"  # Cyan
export txtwht="$(tput setaf 7)"  # White

# Bold
export bldblk="$(tput setaf 0)$(tput bold)"  # Black
export bldred="$(tput setaf 1)$(tput bold)"  # Red
export bldgrn="$(tput setaf 2)$(tput bold)"  # Green
export bldylw="$(tput setaf 3)$(tput bold)"  # Yellow
export bldblu="$(tput setaf 4)$(tput bold)"  # Blue
export bldpur="$(tput setaf 5)$(tput bold)"  # Purple
export bldcyn="$(tput setaf 6)$(tput bold)"  # Cyan
export bldwht="$(tput setaf 7)$(tput bold)"  # White

# Underline
export undblk="$(tput setaf 0)$(tput smul)"  # Black
export undred="$(tput setaf 1)$(tput smul)"  # Red
export undgrn="$(tput setaf 2)$(tput smul)"  # Green
export undylw="$(tput setaf 3)$(tput smul)"  # Yellow
export undblu="$(tput setaf 4)$(tput smul)"  # Blue
export undpur="$(tput setaf 5)$(tput smul)"  # Purple
export undcyn="$(tput setaf 6)$(tput smul)"  # Cyan
export undwht="$(tput setaf 7)$(tput smul)"  # White

# Background
export bakblk="$(tput setab 0)"  # Black
export bakred="$(tput setab 1)"  # Red
export bakgrn="$(tput setab 2)"  # Green
export bakylw="$(tput setab 3)"  # Yellow
export bakblu="$(tput setab 4)"  # Blue
export bakpur="$(tput setab 5)"  # Purple
export bakcyn="$(tput setab 6)"  # Cyan
export bakwht="$(tput setab 7)"  # White

export txtrst="$(tput sgr 0)"    # Text Reset

function show_colors() {
  x=`tput op`
  y=`printf %$((${COLUMNS}-6))s`
  for i in {0..256}
  do
    o=00$i
    echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x
  done
}
