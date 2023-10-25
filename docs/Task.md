<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Task](#task)
  - [Get Task List](#get-task-list)
    - [Endpoint: `GET /tasks`](#endpoint-get-tasks)
      - [Parameters](#parameters)
      - [Example Request](#example-request)
    - [Response](#response)
      - [Response Fields](#response-fields)
    - [Python Code](#python-code)
  - [Get Task Detail](#get-task-detail)
    - [Endpoint: `GET /tasks/:task_id`](#endpoint-get-taskstask_id)
      - [Example Request](#example-request-1)
    - [Response](#response-1)
      - [Response Fields](#response-fields-1)
    - [Python Code](#python-code-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Task

## Get Task List

This API retrieves a list of tasks with their relevant information, including task name, location ID, camera ID, camera RTSP, task status, task scheduler, and the task events (using IDs).

### Endpoint: `GET /tasks`

#### Parameters

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
offset | Offset for pagination. (default 0) | integer | No
limit | Limit the number of results per page. (default 100) | integer | No
location_id | Filter tasks by location ID. (default all) | integer | No
camera_id | Filter tasks by camera ID. (default all) | integer | No

#### Example Request

`GET /tasks?offset=0&limit=10`

### Response

```json
[
    {
      "id": 1,
      "name": "Task 1",
      "status": "operating, normal",
      "scheduler": "24/7",
      "events": [1, 2, 3],
      "location_id": 1,
      "camera_id": 1,
      "camera_rtsp": "rtsp://192.168.1.2:8554/stream1",
    },
    {
      "id": 2,
      "name": "Task 2",
      "status": "operating, normal",
      "scheduler": "daily",
      "events": [4, 5, 6]
      "location_id": 2,
      "camera_id": 2,
      "camera_rtsp": "rtsp://192.168.1.3:8554/stream2",
    }
]
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the task. | integer
name | The name of the task. | string
scheduler | The task scheduler configuration (24/7, daily, weekly). | string
events | An array of event IDs related to this task. | array
location_id | The ID of the location where the task is taking place. | integer
camera_id | The ID of the camera used for the task. | integer
camera_rtsp | The RTSP URL of the camera. | string
status | The status of the task. | TaskStatus

TaskStatus

- `operating, normal`
- `operating, slow`
- `operating, disconnected`
- `non-operating, paused`
- `non-operating, terminated`
- `non-operating, scheduled`
- `non-operating, finished`
- `video`

### Python Code

```python
import requests
response = requests.get(
    https://SERVER_URL/tasks?offset=0&limit=10,
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)
response_json = response.json()
```

Variables

- **SERVER_URL**: Please ask LinkerVision
- **ACCESS_TOKEN**: Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md)

## Get Task Detail

This API retrieves detailed information about a specific task, including the task name, location ID, camera ID, camera RTSP, task status, task scheduler, events, confidence threshold, and object size filter.

### Endpoint: `GET /tasks/:task_id`

Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
task_id | The unique identifier for the task. | integer | Yes

#### Example Request

`GET /tasks/1`

### Response

```json
{
  "id": 1,
  "name": "Vehicle Detection Task",
  "status": "operating, normal",
  "scheduler": {
    "type": "daily",
    "interval": 2,
    "start_time": "08:00",
    "end_time": "20:00"
  },
  "events": [
    {
      "id": 1,
      "name": "vehicle_detected",
      "detecting_duration": 1,
      "detecting_threshold": 0.5,
      "interval": 10,
      "zones": [
        {
          "id": 1,
          "geometry": {
            "type": "MultiPolygon",
            "coordinates":[
              [
                [
                  [
                    0.048840048840049,
                    0.507462686567164
                  ],
                  [
                    0.148962148962149,
                    0.735607675906183
                  ],
                  [
                    0.700854700854701,
                    0.842217484008529
                  ],
                  [
                    0.921855921855922,
                    0.801705756929638
                  ],
                  [
                    0.963369963369963,
                    0.767590618336887
                  ],
                  [
                    0.992673992673993,
                    0.562899786780384
                  ],
                  [
                    0.970695970695971,
                    0.44136460554371
                  ],
                  [
                    0.919413919413919,
                    0.383795309168444
                  ],
                  [
                    0.746031746031746,
                    0.375266524520256
                  ],
                  [
                    0.042735042735043,
                    0.38592750533049
                  ],
                  [
                    0.048840048840049,
                    0.507462686567164
                  ]
                ]
              ]
            ]
          }
        }
      ]
    }
  ],
  "location_id": 1,
  "camera_id": 1,
  "camera_rtsp": "rtsp://example.com:554/1",
  "confidence_threshold": {
    "car": 0.5,
    "truck": 0.3
  },
  "object_size_filter": {
    "car": [0.1, 0.2, 0, 1],
    "truck": [0.5, 0.5, 0.5, 0.5]
  }
}
```

#### Response Fields

Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the task. | integer
name | The name of the task. | string
scheduler | The task scheduler configuration (type, interval, start_time, end_time). | object
events | An array of event objects related to the task. | array
location_id | The ID of the location where the task is taking place. | integer
camera_id | The ID of the camera used for the task. | integer
camera_rtsp | The RTSP stream URL of the camera. | string
confidence_threshold | The confidence threshold for each detected object. | object
object_size_filter | The size filter for each detected object. | object
status | The status of the task. | string

TaskStatus

- `operating, normal`
- `operating, slow`
- `operating, disconnected`
- `non-operating, paused`
- `non-operating, terminated`
- `non-operating, scheduled`
- `non-operating, finished`
- `video`

### Python Code

```python
import requests

response = requests.get(
    https://SERVER_URL/tasks/1,
    headers={"Authorization": "Bearer ACCESS_TOKEN"},
    timeout=10,
)

response_json = response.json()
```

Variables

- **SERVER_URL**: Please ask LinkerVision
- **ACCESS_TOKEN**: Please refer to [Token page](https://github.com/linkervision/observ-api-example/blob/main/docs/Token.md)
