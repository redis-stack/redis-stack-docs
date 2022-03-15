---
title: "Redis OM for Node.js"
linkTitle: Node.js
description: Learn how to build with Redis Stack and Node.js
weight: 1
---

This tutorial will show you how to build an API using Node.js and Redis Stack.

We'll be using [Express](https://expressjs.com/) and [Redis OM](https://github.com/redis/redis-om-node) to do this. I’m assuming that you know a bit of Express as it's a pretty established framework. However, I’m not using Express in a particularly sophisticated way so a basic understanding is plenty. In fact, you’ll likely be fine even if you haven’t used it before. The part you're probably not familiar with is Redis OM, which is exactly what we’re here to cover!

The API we'll be building is a simple and relatively RESTful API that reads, writes, and finds data on persons—first name, last name, age, that sort of thing. And it'll do simple location tracking feature just for a little bit of extra interest.

But before we start with the coding, let's start with a description of what Redis OM *is*.


## Redis OM for Node.js

Redis OM (pronounced *REDiss OHM*) is a library that provides object mapping for Redis—that's what the OM stands for... *object mapping*. It maps Redis data types—specifically Hashes and JSON documents—to JavaScript objects. And it allows you to search over these Hashes and JSON documents. It uses RedisJSON and RediSearch to do this.

RedisJSON and RediSearch are two of the several modules included in Redis Stack. Modules are extensions to Redis that add new data types and new commands. RedisJSON adds a JSON document data type and the commands to manipulate it. RediSearch adds various search commands to index the contents of JSON documents and Hashes.

Redis OM comes in *four* different versions. We'll be working with Redis OM for Node.js in this tutorial, but there are also flavors and tutorials for [Python](stack-python), [.NET](stack-dot-net), and [Spring](stack-spring).

This tutorial will get you started with Redis OM for Node.js, but if you want to dive deep into *all* of its capabilities, check out [the README](https://github.com/redis/redis-om-node) over on GitHub.


## Prerequisites

Like anything software related, you need to have some stuff installed before you can get starterd. Here's our particular set of prerequities:

- [Node.js](https://nodejs.org/en/): In this tutorial, I’m using JavaScript's top-level await feature which was introduced in Node 14.8. So, make sure you are using that version or later.
- [Redis Stack](/download): You need a version of Redis Stack somewhere be it on your machine or someone else's.
- [RedisInsight](https://redis.com/redis-enterprise/redis-insight/): We'll use this to look in Redis and make sure our code is writing what we expect it to.


## Starter code

We're not going to code this completely from scratch. I have some starter code for you to, well, start with. So, go ahead and clone that to a folder of your convenience:

    get clone git@github.com:redis-developer/express-redis-om-workshop.git

Now that you have the starter code, let's explore it a bit. Opening up `server.js` in the root we see that we have a simple Express app that uses [dotenv](https://www.npmjs.com/package/dotenv) for configuration and [Swagger UI Express](https://www.npmjs.com/package/swagger-ui-express):

```javascript
import 'dotenv/config'

import express from 'express'
import swaggerUi from 'swagger-ui-express'
import YAML from 'yamljs'

/* create an express app and use JSON */
const app = new express()
app.use(express.json())

/* set up swagger in the root */
const swaggerDocument = YAML.load('api.yaml')
app.use('/', swaggerUi.serve, swaggerUi.setup(swaggerDocument))

/* start the server */
app.listen(8080)
```

Alongside this is `api.yaml`, which defines the API we're going to build and provides the information Swagger UI Express needs to render it's UI. You don't need to mess with it unless you want to add some additional routes.

The `persons` folder has some JSON files and a shell script. The JSON files are sample persons—all musicians because fun—that you can load into the API to test it. The shell script—`load-data.sh`—will load all the JSON files into the API using `curl`.

There are two empty folders, `om` and `routers`. The `om` folder is where all the Redis OM code will go. The `routers` folder will hold code for all of our Express routes.


## Configure and run

The starter code is perfectly runnable, if a bit thin. Let's configure it and run it to make sure we're ready to move on to some actual coding. First, get all the dependencies:

    npm install

Then, setup a `.env` in the root that dotenv can make use of. There's a `sample.env` file in the root that you can copy and modify:

    cp sample.env .env

The contents of `.env` looks like this:

```
# Put your local Redis Stack URL here. Want to run in the
# cloud instead? Sign up at https://redis.com/try-free/.
REDIS_URL=redis://localhost:6379
```

Change the REDIS_URL to your Redis URL, if necessary, and you're good to go. Now you should be able to run the app:

    npm start

Navigate to http://localhost:8080 and check out the client that Swagger UI Express has created. None of it *works* yet because we haven't implemented any of the routes. But, you can try them out and watch them fail!

So, the starter code runs. Let's add some Redis OM to it so it actually *does* something!


## Setting up a Client

- create a client.js in the om folder

## Entity and Schema

- Entity: the thing we read
- Schema: how to map entities to and from Redis JSON documents and Hashes
- talk about the field types

## Create a Repository

- client.fetchRepo
- createIndex

## Setup Routes

- Create
  - Generated keyname + ULIDs
  - Look in Redis
  - you can run that script now
- Read
- Update
  - updates whole record
  - could write a patch to update just one field
- Delete

## Searching on so many things

- Returning everything
- Searchign by single fields: string, number, boolean
- Using and + or
- Full-text search
- Searching by location

## Updating location

- Adding a route to update location
- Updating the location with coordin and a date
- Keeping a log of events

## Using Node Redis

- Why use node Redis?
  - more config options
  - why have two connections when one will do
  - access to low-level commands
- .use vs .open

## Storing location history with Streams

- add a call to .xAdd
- check it in RedisInsight with XRANGE

# Wrap-up

- Got some decent starter code
- To see my version, checkout the solution branch of the repo



{{< highlight javascript >}}
function hello(name){
   console.log("Hello " + name);
}

hello('node.js');
{{< / highlight >}}
