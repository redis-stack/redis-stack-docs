---
title: "Streams with Node.js"
linkTitle: Streams with Node.js
description: Monitor temperature and humidity from sensors
weight: 30
aliases:
---

You can add a [stream](/docs/data-types/streams) in RedisInsight in two ways: create a new stream or add to an existing stream.

To create a stream, start by selecting the key type (stream). 
You cannot set time to live (TTL) because it cannot be put on a message in a stream; it can only be done on a Redis key. Name the stream _mystream_. 
Then, set the *Entry ID* to `*` to default to timestamp. 
If you have your own ID generation strategy, enter the next ID from your sequence. Remember that the ID must be higher than the ID of any other entry in the stream.
 
Then, enter fields and values using + to add more than one (for example, name and location). 
Now you have a stream that appears in the **Streams** view and you can continue adding fields and values to it.

RedisInsight runs read commands for you so you can see the stream entries in the **Streams** view. 
And the **Consumer Groups** view shows each consumers in a given consumer group and the last time Redis allocated a message, what the ID of it was and how many times that process has happened, and whether a consumer has you have told Redis that you are finished working with that task using the `XACK` command.

This example shows how to interact with a stream built in Node.js.

## Step 1: Setup

1. Install [RedisInsight](https://redis.com/redis-enterprise/redis-insight/?_ga=2.48624486.1318387955.1655817244-1963545967.1655260674#insight-form).
2. Download and install [Node.js](https://nodejs.org/en/download/) (LTS version).
3. Install [Redis](https://redis.io/download/). In Docker, check that Redis is running locally on the default port 6379 (with no password set). 
4. Clone the [code repository](https://github.com/redis-developer/introducing-redis-talk) for this example. 
See the [README](https://github.com/redis-developer/introducing-redis-talk/tree/main/streams) for more information about this example and installation tips.
5. On your command-line, navigate to the folder containing the code repository and install `npm`. 

```javascript
 npm install
```

## Step 2: Run the producer

To start the producer, which will add a new entry to the stream every few seconds, enter:

```javascript
npm run producer

> streams@1.0.0 producer
> node producer.js

Starting producer...
Adding reading for location: 62, temperature: 40.3, humidity: 36.5
Added as 1632771056648-0
Adding reading for location: 96, temperature: 15.4, humidity: 70
Added as 1632771059039-0
...
```

The producer runs indefinitely. 
Select `Ctrl+C` to stop it. 
You can start multiple instances of the producer if you want to add entries to the stream faster.

## Step 3: Run the consumer

To start the consumer, which reads from the stream every few seconds, enter:

```javascript
npm run consumer

> streams@1.0.0 consumer
> node consumer.js

Starting consumer...
Resuming from ID 1632744741693-0
Reading stream...
Received entry 1632771056648-0:
[ 'location', '62', 'temp', '40.3', 'humidity', '36.5' ]
Finished working with entry 1632771056648-0
Reading stream...
Received entry 1632771059039-0:
[ 'location', '96', 'temp', '15.4', 'humidity', '70' ]
```

The consumer stores the last entry ID that it read in a Redis string at the key `consumer:lastid`. It uses this string to pick up from where it left off after it is restarted. Try this out by stopping it with `Ctrl+C` and restarting it.

Once the consumer has processed every entry in the stream, it will wait indefinitely for instances of the producer to add more:

```javascript
Reading stream...
No new entries since entry 1632771060229-0.
Reading stream...
No new entries since entry 1632771060229-0.
Reading stream...
```

Stop it using `Ctrl+C`.

## Step 4: Run a consumer group

A consumer group consists of multiple consumer instances working together. Redis manages allocation of entries read from the stream to members of a consumer group. A consumer in a group will receive a subset of the entries, with the group as a whole receiving all of them. When working in a consumer group, a consumer process must acknowledge receipt/processing of each entry.

Using multiple terminal windows, start three instances of the consumer group consumer, giving each a unique name:

```javascript
npm run consumergroup consumer1

> streams@1.0.0 consumergroup
> node consumer_group.js -- "consumer1"

Starting consumer consumer1...
Consumer group temphumidity_consumers exists, not created.
Reading stream...
Received entry 1632771059039-0:
[ 'location', '96', 'temp', '15.4', 'humidity', '70' ]
Acknowledged processing of entry 1632771059039-0.
Reading stream...
```

In a second terminal:

```javascript
npm run consumergroup consumer2
```

And in a third:

```javascript
npm run consumergroup consumer3
```

The consumers will run indefinitely, waiting for new messages to be added to the stream by a producer instance when they have collectively consumed the entire stream. 
Note that in this model, each consumer instance does not receive all of the entries from the stream, but the three members of the group each receive a subset.

## Step 5: View the stream in RedisInsight

1. Launch RedisInsight.
1. Select `localhost:6379`
1. Select **STREAM**. Optionally, select full screen from the upper right corner to expand the view.

<img src="../../images/insight_streams.png">

You can now toggle between **Stream** and **Consumer Groups** views to see your data. 
A stream is an append-only log so you can't modify the contents of an entry, but you can delete an entire entry. 
A case when that's useful is in the event of a so-called _poison-pill message_ that can cause consumers to crash. You can physically remove such messages in the **Streams** view or use the `XDEL` command at the command-line interface (CLI).

You can continue interacting with your stream at the CLI. For example, to get the current length of a stream, use the `XLEN` command:

```
XLEN ingest:temphumidity
```

## Learn more

* [Redis Streams](/docs/manual/data-types/streams)
* [Introducing Redis Streams with RedisInsight, node.js, and Python](https://www.youtube.com/watch?v=q2UOkQmIo9Q) (video).