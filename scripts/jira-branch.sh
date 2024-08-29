#!/bin/bash

function jira_call() {
    JQ_QUERY='.issues[]|"\(.fields.issuetype.name)\t\(.key)\t\(.fields.summary)"'
    CURL=$(curl --location --silent --request POST -u "$JIRA_USER_EMAIL:$JIRA_USER_API_KEY" --header "Content-Type: application/json" "$JIRA_WORKSPACE_URL"/rest/api/2/search -d '{"jql": "assignee=currentuser() AND status NOT IN (Done, Rejected, Closed) AND type != Epic", "maxResults":50}')

    if [[ ! "$?" -eq 0 ]]; then
        echo "curl has failed"
        exit 1
    fi

    JQ=$(jq -r "$JQ_QUERY" <<<"$CURL")

    if [[ ! "$?" -eq 0 ]]; then
        echo "parsing the result has failed"
        exit 1
    fi

    echo -e "$JQ"
}

TICKET=$(jira_call | column -t -s $'\t' | fzf --height 20% --reverse)

if [[ -n $TICKET ]]; then
    TICKET_NUMBER=$(echo "$TICKET" | awk '{print$2}')
    DESC=$(echo "${TICKET,,}" | awk '{$1=""; $2=""; print}' | sed -e 's/^[[:space:]]*//' | sed -e 's/]$//g' | sed -e 's/[\[| |\|]/-/g')

    if [[ -n "$TICKET_NUMBER" ]] && [[ -n "$DESC" ]]; then
        git checkout -b "$TICKET_NUMBER/$DESC"
    fi
fi
