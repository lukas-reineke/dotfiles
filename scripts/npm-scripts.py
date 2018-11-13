import json

with open('package.json') as package:
    data = json.load(package)['scripts']
    for key in data.keys():
        print(key)
