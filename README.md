# IBM Watson Assistant Lite Log Scraper
A script to get the chatbot logs from Watson Assistant Lite analytics and parse them into a suitable representation. 

For help with the `get_logs.sh` script, do `./get_logs.sh -h`. 

## Steps:
1. Create `config.sh` in the same directory as `get_logs.sh`
2. Copy the below template for `config.sh`:
```
#!/bin/bash
API_KEY=
URL=
SKILL_ID=
API_VERSION=
PAGE_LIMIT=
```
3. Add your credentials to the variables you defined in config.sh. More information on what these variables represent and how to obtain them can be found [here](https://cloud.ibm.com/apidocs/assistant-v1#listlogs)
4. Run `get_logs.sh`. Your chatbot logs will be saved to `chatbot_logs.txt` in the same directory.
5. Optionally, you can supply some or all of the credentials as command line options. Check the associated flags below with more explanation for the credentials. 

* `-a` or `--api-key`: The API key for your Watson Assistant Service Instance.
* `-u` or `--url`: The URL for your Watson Assistant Service Instance.
* `-s` or `--skill-id`: The Skill ID for the dialog skill you would like to get the logs for.
* `-v` or `--api-version`: The release date in `yyyy-mm-dd` format of the API version you would like to use. The latest version is `2021-06-14`.
* `-p` or `--page-limit`: The maximum number of log entries to return in the results.

The output of `get_logs.sh` will be saved to `chatbot_logs.txt` in the same directory, and another copy will be saved to the `logs` directory titles `logs_YYYY-mm-dd.txt`. The `chatbot_logs.txt` file will be overwritten every time this script is run and is used to store the logs to be used in the python log scraping script.

A csv file titled `output_YYY-mm-dd.csv` will be saved to the `csv` directory.

The generated csv file for each run contains the following fields for every entry (representing an API call to the chatbot):
* `request_txt`: The input text supplied to the chatbot by the user.
* `conversation_id`: A unique number for every "conversation" that a user has with the chatbot. A conversation can hold multiple API calls.
* `responses`: The responses that the chatbot replies with to the user.
* `intents`: The detected intents and the confidence level for each of them.
* `entities`: The detected entities, their values and the confidence level for each of them.
