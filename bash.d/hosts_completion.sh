HOSTSFILE=~/etc/hosts
if [ -f "${HOSTSFILE}" ]; then
  complete -W "$(echo $(cat ${HOSTSFILE}))" ssh
  complete -W "$(echo $(cat ${HOSTSFILE}))" ipmi_rescue
fi