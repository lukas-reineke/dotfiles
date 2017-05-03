#!/bin/bash

function jira_call() {
    JQ_QUERY='.issues[]|"\(.key)\t\(.fields.summary)"'
    CURL=$(curl --location --silent --request POST --header "Authorization: Basic ${JIRA_AUTH}" --header "Content-Type: application/json" ${JIRA_DOMAIN}/rest/api/2/search -d '{"jql": "assignee=currentuser()"}')

    if [[ ! $? -eq 0 ]]; then
        echo "curl has failed"
        exit 1
    fi

    JQ=$(jq -r ${JQ_QUERY} <<< $CURL)

    if [[ ! $? -eq 0 ]]; then
        echo "parsing the result has failed"
        exit 1
    fi

    echo -e "$JQ"
}


TICKET=$(jira_call | fzf --height 20% --reverse)

if [[ ! -z $TICKET ]]; then
    echo $TICKET
    echo ""

    TICKET_NUMBER=$(echo $TICKET | awk '{print$1}')
    DESC=$(echo ${TICKET// /-} | awk '{print tolower($2)}')

    echo $1/$TICKET_NUMBER-$DESC
    echo ""

    echo -n "Keep Description? [y/n]: "

    read KEEP

    if [[ $KEEP =~ ^(n|N)$ ]]; then
        echo ""
        echo -n "Description: "
        read DESC
    fi

    if [[ ! -z $DESC ]] && [[ ! -z $TICKET_NUMBER ]] && [[ ! -z $1 ]]; then
        git checkout -b $1/$TICKET_NUMBER-$DESC
    fi

fi

