<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Token](#token)
  - [Get token](#get-token)
    - [Endpoint: `POST /users/token`](#endpoint-post-userstoken)
    - [Response](#response)
    - [Python Code](#python-code)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Token

Token is required to access APIs.

## Get token

### Endpoint: `POST /users/token`

```json
{
	"audience": AUDIENCE,
	"grant_type": "client_credentials",
	"client_id": CLIENT_ID,
	"client_secret": CLIENT_SECRET
}
```

Variables

- **AUDIENCE**: Please ask LinkerVision
- **CLIENT_ID**: Please ask LinkerVision
- **CLIENT_SECRET**: Please ask LinkerVision

### Response

```json
{
    "access_token": ACCESS_TOKEN,
    "token_type": "Bearer"
}
```

Variables

- **ACCESS_TOKEN**: will be used while invoking APIs

### Python Code

```python
import requests
response = requests.post(
    https://SERVER_URL/users/token,
    json={
        "audience": AUDIENCE, 
        "grant_type": "client_credentials", 
        "client_id": CLIENT_ID,
        "client_secret": CLIENT_SECRET
    },
    timeout=10,
)
access_token = response.json()["access_token"]
```

Variables

- **SERVER_URL**: Please ask LinkerVision
