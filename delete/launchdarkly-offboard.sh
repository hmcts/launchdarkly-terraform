#!/bin/bash
set -e
shopt -s nocasematch
window=5097615
currenttime=$(date +%s)
IFS=,


function deleteuser() {
        echo $1
        echo "curl -v --request DELETE \
          --url https://app.launchdarkly.com/api/v2/members/$1 \
          --header 'Authorization: $TOKEN' \
          --header 'LD-API-Version: beta'"

}
curl  -s --request GET   --url 'https://app.launchdarkly.com/api/v2/members?limit=200&offset=0'   --header "Authorization: $TOKEN"   --header 'LD-API-Version: beta' | jq -r '.items | map({_id, email, _lastSeen})| (first | keys_unsorted) as $keys | map([to_entries[] | .value]) as $rows | $keys,$rows[] | @csv' | tr -d \" | grep -v _lastSeen| while read id email lastseen
do
   # delete an user based on argument passed
    if [[ $email == "$EMAIL" ]]
    then
      echo "Deleting user $EMAIL"
      deleteuser $id
      exit 0
    fi
   #  delete an user if previous login time is empty
    if [[ -z $lastseen ]]
    then
      echo "Deleting user [$email, $id ] without login time entry"
      deleteuser $id
    fi
#    # delete an user if the login time is 2 months old
    if [[ ! -z $lastseen ]]
    then
      timedelta=$(( $currenttime - $lastseen/1000 ))
      if [[ $timedelta -gt $window ]]
      then
        echo "Deleting user [$email, $id, $lastseen] with login time older than 2 months"
        deleteuser $id
      fi
    fi
done
