#!/bin/bash
# script to get the logs from ibm watson assistant analytics

# read the variables
source config.sh

function usage {
	echo "Usage: ./get_logs.sh [-a <api key>] [-u <url>] [-s <skill id>] [-v <api version>] [-p <page limit>]"
	echo "	-a <api key>, --api-key <api key>		The API key for the IBM Watson Assistant Service. Get this from the IBM Watson Assistant service instance on IBM Cloud."
	echo "	-u <url>, --url <url>				The URL for the IBM Watson Assistant Service. Get this from the IBM Watson Assistant service instance on IBM Cloud."
	echo "	-s <skill id>, --skill-id <skill id>		The skill ID is a unique identifier for the dialog skill used for the chatbot. It can be obtained from within watson assistant on IBM Cloud"
	echo "	-v <api version>, --api-version	<api version>	The date of the api version used to get the logs"
	echo "	-p <page limit>, --page-limit <page limit>	The maximum number of log entries to retrieve in one request"
}

while [ "${1:-}" != "" ]; do
    case "$1" in
      "-a" | "--api-key")
       	shift
	API_KEY=$1
        ;;
	"-u" | "--url")
        shift
        URL=$1
        ;;
	"-s" | "--skill-id")
        shift
        SKILL_ID=$1
        ;;
	"-v" | "--api-version")
        shift
        API_VERSION=$1
        ;;
	"-p" | "--page-limit")
        shift
        PAGE_LIMIT=$1
        ;;
    esac
    shift
  done

echo API Key: $API_KEY
echo URL: $URL
echo Skill ID: $SKILL_ID
echo API Version: $API_VERSION
echo Page Limit: $PAGE_LIMIT

if [[ -z "$API_KEY" || -z "$URL" || -z "$SKILL_ID" || -z "$API_VERSION" || -z "$PAGE_LIMIT" ]]
then
	echo "Missing argument(s). Please add them to the config.sh file or pass them in as command line options."
	echo
	usage
else
	echo # get the log file
	curl -u "apikey:$API_KEY" "$URL/v1/workspaces/$SKILL_ID/logs?version=$API_VERSION&page_limit=$PAGE_LIMIT" > ./chatbot_logs.txt
fi
