<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

# Table of Contents

- [Event](#event)
  - [Real-time Event (Subscription)](#real-time-event-subscription)
    - [Endpoint](#endpoint)
      - [Variables](#variables)
    - [Response](#response)
      - [Response Fields](#response-fields)
        - [detected_objects](#detected_objects)
    - [Python Code](#python-code)
  - [Event History](#event-history)
    - [Endpoint: `GET /events/history`](#endpoint-get-eventshistory)
      - [Query Parameters](#query-parameters)
      - [Variables](#variables-1)
    - [Response](#response-1)
      - [Response Fields](#response-fields-1)
        - [detected_objects](#detected_objects-1)
    - [Python Code](#python-code-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Event

## Real-time Event (Subscription)

This API provides real-time notifications for events detected by the AI using WebSocket. The events contain information about the detected objects and their associated confidence scores. Once connected, the WebSocket will send real-time events as they occur.

### Endpoint

```p=
ws://SERVER_URL/events/realtime/:task_id?token=ACCESS_TOKEN
```

#### Variables

Variable  | How to Get
------------- | -------------
SERVER_URL | Please ask LinkerVision.
ACCESS_TOKEN | Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md).

### Response

```json
{
  "task_id": 1,
  "event_id": 2001,
  "event_name": "vehicle_detected",
  "event_description": "A vehicle was detected.",
  "timestamp": "2023-03-13T04:02:42Z",
  "image_url": "https://example.com/event_images/1.jpg",
  "video_url": "https://example.com/event_videos/1.mp4"
  "detected_objects": [
    {
      "object_id": "101",
      "object_name": "car",
      "coordinates": [0.1, 0.2, 0.3, 0.4],
      "confidence_score": 0.8
      "warning": true
    }
  ]
}
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
task_id | The task ID related to the event. | integer
event_id | The unique identifier for the event. | integer
event_name | The name of the event. | string
event_description | A brief description of the event. | string
timestamp | The timestamp when the event occurred. | string
image_url | The URL of the event's image snapshot. Need to add **ACCESS_TOKEN** to get the image, e.g., [https://SERVERL_URL/event_images/1.jpg?auth_token=**ACCESS_TOKEN**](https://) | string
video_url | The URL of the event's video clip. Need to add **ACCESS_TOKEN** to get the video, e.g., [https://SERVER_URL/event_videos/1.jpg?auth_token=**ACCESS_TOKEN**](https://) | string
detected_objects | An array of detected object information, including object_id, object_name, coordinates, confidence_score, and warning. Details are listed below. | array

##### detected_objects

Field  | Description | Type
------------- | ------------- | -------------
object_id | The object ID. | string
object_name | The object name. | string
coordinates | The bbox is normalized as **\[cx, cy, w, h\]**. Need to multiply the display image width and height if wanting to draw on the image. | array
confidence_score | The confidence score between 0~1 | float
warning | The object is in warning state or not | boolean

### Python Code

```python
from websockets.sync.client import connect

with connect("ws://SERVER_URL/events/realtime/1?token=ACCESS_TOKEN") as websocket:
    while True:
        message = websocket.recv()
        if message:
            print(f"Received: {message}")
```

## Event History

The Event History API allows users to query past events detected by the AI detection system for a specific task. Users can filter the events based on a time range and event name, enabling them to analyze and review historical data efficiently.

### Endpoint: `GET /events/history`

```p=
curl --location 'http://SERVER_URL/events/history' \
--header 'Authorization: Bearer ACCESS_TOKEN'
```

#### Query Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
start_time | Start time of the time range in ISO 8601 format (e.g., **2023-03-01T00:00:00**). | time | No
end_time | End time of the time range in ISO 8601 format (e.g., **2023-03-28T23:59:59**). | time | No
event_name | Filter by event name (e.g., **vehicle_detected**). | string | No
task_id | Filter by task ID. | integer | No
limit | The maximum number of query results. (default: 100) | integer | No
offset | The starting position of the query results.  (default: 0)| integer | No

#### Variables

Variable  | How to Get
------------- | -------------
SERVER_URL | Please ask LinkerVision.
ACCESS_TOKEN | Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md).

### Response

```json
[
    {
      "task_id": 1,
      "event_id": 1,
      "event_name": "vehicle_detected",
      "event_description": "A vehicle was detected.",
      "timestamp": "2023-06-13T04:02:42Z",
      "image_url": "https://example.com/event_images/1.jpg",
      "video_url": "https://example.com/event_videos/1.mp4",
      "detected_objects": [
        {
          "object_id": "101",
          "object_name": "car",
          "coordinates": [0.1, 0.2, 0.3, 0.4],
          "confidence_score": 0.8,
          "warning": false
        }
      ]
    }
]
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
task_id | The task ID related to the event. | integer
event_id | The unique identifier for the event. | integer
event_name | The name of the event. | string
event_description | A brief description of the event. | string
timestamp | The timestamp when the event occurred. | string
image_url | The URL of the event's image snapshot. Need to add **ACCESS_TOKEN** to get the image, e.g., [https://SERVERL_URL/event_images/1.jpg?auth_token=**ACCESS_TOKEN**](https://) | string
video_url | The URL of the event's video clip. Need to add **ACCESS_TOKEN** to get the video, e.g., [https://SERVER_URL/event_videos/1.jpg?auth_token=**ACCESS_TOKEN**](https://) | string
detected_objects | An array of detected object information, including object_id, object_name, coordinates, confidence_score, and warning. Details are listed below. | array

##### detected_objects

Field  | Description | Type
------------- | ------------- | -------------
object_id | The object ID. | string
object_name | The object name. | string
coordinates | The bbox is normalized as **\[cx, cy, w, h\]**. Need to multiply the display image width and height if wanting to draw on the image. | array
confidence_score | The confidence score between 0~1 | float
warning | The object is in warning state or not | boolean

### Python Code

```python
import requests

response = requests.get(
    "https://SERVER_URL/events/history",
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```
