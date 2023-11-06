<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

# Table of Contents

- [Organization](#organization)
  - [Get Organization List](#get-organization-list)
    - [Endpoint: `GET /organizations`](#endpoint-get-organizations)
      - [Query Parameters](#query-parameters)
      - [Variables](#variables)
    - [Response](#response)
      - [Response Fields](#response-fields)
    - [Python Code](#python-code)
  - [Get Organization Details](#get-organization-details)
    - [Endpoint: `GET /organizations/:organization_id`](#endpoint-get-organizationsorganization_id)
      - [Query Parameters](#query-parameters-1)
    - [Response](#response-1)
      - [Response Fields](#response-fields-1)
    - [Python Code](#python-code-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Organization

## Get Organization List

This API retrieves the list of organizations along with their basic information, such as organization name and the organization they belong to.

### Endpoint: `GET /organizations`

```p=
curl --location 'http://SERVER_URL/organizations' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
limit | The maximum number of results per page. (default 100) | integer | No
offset | The offset for pagination. (default 0) | integer | No

#### Variables

Variable  | How to Get
------------- | -------------
SERVER_URL | Please ask LinkerVision.
ACCESS_TOKEN | Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md).

### Response

```json
[
    {
      "id": 1,
      "name": "Organization 1",
      "belongs_to": 0
    },
    {
      "id": 2,
      "name": "Organization 2",
      "belongs_to": 1
    }
]
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the organization. | integer
name | The name of the organization. | string
belongs_to | The ID of the organization this organization belongs to. | integer

### Python Code

```python
import requests

response = requests.get(
    "https://SERVER_URL/organizations?offset=0&limit=10",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```

## Get Organization Details

This API retrieves the details of a specific organization by organization ID, including organization name and the organization it belongs to.

### Endpoint: `GET /organizations/:organization_id`

```p=
curl --location 'http://SERVER_URL/organizations/1' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
organization_id | The unique identifier for the organization. | integer | Yes

### Response

```json
{
  "id": 1,
  "name": "Organization 1",
  "belongs_to": 0
}
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
organization_id | The unique identifier for the organization. | integer
organization_name | The name of the organization. | string
belongs_to | The ID of the organization this organization belongs to. | integer

### Python Code

```python
import requests

response = requests.get(
    "https://SERVER_URL/organizations/1",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```
