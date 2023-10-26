<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

# Table of Contents

- [Token](#token)
  - [Get token](#get-token)
    - [Endpoint: `POST /users/token`](#endpoint-post-userstoken)
      - [Body Schema](#body-schema)
      - [Variables](#variables)
    - [Response](#response)
      - [Response Fields](#response-fields)
    - [Python Code](#python-code)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Token

Token is required to access APIs.

## Get token

### Endpoint: `POST /users/token`

```c=
curl --location 'https://SERVER_URL/users/token' \
--header 'Content-Type: application/json' \
--data '{
    "audience": "AUDIENCE", 
    "grant_type": "client_credentials", 
    "client_id": "CLIENT_ID",
    "client_secret": "CLIENT_SECRET"
}'
```

#### Body Schema

Schema  | Description | Type | Required
------------- | ------------- | ------------- | -------------
audience | The intended consumer of the token. | string | Yes
grant_type | The method through which applications can gain access tokens. | string | Yes
client_id | The identifier for the client which is used for authentication. | string | Yes
client_secret | The secret belonging to the client. | string | Yes

#### Variables

Variable  | How to Get
------------- | -------------
SERVER_URL | Please ask LinkerVision.
AUDIENCE | Please ask LinkerVision.
CLIENT_ID | Please ask LinkerVision.
CLIENT_SECRET | Please ask LinkerVision.

### Response

```json
{
    "access_token": "ACCESS_TOKEN",
    "token_type": "Bearer"
}
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
access_token | will be used while invoking APIs | string

### Python Code

```python
import requests
response = requests.post(
    "https://SERVER_URL/users/token",
    json={
        "audience": "AUDIENCE",
        "grant_type": "client_credentials",
        "client_id": "CLIENT_ID",
        "client_secret": "CLIENT_SECRET"
    },
    timeout=10,
)
access_token = response.json()["access_token"]
```
