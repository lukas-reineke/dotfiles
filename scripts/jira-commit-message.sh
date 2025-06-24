#!/bin/bash

TICKET="$1"

RESPONSE=$(curl -s -u "$JIRA_USER_EMAIL:$JIRA_USER_API_KEY" \
    -H "Accept: application/json" \
    "$JIRA_WORKSPACE_URL/rest/api/3/issue/$TICKET")

JIRA_TYPE=$(echo "$RESPONSE" | jq -r '.fields.issuetype.name')
TITLE=$(echo "$RESPONSE" | jq -r '.fields.summary')
DESCRIPTION=$(echo "$RESPONSE" | jq -r '
  .fields.description.content[]
  | select(.content != null)
  | .content[]
  | select(.type == "text")
  | .text' | sed '/^$/d')

case "$JIRA_TYPE" in
Story | Task) TYPE="feat" ;;
Bug) TYPE="fix" ;;
*) TYPE="misc" ;;
esac

echo "${TYPE}: ${TITLE}"
echo
echo "${DESCRIPTION}"
echo "${JIRA_WORKSPACE_URL}/browse/${TICKET}"
