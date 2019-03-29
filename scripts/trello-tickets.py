#!/usr/bin/env python

import json
import os
import re
import requests

board_id = os.environ.get("TRELLO_BOARD_ID")
url = f"https://api.trello.com/1/boards/{board_id}/cards/visible"

querystring = {
    "token": os.environ.get("TRELLO_TOKEN"),
    "key": os.environ.get("TRELLO_KEY"),
}

response = requests.request("GET", url, params=querystring)

for ticket in json.loads(response.text):
    if ticket["subscribed"]:
        id = ticket["idShort"]
        name = re.sub(r"[\"|'|,]", "", ticket["name"].replace(" ", "-"))
        print(f"{id} {name}")
