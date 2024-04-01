import requests
import json


def main():
    url = "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=fVyPdu4rDO188KetCjUewzjS&client_secret=FqrPV6yQ7y8s2FVaTvzsTmLsMNG7Ftg5"

    payload = ""
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)

    print(response.text)


if __name__ == '__main__':
    main()