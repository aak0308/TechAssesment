import base64
import json
import re
import subprocess
import requests
import sys

imds_server_base_url = "http://169.254.169.254"

instance_api_version = "2021-02-01"
instance_endpoint = imds_server_base_url + \
    "/metadata/instance?api-version=" + instance_api_version

# Proxies must be bypassed when calling Azure IMDS
proxies = {
    "http": None,
    "https": None
}

def api_call(endpoint):
    headers = {'Metadata': 'True'}
    json_obj = requests.get(endpoint, headers=headers, proxies=proxies).json()
    return json_obj

def main():
    args = sys.argv[1:]
    # Instance provider API call
    instance_json = api_call(instance_endpoint)
    print("Instance provider data:")
    pretty_print_json_obj_to_terminal(instance_json)
    if len(args) > 0:
        for x in args:
            get_json_element(x, instance_json)


def get_json_element(element, instance_json):
    dict_json = json.loads(instance_json)
    for k in dict_json.keys():
        if k in dict_json and dict_json['compute'][k] is not None:
            print(k)
        elif k in dict_json and dict_json['network'][k] is not None:
            print(k)
        else:
            print("no data found for the element")
    return k


def pretty_print_json_obj_to_terminal(json_obj):
    print(json.dumps(json_obj, sort_keys=True, indent=4, separators=(',', ': ')))

if __name__ == "__main__":
    main()