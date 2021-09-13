import json
import pandas as pd

with open('./chatbot_logs.txt') as f:
  data = json.load(f)

df = pd.DataFrame(columns=['request_txt', 'conversation_id', 'request_timestamp', 'responses', 'intents', 'entities'])

count = 0
for i, entry in zip(range(len(data['logs'])), data['logs']):
    request_txt = (entry['request']['input']['text']).encode('utf-8') 
    conversation_id = (entry['request']['context']['conversation_id']).encode('utf-8')
    request_timestamp = (entry['request_timestamp']).encode('utf-8')
    responses = (entry['response']['output']['text'])
    intents = entry['response']['intents']
    entities = entry['response']['entities']

    df.loc[i] = {'request_txt':request_txt, 'conversation_id':conversation_id, 'request_timestamp':request_timestamp, 'responses':responses, 'intents':intents, 'entities': entities}

    count += 1
df.to_csv('output.csv')
