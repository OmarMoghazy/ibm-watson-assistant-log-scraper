import json5
# a Python object (dict):
with open('./chatbot_logs.txt') as f:
  data = json5.load(f)

count = 0
for entry in data['logs']:
    print("\n\n\t\t ***** New Message of id: " + str(count) + " ***** \n")
    # requested message
    print("Requested message: ")
    print("\t" + str(entry['request']['input']['text']))
    # Conversation ID
    print("\nConversation ID: ")
    print("\t" + str(entry['request']['context']['conversation_id']))
    # Request timestamp
    print("\nRequest timestamp: ")
    print("\t" + str(entry['request_timestamp']))

    # Response text msg
    print("\nResponse text msg: ")
    print("\t" + str(entry['response']['output']['text']))


    # Intent
    print("\nDetected Intent: ")
    print("\t" + str(entry['response']['intents']))

    print("\nEntities: ")
    for entity in entry['response']['entities']:
        print("\tEntity: ")
        print("\t\t" + str(entity['entity']))
        print("\tValue: ")
        print("\t\t" + str(entity['value']))
        print("\tConfidence: ")
        print("\t\t" + str(entity['confidence']))

    count += 1