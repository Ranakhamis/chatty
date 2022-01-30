Dear Reviewer,
please keep in consideration that I'm still working on enhancing the project.
The chat and message jobs are almost done and I'm working on it, also the messages content is set in the creation action in controller but I'll change it.

It would be nice to postpone reviewing my repo as much as you can, or re-review it if possible, otherwise all the main functionalities including elastic search are done.

Thank you.


# chatty
Chatting API application in Ruby on Rails

## Overview
- Chat API (Rails): Main service which provides most of the core management operations (create, get) of applications, chats, and messages, also supports searching through messages in chats using `elasticsearch`.

## Starting Services
sudo docker-compose down && sudo docker-compose build && sudo docker-compose up
```
Make sure that `docker` and `docker-compose` are installed with `dockerd` running, also make sure that ports `3000` and ports `8080` are available for the services to run on.

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
$ curl -X POST 'http://localhost:3000/applications/FCuMz1uF6Heyvtdwxo2MXYSu/chats/1/messages'

# output
{
  "id":1,
  "chat_id":1,
  "message_id":1,
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
 
 

