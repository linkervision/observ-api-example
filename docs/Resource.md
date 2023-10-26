<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

# Table of Contents

- [Camera](#camera)
  - [Get Camera List](#get-camera-list)
    - [Endpoint: `GET /cameras`](#endpoint-get-cameras)
      - [Query Parameters](#query-parameters)
      - [Variables](#variables)
    - [Response](#response)
      - [Response Fields](#response-fields)
    - [Python Code](#python-code)
  - [Get Camera Details](#get-camera-details)
    - [Endpoint: `GET /cameras/:camera_id`](#endpoint-get-camerascamera_id)
      - [Query Parameters](#query-parameters-1)
      - [Variables](#variables-1)
    - [Response](#response-1)
      - [Response Fields](#response-fields-1)
    - [Python Code](#python-code-1)
- [Location](#location)
  - [Get Location List](#get-location-list)
    - [Endpoint: `GET /locations`](#endpoint-get-locations)
      - [Query Parameters](#query-parameters-2)
      - [Variables](#variables-2)
    - [Response](#response-2)
      - [Response Fields](#response-fields-2)
    - [Python Code](#python-code-2)
  - [Get Location Details](#get-location-details)
    - [Endpoint: `GET /locations/:location_id`](#endpoint-get-locationslocation_id)
      - [Query Parameters](#query-parameters-3)
      - [Variables](#variables-3)
    - [Response](#response-3)
      - [Response Fields](#response-fields-3)
    - [Python Code](#python-code-3)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Camera

## Get Camera List

This API retrieves a list of cameras, including the camera ID, camera name, location ID, and camera RTSP.

### Endpoint: `GET /cameras`

```p=
curl --location 'http://SERVER_URL/cameras' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
limit | Limit the number of results per page. (default 100) | integer | No
offset | Offset for pagination. (default 0) | integer | No

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
      "name": "Camera 1",
      "location_id": 1,
      "rtsp": "rtsp://example.com/camera1",
      "model_name": ""
    },
    {
      "id": 2,
      "name": "Camera 2",
      "location_id": 2,
      "rtsp": "rtsp://example.com/camera2",
      "model_name": ""
    }
]
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the camera. | integer
name | The name of the camera. | string
location_id | The ID of the location of the camera. | integer
rtsp | The RTSP stream URL of the camera. | string
model_name | The model name of the camera. | string

### Python Code

```python
import requests

response = requests.get(
    "https://SERVER_URL/cameras?limit=2&offset=0",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```

## Get Camera Details

This API retrieves the details of a specific camera, including the camera ID, camera name, location ID, and camera RTSP.

### Endpoint: `GET /cameras/:camera_id`

```p=
curl --location 'http://SERVER_URL/cameras/1' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
camera_id | The unique identifier for the camera. | integer | Yes

#### Variables

Variable  | How to Get
------------- | -------------
SERVER_URL | Please ask LinkerVision
ACCESS_TOKEN | Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md).

### Response

```json
{
    "id": 1,
    "name": "Camera 1",
    "location_id": 1,
    "rtsp": "rtsp://example.com/camera1",
    "model_name": ""
}
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the camera. | integer
name | The name of the camera. | string
location_id | The ID of the location of the camera. | integer
rtsp | The RTSP stream URL of the camera. | string
model_name | The model name of the camera. | string

### Python Code

```python
import requests

response = requests.get(
    "https://SERVER_URL/cameras/1",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```

# Location

## Get Location List

This API retrieves a list of locations, including the location ID, location name, organization ID, coordinates, and timezone. You can also filter the results by specifying an organization ID.

### Endpoint: `GET /locations`

```p=
curl --location 'http://SERVER_URL/locations' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
organization_id | Filter the locations based on organization ID. | integer | No
limit | The maximum number of locations returned. (default 100) | integer | No
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
      "name": "Location 1",
      "timezone": "America/New_York",
      "organization_id": 1,
      "coordinates": {
        "latitude": 40.712776,
        "longitude": -74.005974
      }
    },
    {
      "id": 2,
      "name": "Location 2",
      "timezone": "America/Los_Angeles",
      "organization_id": 1
      "coordinates": {
        "latitude": 37.774929,
        "longitude": -122.419418
      }
    }
]
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the location. | integer
name | The name of the location. | string
timezone | The timezone of the location. | string
organization_id | The ID of the organization the location belongs to. | integer
coordinates | The latitude and longitude of the location. | object

### Python Code

```python
import requests

response = requests.get(
        "https://SERVER_URL/locations?organization_id=1&offset=0&limit=10",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()

```

## Get Location Details

This API retrieves the details of a specific location by location ID, including location name, organization ID, coordinates, timezone.

### Endpoint: `GET /locations/:location_id`

```p=
curl --location 'http://SERVER_URL/locations/1' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
location_id | The unique identifier for the location. | integer | Yes

#### Variables

Variable  | How to Get
------------- | -------------
SERVER_URL | Please ask LinkerVision.
ACCESS_TOKEN | Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md).

### Response

```json
{
  "id": 1,
  "name": "Location 1",
  "timezone": "America/New_York",
  "organization_id": 1,
  "coordinates": {
    "latitude": 40.712776,
    "longitude": -74.005974
  }  
}
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the location. | integer
name | The name of the location. | string
timezone | The timezone of the location. | string
organization_id | The ID of the organization the location belongs to. | integer
coordinates | The latitude and longitude of the location. | object

### Python Code

```python
import requests

response = requests.get(
    "https://SERVER_URL/locations/1",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```
