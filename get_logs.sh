#!/bin/bash
# script to get the logs from ibm watson assistant analytics

# read the variables
source config.sh

function usage {
	echo "Usage: ./get_logs.sh [-a <api key>] [-u <url>] [-s <skill id>] [-v <api version>] [-p <page limit>]"
	echo "	-a <api key>, --api-key <api key>		The API key for the IBM Watson Assistant Service.
							Get this from the IBM Watson Assistant service
						       	instance on IBM Cloud."
	echo "	-u <url>, --url <url>				The URL for the IBM Watson Assistant Service. 
							Get this from the IBM Watson Assistant service
						       	instance on IBM Cloud."
	echo "	-s <skill id>, --skill-id <skill id>		The skill ID is a unique identifier for the dialog
       							skill used for the chatbot.
							It can be obtained from within Watson Assistant on 
							IBM Cloud on the dialog skill you want to use."
	echo "	-v <api version>, --api-version	<api version>	Release date of the API version you want to use.
							Specify dates in YYYY-MM-DD format. The current
						       	version	is 2021-06-14."
	echo "	-p <page limit>, --page-limit <page limit>	The maximum number of log entries to return in
       							the results."
	echo "	-h <page limit>, --help				Display the help message."
}

function help {
	echo "This tool gets the logs from IBM Watson Assistant analytics for the past 7 days.This requires five
credentials: The API key, the Watson Assistant URL, the dialog skill ID, the API version release date and
the page limit."
	echo
	usage
	exit 1
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
	"-h" | "--help")
        shift
        help
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
	today=$(date +"%Y-%m-%d")
	curl -u "apikey:$API_KEY" "$URL/v1/workspaces/$SKILL_ID/logs?version=$API_VERSION&page_limit=$PAGE_LIMIT" > "./logs/logs_${today}.txt" > ./chatbot_logs.txt
fi
