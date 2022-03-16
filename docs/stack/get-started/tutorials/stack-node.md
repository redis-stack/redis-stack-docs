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


### Entity

Next, we need to define an **entity**. An `Entity` is the class that you work with—the thing being mapped to. It is what you create, read, update, and delete. Any class that extends `Entity` is an entity. We'll define our Person entity with a single line:

```javascript
/* our entity */
class Person extends Entity {}
```


### Schema

A **schema** defines the fields on your entity, their types, and how they are mapped internally to Redis. By default, entities map to JSON documents. Let's create our `Schema` in `person.js`:

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

When you create a `Schema`, it modifies the `Entity` you handed it (`Person` in our case) adding getters and setters for the properties you define. The type those getters and setters accept and return are defined with the type parameter above. Valid values are: `string`, `number`, `boolean`, `string[]`, `date`, `point`, or `text`.

The first three do exactly what you think—they define a property that is a [String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), a [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number), or a [Boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean). `string[]` does what you'd think as well, specifically defining an [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) of Strings.

`date` is a little different, but still more or less what you'd expect. It defines a property that returns a [Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) and can be set using not only a Date but also a String containing an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date or a number with the [UNIX epoch time](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_ecmascript_epoch_and_timestamps) in *milliseconds*.

A `point` defines a point somewhere on the globe as a longitude and a latitude. It creates a property that returns and accepts a simple object with `longitude` and `latitude` properties. Like this:

```javascript
let point = { longitude: 12.34, latitude: 56.78 }
```

A `text` field is a lot like a `string`. If you're just reading and writing objects, they are identical. But if you want to *search* on them, they are very, very different. We'll talk about that when we add search to our API but the tl;dr is that `string` fields can only be matched on their whole value—no partial matches—and are best for keys while `text` fields have full-text search enabled on them and are optimized for human-readable text.


### Repository

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

Our routes need a place to live. That place is a `Router`. Create a file in the `routers` folder called `person-router.js` and import both `Router` from Express and the `personRepository` we defined in `person.js`:

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

Let's go ahead and test that in Swagger as well. You should get back exactly the same response. In fact, since this is a simple GET, we should be able to just load the URL into our browser. Test that out too by navigating to http://localhost:8080/person/01FY9MWDTWW4XQNTPJ9XY9FPMN, replacing the `entityId` with your own.

Now that we can read and write, let's implement the *REST* of the HTTP verbs. REST... get it?

### Updating a Person

Let's add the code to update using a POST route:

```javascript
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
```

This code fetches the `Person` from the `Repository` using the `entityId` just like our previous route did. However, now we change all the properties based on the properties in the request body. If any of them are missing, we set them to `null`. Then, we call `.save` and return the changed `Person`.

Let's test this in Swagger too, why not? Make some changes. Remove some of the fields and see what you get back when you read it.

### Deleting a Person

Deletion, my favorite! Remember kids, deletion is 100% compression. The route that deletes is just as straightforward as the one that reads, just more destructive:

```javascript
router.delete('/:id', async (req, res) => {
  await personRepository.remove(req.params.id)
  res.send({ id: req.params.id })
})
```

I guess we should probably test this one out too. Load up Swagger and exercise the route. You should get back JSON with the `entityID` you just removed:

```json
{
  "id": "01FY9MWDTWW4XQNTPJ9XY9FPMN"
}
```

And just like that, it's gone!


### All the CRUD

Just for completeness, here's what should be the totality of your `person-router.js` file:

```javascript
import { Router } from 'express'
import { personRepository } from '../om/person.js'

export const router = Router()

router.put('/', async (req, res) => {
  const person = await personRepository.createAndSave(req.body)
  res.send(person)
})

router.get('/:id', async (req, res) => {
  const person = await personRepository.fetch(req.params.id)
  res.send(person)
})

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

router.delete('/:id', async (req, res) => {
  await personRepository.remove(req.params.id)
  res.send({ id: req.params.id })
})
```

If yours looks different, you might want to figure that out. ;)


## Searching on so many things

CRUD down, let's do some searching. In order to search, we need data to search over. Remember the `persons` folder with all the JSON documents and the `load-data.sh` shell script? It's time has arrive. Go into that folder and run that script:

    cd persons
    ./load-data.sh

You should get a response with the loaded JSON and the file it came from as a result. Like this:

```
{"entityId":"01FY9Z4RRPKF4K9H78JQ3K3CP3","firstName":"Chris","lastName":"Stapleton","age":43,"verified":true,"location":{"longitude":-84.495,"latitude":38.03},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["singing","football","coal mining"],"personalStatement":"There are days that I can walk around like I'm alright. And I pretend to wear a smile on my face. And I could keep the pain from comin' out of my eyes. But sometimes, sometimes, sometimes I cry."} <- chris-stapleton.json
{"entityId":"01FY9Z4RS2QQVN4XFYSNPKH6B2","firstName":"David","lastName":"Paich","age":67,"verified":false,"location":{"longitude":-118.25,"latitude":34.05},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["singing","keyboard","blessing"],"personalStatement":"I seek to cure what's deep inside frightened of this thing that I've become"} <- david-paich.json
{"entityId":"01FY9Z4RSD7SQMSWDFZ6S4M5MJ","firstName":"Ivan","lastName":"Doroschuk","age":64,"verified":true,"location":{"longitude":-88.273,"latitude":40.115},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["singing","dancing","friendship"],"personalStatement":"We can dance if we want to. We can leave your friends behind. 'Cause your friends don't dance and if they don't dance well they're no friends of mine."} <- ivan-doroschuk.json
{"entityId":"01FY9Z4RSRZFGQ21BMEKYHEVK6","firstName":"Joan","lastName":"Jett","age":63,"verified":false,"location":{"longitude":-75.273,"latitude":40.003},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["singing","guitar","black eyeliner"],"personalStatement":"I love rock n' roll so put another dime in the jukebox, baby."} <- joan-jett.json
{"entityId":"01FY9Z4RT25ABWYTW6ZG7R79V4","firstName":"Justin","lastName":"Timberlake","age":41,"verified":true,"location":{"longitude":-89.971,"latitude":35.118},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["singing","dancing","half-time shows"],"personalStatement":"What goes around comes all the way back around."} <- justin-timberlake.json
{"entityId":"01FY9Z4RTD9EKBDS2YN9CRMG1D","firstName":"Kerry","lastName":"Livgren","age":72,"verified":false,"location":{"longitude":-95.689,"latitude":39.056},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["poetry","philosophy","songwriting","guitar"],"personalStatement":"All we are is dust in the wind."} <- kerry-livgren.json
{"entityId":"01FY9Z4RTR73HZQXK83JP94NWR","firstName":"Marshal","lastName":"Mathers","age":49,"verified":false,"location":{"longitude":-83.046,"latitude":42.331},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["rapping","songwriting","comics"],"personalStatement":"Look, if you had, one shot, or one opportunity to seize everything you ever wanted, in one moment, would you capture it, or just let it slip?"} <- marshal-mathers.json
{"entityId":"01FY9Z4RV2QHH0Z1GJM5ND15JE","firstName":"Rupert","lastName":"Holmes","age":75,"verified":true,"location":{"longitude":-2.518,"latitude":53.259},"locationUpdated":"2022-01-01T12:00:00.000Z","skills":["singing","songwriting","playwriting"],"personalStatement":"I like piña coladas and taking walks in the rain."} <- rupert-holmes.json
```

A little messy, but if you don't see this, then it didn't work!

Now that we have some data, let's add another `Router` for the search routes we want to add. Create a file named `search-router.js` in the routers folder and set it up with imports and exports just like we did in `person-router.js`:

```javascript
import { Router } from 'express'
import { personRepository } from '../om/person.js'

export const router = Router()
```

Import this `Router` into `server.js` the same way we did for for the `personRouter`:

```javascript
/* import routers */
import { router as personRouter } from './routers/person-router.js'
import { router as searchRouter } from './routers/search-router.js'
```

Then add the `searchRouter` to the Express app:

```javascript
/* bring in some routers */
app.use('/person', personRouter)
app.use('/persons', searchRouter)
```

`Router` bound, we can now add some routes.

### Search all the things
- Returning everything

```javascript
router.get('/all', async (req, res) => {
  const persons = await personRepository.search().return.all()
  res.send(persons)
})
```

### Searching by single feilds
- Searchign by single fields: string, number, boolean

```javascript
router.get('/by-last-name/:lastName', async (req, res) => {
  const lastName = req.params.lastName
  const persons = await personRepository.search()
    .where('lastName').equals(lastName).return.all()
  res.send(persons)
})

router.get('/old-enough-to-drink-in-america', async (req, res) => {
  const persons = await personRepository.search()
    .where('age').gte(21).return.all()
  res.send(persons)
})

router.get('/non-verified', async (req, res) => {
  const persons = await personRepository.search()
    .where('verified').is.not.true().return.all()
  res.send(persons)
})
```


### Using `and` and `or`
- Using and + or

```javascript
router.get('/verified-drinkers-with-last-name/:lastName', async (req, res) => {
  const lastName = req.params.lastName
  const persons = await personRepository.search()
    .where('verified').is.true()
      .and('age').gte(21)
      .and('lastName').equals(lastName).return.all()
  res.send(persons)
})
```


### Full-text search is fancy
- Full-text search

```javascript
router.get('/with-statement-containing/:text', async (req, res) => {
  const text = req.params.text
  const persons = await personRepository.search()
    .where('personalStatement').matches(text)
      .return.all()
  res.send(persons)
})
```

### Searching on the globe
- Searching by location

```javascript
router.get('/near/:lng,:lat/radius/:radius', async (req, res) => {
  const longitude = Number(req.params.lng)
  const latitude = Number(req.params.lat)
  const radius = Number(req.params.radius)

  const persons = await personRepository.search()
    .where('location')
      .inRadius(circle => circle
          .longitude(longitude)
          .latitude(latitude)
          .radius(radius)
          .miles)
        .return.all()

  res.send(persons)
})
```

## Updating location

```javascript
import { Router } from 'express'
import { personRepository } from '../om/person.js'

export const router = Router()

router.patch('/:id/location/:lng,:lat', async (req, res) => {

  const id = req.params.id
  const longitude = Number(req.params.lng)
  const latitude = Number(req.params.lat)

  const locationUpdated = new Date()

  const person = await personRepository.fetch(id)
  person.location = { longitude, latitude }
  person.locationUpdated = locationUpdated
  await personRepository.save(person)

  res.send({ id, locationUpdated, location: { longitude, latitude } })
})
```


- Adding a route to update location
- Updating the location with coordin and a date
- Keeping a log of events

## Using Node Redis

- Why use node Redis?
  - more config options
  - why have two connections when one will do
  - access to low-level commands
- .use vs .open

```javascript
import { Client } from 'redis-om'
import { createClient } from 'redis'

const url = process.env.REDIS_URL

export const connection = createClient({ url })
await connection.connect()

const client = await new Client().use(connection)

export default client
```

## Storing location history with Streams

- add a call to .xAdd
- check it in RedisInsight with XRANGE

# Wrap-up

- Got some decent starter code
- To see my version, checkout the solution branch of the repo

```javascript
import { Router } from 'express'

import { personRepository } from '../om/person.js'
import { connection } from '../om/client.js'

export const router = Router()

router.patch('/:id/location/:lng,:lat', async (req, res) => {

  const id = req.params.id
  const longitude = Number(req.params.lng)
  const latitude = Number(req.params.lat)

  const locationUpdated = new Date()

  const person = await personRepository.fetch(id)
  person.location = { longitude, latitude }
  person.locationUpdated = locationUpdated
  await personRepository.save(person)

  await connection.xAdd(`${person.keyName}:locationHistory`, '*', person.location)

  res.send({ id, locationUpdated, location: { longitude, latitude } })
})
```







{{< highlight javascript >}}
function hello(name){
   console.log("Hello " + name);
}

hello('node.js');
{{< / highlight >}}
