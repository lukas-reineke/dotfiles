#!/bin/bash

function jira_call() {
    JQ_QUERY='.issues[]|"\(.fields.issuetype.name)\t\(.key)\t\(.fields.summary)"'
    CURL=$(curl --location --silent --request POST --header "Authorization: Basic ${JIRA_AUTH}" --header "Content-Type: application/json" ${JIRA_DOMAIN}/rest/api/2/search -d '{"jql": "assignee=currentuser()", "maxResults":20}')

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


TICKET=$(jira_call | column -t  -s $'\t'| fzf --height 20% --reverse)

if [[ ! -z $TICKET ]]; then
    echo $TICKET
    echo ""

    TICKET_TYPE=$(echo $TICKET | awk '{print$1}')
    TICKET_NUMBER=$(echo $TICKET | awk '{print$2}')
    DESC=$(echo $TICKET |  awk '{$1=""; $2=""; sub("  ", " "); print tolower()}' | tr ' ' '-')

    if [[ $TICKET_TYPE == "Bug" ]]; then
        BRANCH_TYPE="bugfix"
    else
        BRANCH_TYPE="feature"
    fi

    echo $BRANCH_TYPE/$TICKET_NUMBER$DESC
    echo ""

    echo -n "Keep Description? [y/n]: "

    read KEEP

    if [[ $KEEP =~ ^(n|N)$ ]]; then
        echo ""
        echo -n "Description: "
        read DESC
    fi

    if [[ ! -z $DESC ]] && [[ ! -z $TICKET_NUMBER ]] && [[ ! -z $BRANCH_TYPE ]]; then
        git checkout -b $1/$TICKET_NUMBER$DESC
    fi

fi

