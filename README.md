Dear Reviewer,
please keep in consideration that I'm still enhancing the project, and as an entry level in backend this is my second rails project and the first working with just APIs ,Jobs, elastic search and Redis, I enjoyed working on it and I hope you find it good.

Thank you.

## Two Important notes:
- All main requirements are done including elastic search endpoint, except that it was working fine then stopped working bec it couldnt find the index without me changing the logic and I investigated the issue for a whole day but finally I had to submit the task.

-Chat job is working successfully (enqued and processed)and the message job works but only enque the requests without being processed, I'm still investigating both issues.

-If you want to check the msg creation without the job, Just uncomment lines 23,24,25 and comment 26,27 in message controller.

## Starting Services
```bash
sudo docker-compose down && sudo docker-compose build && sudo docker-compose up
```
```
Make sure that `docker` and `docker-compose` are installed with `dockerd` running, also make sure that ports `3000` and ports `9200` are available for the services to run on.

## Using Services

### Chatty exposes these endpoints for operating on applications, chats and messages.

```
Verb  URI Pattern
----  -----------

GET   /applications/
POST  /applications?name={name}
GET   /applications/{access_token}
PUT   /applications/{access_token}?name={name}

GET   /applications/{access_token}/chats
GET   /applications/{access_token}/chats/{chat_number}

GET   /applications/{access_token}/chats/{chat_number}/messages
GET   /applications/{access_token}/chats/{chat_number}/messages/{message_number}
GET   /applications/{access_token}/chats/{chat_number}/messages/search?keyword={keyword}
PUT   /applications/{access_token}/chats/{chat_number}/messages/{message_number}?body={message_body}
```
#### Examples

### Creating a new application
```bash
$ curl -X POST 'http://localhost:3000/applications?name=Telegram'

# output
{
  "name": "Telegram",
  "access_token": "zXzp6np93DQAa4jmk6SqKWeu",
  "created_at": "2022-01-30T04:38:16.630Z",
  "updated_at": "2022-01-30T04:38:16.630Z",
  "chat_count": 1
}
```
### Chat/Message Creation API 
This service handles creation of chats and messages.

```
Verb  URI Pattern
----  -----------

POST  /applications/{access_token}/chats/
POST  /applications/{access_token}/chats/{chat_number}/messages?body={message_body}
```
#### Examples
##### Creating a new chat
```bash
$ curl -X POST 'http://localhost:3000/applications/zXzp6np93DQAa4jmk6SqKWeu/chats'

# output
{
  "id": 1,
  "application_id": 4,
}
```

##### Sending a new message
```bash
$ curl --data '{"content": "Heeey, I'm your fav duck"}' -X POST 'http://localhost:3000/applications/Bg9S4iusyPTeaPm5xM3hkg3F/chats/1/messages'

# output
{ 
  "chat_id":1,
 }
##### Getting messages
```bash
$ curl -X GET 'http://localhost:3000/applications/FCuMz1uF6Heyvtdwxo2MXYSu/chats/1/messages'

# output
[
  {
    "number": 1,
    "content":"ducks kteeer"
    "created_at": "2022-1-11T19:18:50.279Z",
    "updated_at": "2022-1-11T19:18:50.279Z"
  }
]

```
##### Searching chats
```bash
$ curl -X GET 'http://localhost:3000/applications/fPrv7vr57dkUsP4KfZ4BdSmt/chats/1/messages/search?keyword=duc'

# output
[
  {
    "number": 1,
    "body": "ducks kteer",
    "created_at": "2022-1-11T19:18:52.351Z",
    "updated_at": "2022-1-11T19:18:52.351Z"
  }
]
```


 ```
 
 

