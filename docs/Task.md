
### Task (R)
#### **Get Task List**
This API retrieves a list of tasks with their relevant information, including task name, location ID, camera ID, camera RTSP, task status, task scheduler, and the task events (using IDs).

##### Endpoint: `GET /tasks`
##### Parameters:
	                    
Parameter  | Description | Type | Required
------------- | ------------- | ------------- | -------------
offset | Offset for pagination. (default 0) | integer | No
limit | Limit the number of results per page. (default 100) | integer | No
location_id | Filter tasks by location ID. (default all) | integer | No
camera_id | Filter tasks by camera ID. (default all) | integer | No
                    
##### Example Request:
`GET /tasks?offset=0&limit=10`
##### Response:
```
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
##### Response Fields:
Field  | Description | Type
------------- | ------------- | -------------
id | The unique identifier for the task. | integer
name | The name of the task. | string
scheduler | The task scheduler configuration (24/7, daily, weekly). | string
events | An array of event IDs related to this task. | array
location_id | The ID of the location where the task is taking place. | integer
camera_id | The ID of the camera used for the task. | integer
camera_rtsp | The RTSP URL of the camera. | string
status | The status of the task: `operating, normal`, `operating, slow`, `operating, disconnected`, `non-operating, paused`, `non-operating, terminated`, `non-operating, scheduled`, `non-operating, finished`, `video`
##### Python Code:
```
import requests
response = requests.get(
    f"https://{SERVER_URL}/tasks?offset=0&limit=10",
    headers={"Authorization": f"Bearer {ACCESS_TOKEN}"},
    timeout=10,
)
response_json = response.json()
```