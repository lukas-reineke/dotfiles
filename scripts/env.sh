#!/bin/bash

echo '[1] eon-pv-visualisation-disaggregation'
echo '[2] eon-pv-visualisation-frontend'
echo '[3] eon-pv-visualisation-middleware'
echo '[4] eon-see-authentication'
echo '[5] eon-see-disaggregation'
echo '[6] eon-see-notifications'
echo '[7] eon-see-user-management'
echo '[8] eon-see-wrappper'

echo ''
read numbers
echo ''

numberArray=' ' read -r -a array <<< "$numbers"

for i in ${!array[@]}; do
    if [[ ${array[$i]} -eq 1 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-pv-visualisation-disaggregation-env-vars.sh'
    elif [[ ${array[$i]} -eq 2 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-pv-visualisation-frontend-env-vars.sh'
    elif [[ ${array[$i]} -eq 3 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-pv-visualisation-middleware-env-vars.sh'
    elif [[ ${array[$i]} -eq 4 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-see-authentication-env-vars.sh'
    elif [[ ${array[$i]} -eq 5 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-see-disaggregation-env-vars.sh'
    elif [[ ${array[$i]} -eq 6 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-see-notifications-env-vars.sh'
    elif [[ ${array[$i]} -eq 7 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-see-user-management-env-vars.sh'
    elif [[ ${array[$i]} -eq 8 ]]; then
        source '/Users/lukasadmin/scripts/eon/eon-see-wrappper-env-vars.sh'
    fi
done