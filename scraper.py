import json
# a Python object (dict):
with open('./chatbot_logs.txt') as f:
  data = json.load(f)

count = 0
for entry in data['logs']:
    print("\n\n\t\t ***** New Message of id: " + str(count) + " ***** \n")
    # requested message
    print("Requested message: ")
    print("\t" + (entry['request']['input']['text']).encode('utf-8'))
    # Conversation ID
    print("\nConversation ID: ")
    print("\t" + (entry['request']['context']['conversation_id']).encode('utf-8'))
    # Request timestamp
    print("\nRequest timestamp: ")
    print("\t" + (entry['request_timestamp']).encode('utf-8'))

    # Response text msg
    print("\nResponse text msg: ")
    print("\t" + str(entry['response']['output']['text']))

    # Intent
    print("\nDetected Intent: ")
    print("\t" + str(entry['response']['intents']))

    print("\nEntities: ")
    for entity in entry['response']['entities']:
        print("\tEntity: ")
        print("\t\t" + (entity['entity']).encode('utf-8'))
        print("\tValue: ")
        print("\t\t" + (entity['value']).encode('utf-8'))
        print("\tConfidence: ")
        print("\t\t" + str(entity['confidence']))

    count += 1
