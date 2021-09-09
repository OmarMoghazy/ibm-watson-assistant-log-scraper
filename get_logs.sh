#!/bin/bash
# script to get the logs from ibm watson assistant analytics

# read the variables
source config.sh

echo API Key: $API_KEY
echo URL: $URL
echo Skill ID: $SKILL_ID
echo API Version: $API_VERSION
echo Page Limit: $PAGE_LIMIT
echo

# get the log file
curl -u "apikey:$API_KEY" "$URL/v1/workspaces/$SKILL_ID/logs?version=$API_VERSION&page_limit=$PAGE_LIMIT" > ./chatbot_logs.txt
echo
echo Chatbot logs have been  exported to chatbot_logs.txt
