#!/bin/bash

yum -q check-update | xargs -n3 | sort | uniq -c | while read line ;
do
        package=$(echo $line | cut -d ' ' -f 2)
        [ ! -z "$package" ] && [[ ! $package =~ ^[0-8] ]] && echo 'yum_upgrades_pending{package='\"$package\"'} 1'
done
