### Token

- Token is required to access APIs.

### Get token
                
- Endpoint: **POST /users/token**
```
{
	"audience": "https://staging.observ.linkervision.ai/", 
	"grant_type": "client_credentials", 
	"client_id": CLIENT_ID,
	"client_secret": CLIENT_SECRET
}
```
- Response:
```
{
    "access_token": ACCESS_TOKEN,
    "token_type": "Bearer"
}
```
- Python Code:
```
import requests
response = requests.post(
    f"https://{SERVER_URL}/users/token",
    json={
        "audience": "https://staging.observ.linkervision.ai/", 
        "grant_type": "client_credentials", 
        "client_id": CLIENT_ID,
        "client_secret": CLIENT_SECRET
    },
    timeout=10,
)
access_token = response.json()["access_token"]
```
                
