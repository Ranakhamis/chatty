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

##### Creating a new application
```bash
$ curl -X POST 'http://localhost:3000/applications?name=app'

# output
{
  "name": "Discord",
  "access_token": "fPrv7vr57dkUsP4KfZ4BdSmt",
  "created_at": "2022-1-11T19:14:51.589Z",
  "updated_at": "2022-1-11T19:14:51.589Z",
  "chat_count": 0
}
```

##### Getting messages
```bash
$ curl -X GET 'http://localhost:3000/applications/fPrv7vr57dkUsP4KfZ4BdSmt/chats/1/messages'

# output
[
  {
    "number": 1,
    "body": "Rails stuff",
    "created_at": "2022-1-11T19:18:50.279Z",
    "updated_at": "2019-1-11T19:18:50.279Z"
  },
  {
    "number": 2,
    "body": "Stuff with Rails and Go and stuff with some other stuff",
    "created_at": "2022-1-11T19:18:52.351Z",
    "updated_at": "2022-1-11T19:18:52.351Z"
  }
]

```
##### Searching chats
```bash
$ curl -X GET 'http://localhost:3000/applications/fPrv7vr57dkUsP4KfZ4BdSmt/chats/1/messages/search?keyword=Go'

# output
[
  {
    "number": 2,
    "body": "Stuff with Rails and Go and stuff with some other stuff",
    "created_at": "2022-1-11T19:18:52.351Z",
    "updated_at": "2022-1-11T19:18:52.351Z"
  }
]
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
$ curl -X POST 'http://localhost:8080/applications/fPrv7vr57dkUsP4KfZ4BdSmt/chats'

# output
{
  "number": 1,
  "access_token": "fPrv7vr57dkUsP4KfZ4BdSmt"
}
```

##### Sending a new message
```bash
$ curl --data '{"body": "Rails stuff"}' -X POST 'http://localhost:8080/applications/fPrv7vr57dkUsP4KfZ4BdSmt/chats/1/messages'

# output
{
  "number":1,
  "chat_number":1,
  "access_token":"fPrv7vr57dkUsP4KfZ4BdSmt"
 }
 ```
 
 

