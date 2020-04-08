import json
import os.path

if not os.path.isfile("package.json"):
    exit(1)

with open("package.json") as package:
    data = json.load(package)["scripts"]
    for key in data.keys():
        print(key)
