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

Now that you have the starter code, let's explore it a bit. Opening up `server.js` in the root we see that we have a simple Express app that uses [*Dotenv*](https://www.npmjs.com/package/dotenv) for configuration and [Swagger UI Express](https://www.npmjs.com/package/swagger-ui-express):

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

```bash
# Put your local Redis Stack URL here. Want to run in the
# cloud instead? Sign up at https://redis.com/try-free/.
REDIS_URL=redis://localhost:6379
```

Change the `REDIS_URL` to your Redis URL, if necessary, and you're good to go. Now you should be able to run the app:

    npm start

Navigate to http://localhost:8080 and check out the client that Swagger UI Express has created. None of it *works* yet because we haven't implemented any of the routes. But, you can try them out and watch them fail!

So, the starter code runs. Let's add some Redis OM to it so it actually *does* something!


## Setting up a Client

First things first, let's set up a **client**. The `Client` class is the thing that knows how to talk to Redis on the behalf of Redis OM. Internally, it uses [Node Redis](https://github.com/redis/node-redis). I like to put my instantiated `Client` in its own file and export it. This ensures that my application has one and only one instance of the `Client` and thus only one connection to Redis. Since Redis and JavaScript are both (more or less) single-threaded, this works really well.

So, let's create our first file. In the `om` folder add a file called `client.js` and add the following code:

```javascript
import { Client } from 'redis-om'

/* pulls the Redis URL from .env */
const url = process.env.REDIS_URL

/* create and open the Redis OM Client */
const client = await new Client().open(url)

export default client
```

Note that we are getting our Redis URL from an environment variable. It was put there by Dotenv and read from our `.env` file. If we didn't have the `.env` file, or have a `REDIS_URL` property in our `.env` file, this code would gladly read this value from the *actual* environment variables.

Also note that the `.open()` method conveniently returns `this`. This `this` (can I say *this* again? I just did!) lets us chain the instantiation of the client with the opening of the client. If this isn't to your liking, you could always write it like this:

```javascript
/* create and open the Redis OM Client */
const client = new Client()
await client.open(url)
```

> Remember that _top-level await_ stuff I mentioned earlier? There it is!

## Entity, Schema, and Repository

Now that we have a `Client` that's connected to Redis, we need to start mapping some persons. To do that, we need to define an `Entity` and a `Schema`. Let's start by creating a file named `person.js` in the `om` folder and importing our `client` from `client.js` and the `Entity` and `Schema` classes from Redis OM:

```javascript
import { Entity, Schema } from 'redis-om'
import client from './client.js'
```

Next, we need to define an **entity**. An `Entity` is the class that you work with—the thing being mapped to. It is what you create, read, update, and delete. Any class that extends `Entity` is an entity. We'll define our Person entity with a single line:

```javascript
/* our entity */
class Person extends Entity {}
```

A **schema** defines the fields on your entity, their types, and how they are mapped internally to Redis. By default, entities map to JSON documents. When a `Schema` is created, it will add properties to the provided `Entity` based on the definitions provided. Let's create our `Schema` in `person.js`:

```javascript
/* create a Schema for Person */
const personSchema = new Schema(Person, {
  firstName: { type: 'string' },
  lastName: { type: 'string' },
  age: { type: 'number' },
  verified: { type: 'boolean' },
  location: { type: 'point' },
  locationUpdated: { type: 'date' },
  skills: { type: 'string[]' },
  personalStatement: { type: 'text' }
})
```
  - talk about the field types

Now we have all the pieces that we need to create a *repository*. The *Repository* is the main interface into Redis OM. It gives us the methods to read, write, and remove a specific `Entity`. Create a `Repository` in `person.js` and make sure it's exported as you'll need it when we get into the Express stuff:

```javascript
/* use the client to create a Repository just for Persons */
export const personRepository = client.fetchRepository(personSchema)
```

We're almost done with setting up our `Repository`. But we still need to create an index or we won't be able to search on anything. We do that by calling `.createIndex`. If an index already exists and it's the same, this function won't do anything. If it's different, it'll drop it and create a new one. Add a call to `.createIndex` to `person.js`:

```javascript
/* create the index for Person */
await personRepository.createIndex()
```

That's all we need for `person.js` and all we need to starting talking to Redis using Redis OM. Here's the code in its entirity:

```javascript
import { Entity, Schema } from 'redis-om'
import client from './client.js'

/* our entity */
class Person extends Entity {}

/* create a Schema for Person */
const personSchema = new Schema(Person, {
  firstName: { type: 'string' },
  lastName: { type: 'string' },
  age: { type: 'number' },
  verified: { type: 'boolean' },
  location: { type: 'point' },
  locationUpdated: { type: 'date' },
  skills: { type: 'string[]' },
  personalStatement: { type: 'text' }
})

/* use the client to create a Repository just for Persons */
export const personRepository = client.fetchRepository(personSchema)

/* create the index for Person */
await personRepository.createIndex()
```

Now, let's add some routes in Express.


## Setup Routes

Our routes need a place to live. That place is a `Router`. So, create a file in the `routers` folder called `person-router.js` and import `Router` from Express and the `personRepository` that we defined in `person.js`:

Let's create a truly RESTful API with the CRUD operations mapping to PUT, GET, POST, and DELETE respectively. We're going to do this using [Express Routers](https://expressjs.com/en/4x/api.html#router) as this makes our code nice and tidy. So, create a file called `person-router.js` in the `routers` folder. Then import `Router` from Express and import the `personRepository` that we defined in `person.js`. Oh, and create and export a `Router`:

```javascript
import { Router } from 'express'
import { personRepository } from '../om/person.js'

export const router = Router()
```

Imports and exports done, let's bind the router to our Express app. Open up `server.js` and import the `Router` we just created:

```javascript
/* import routers */
import { router as personRouter } from './routers/person-router.js'
```

Then add the `personRouter` to the Express app:

```javascript
/* bring in some routers */
app.use('/person', personRouter)
```

Your `server.js` should now look like this:

```javascript
import 'dotenv/config'

import express from 'express'
import swaggerUi from 'swagger-ui-express'
import YAML from 'yamljs'

/* import routers */
import { router as personRouter } from './routers/person-router.js'

/* create an express app and use JSON */
const app = new express()
app.use(express.json())

/* bring in some routers */
app.use('/person', personRouter)

/* set up swagger in the root */
const swaggerDocument = YAML.load('api.yaml')
app.use('/', swaggerUi.serve, swaggerUi.setup(swaggerDocument))

/* start the server */
app.listen(8080)
```

Now, finally, we can add our routes to create, read, update, and delete persons. Head back to the `person-router.js` file so we can do just that.

### Creating a Person

We'll create a `Person` first as you need to have persons in Redis before you can do any of the reading, updating, or deleting of them. Add the PUT route below. This route will call `.createAndSave` to create an `Entity` from the request body and immediately save it to the Redis:

```javascript
router.put('/', async (req, res) => {
  const person = await personRepository.createAndSave(req.body)
  res.send(person)
})
```

Note that we are also returning the newly created `Person`. Let's see what that looks like by actually calling our API using the Swagger UI. Go to http://localhost:8080 in your browser and try it out. The default request body in Swagger will be fine for testing. You should see a response that looks like this:

```json
{
  "entityId": "01FY9MWDTWW4XQNTPJ9XY9FPMN",
  "firstName": "Rupert",
  "lastName": "Holmes",
  "age": 75,
  "verified": false,
  "location": {
    "longitude": 45.678,
    "latitude": 45.678
  },
  "locationUpdated": "2022-03-01T12:34:56.123Z",
  "skills": [
    "singing",
    "songwriting",
    "playwriting"
  ],
  "personalStatement": "I like piña coladas and walks in the rain"
}
```

This is exactly what we handed it with one exception: the `entityId`. Every `Entity` in Redis OM has an `entityId` which is—as you've probably guessed—the unique ID of that `Entity`. It's generated when we call any of the `.create` family of methods on a `Repository`. You'll want to make note of the `entityID` as yours will be different from the one above and you'll need it when we test the next route.


### Reading a Person

Create down, let's add a GET route to read this newly created `Person`:

```javascript
router.get('/:id', async (req, res) => {
  const person = await personRepository.fetch(req.params.id)
  res.send(person)
})
```

This code extracts a parameter from the URL used in the route—the `entityId` that we received previously. It uses the `.fetch` method on the `Repository` to retrieve a `Person` using that `entityId`. Then, it returns that `Person`.

Let's go ahead and test that in Swagger as well. You should get back exactly the same response. In fact, since this is a simple GET, we should be able to just load the URL into our browser. Test that out too by navigating to http://localhost:8080/person/01FY9MWDTWW4XQNTPJ9XY9FPMN—replacing the `entityId` with your own.


### Updating a Person

- Update
  - updates whole record
  - could write a patch to update just one field
- Delete

```javascript
import { Router } from 'express'
import { personRepository } from '../om/person.js'

export const router = Router()

// CREATE
router.put('/', async (req, res) => {
  const person = await personRepository.createAndSave(req.body)
  res.send(person)
})

// READ
router.get('/:id', async (req, res) => {
  const person = await personRepository.fetch(req.params.id)
  res.send(person)
})

// UPDATE
router.post('/:id', async (req, res) => {

  const person = await personRepository.fetch(req.params.id)

  person.firstName = req.body.firstName ?? null
  person.lastName = req.body.lastName ?? null
  person.age = req.body.age ?? null
  person.verified = req.body.verified ?? null
  person.location = req.body.location ?? null
  person.locationUpdated = req.body.locationUpdated ?? null
  person.skills = req.body.skills ?? null
  person.personalStatement = req.body.personalStatement ?? null

  await personRepository.save(person)

  res.send(person)
})

// DELETE
router.delete('/:id', async (req, res) => {
  await personRepository.remove(req.params.id)
  res.send({ id: req.params.id })
})
```


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
