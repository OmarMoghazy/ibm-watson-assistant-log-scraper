# IBM Watson Assistant Lite Log Scraper
A script to get the chatbot logs from Watson Assistant Lite analytics and parse them into a suitable representation. 


## Part 1: Getting the raw log entries.

For help with the `get_logs.sh` script, do `./get_logs.sh -h`. 

### Steps:
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

The output of `get_logs.sh` will be saved to `chatbot_logs.txt` in the same directory.
