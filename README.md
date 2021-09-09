# IBM Watson Assistant Lite Log Scraper
A script to get the chatbot logs from Watson Assistant Lite analytics and parse them into a suitable representation. 

## Steps to use:
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
3. Add your values to the variables you defined in config.sh. More information on what these variables represent and how to obtain them can be found [here](https://cloud.ibm.com/apidocs/assistant-v1#listlogs)
4. Run `get_logs.sh`. Your chatbot logs will be saved to `chatbot_logs.txt` in the same directory.
