#!/bin/bash
#

apt update -y > /dev/null 2>&1

echo '# HELP apt_total_upgrades_pending total update.'
echo '# TYPE apt_total_upgrades_pending gauge'
total_update="$(( $(apt list --upgradable 2>/dev/null | grep upgradable | wc -l) - 1 ))" 
echo "apt_total_upgrades_pending{} "$total_update

echo '# HELP apt_upgrades_pending list of upgeades package.'
echo '# TYPE apt_upgrades_pending gauge'
for packege in $(apt list --upgradable 2>/dev/null | grep upgradable | cut -d '/' -f 1 )
do
        echo 'apt_upgrades_pending{package='"$packege"'} 1'
done


echo '# HELP apt_autoremove_pending Apt package pending autoremove.'
echo '# TYPE apt_autoremove_pending gauge'
autoremove="$(/usr/bin/apt-get --just-print autoremove \
  | /usr/bin/awk '/^Remv/{a++}END{printf "apt_autoremove_pending %d", a}'
)"
echo "${autoremove}"


echo '# HELP node_reboot_required Node reboot is required for software updates.'
echo '# TYPE node_reboot_required gauge'

if [[ -f '/run/reboot-required' ]] ; then
  echo 'node_reboot_required 1'
else
  echo 'node_reboot_required 0'
fi
