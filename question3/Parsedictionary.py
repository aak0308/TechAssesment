nested_dict = {"a": {"b": {"c": "d"}}}
key = "c"

def parse_dict(nested_dict, key):
    data = ''
    for k, v in nested_dict.items():
        if k == key:
            data = nested_dict[key]
        elif isinstance(v, dict) and k != key:
            parse_dict(v, key)  # Recursive call on the nested dictionary
        else:
            print(f"Key: {k}, Value: {v}")  # Or do something else with the non-dictionary value
        print(data)
        return data

output = parse_dict(nested_dict, key)
print(output)
