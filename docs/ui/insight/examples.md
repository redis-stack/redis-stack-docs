---
title: "RedisInsight examples"
linkTitle: Examples
description: 
weight: 60
---


RedisInsight allows you to browse, filter, and visualize key-value Redis data structures. It supports CRUD operation for lists, hashes, strings, sets, sorted sets, and so on. You can take advantage of built-in examples in Workbench to learn about the data structures. We'll guide you through one of those examples here and show you other practical ways to use RedisInsight with your databases.

## Use RedisInsight to manage time series 

Examples you find in Workbench allow you interact with some sample data in a few taps. For this orientation, we will use an example called _Redis for time series_. If you haven't done so, install [Redis Stack](/docs/stack/get-started/install). Then navigate to this example in Workbench, read the introduction, then tap the first button to create five time series for bike shops. 

**Step 1: Create a time series per bike shop**

```bash
 TS.CREATE bike_sales_1 DUPLICATE_POLICY SUM LABELS region east compacted no
 TS.CREATE bike_sales_2 DUPLICATE_POLICY SUM LABELS region east compacted no
 TS.CREATE bike_sales_3 DUPLICATE_POLICY SUM LABELS region west compacted no
 TS.CREATE bike_sales_4 DUPLICATE_POLICY SUM LABELS region west compacted no
 TS.CREATE bike_sales_5 DUPLICATE_POLICY SUM LABELS region west compacted no
```

This creates a time series per shop, tracking the total amount of all sales. As you can tell from the labels, each time series is marked `east` or `west` to query bike sales by time periods, shop, region, or across all shops. 
Each shop has a numbered id. We also add the `DUPLICATE_POLICY SUM` argument to describe what should be done when two events in the same time series share the same timestamp. 

Here, we assume two sales happen at exactly the same time, resulting in a value that is the sum of two sales values. 
If you're running this example from your command line, you'll see Redis `OK` responses. But, you can also follow along in Workbench by tapping the right arrow. 

Because the metrics are collected with a millisecond timestamp, you can compact the time series into sales per hour.

**Step 2: Compact time series**

Redis Stack supports downsampling with these aggregations: `avg`, `sum`, `min`, `max`, `range`, `count`, `first`, and `last`. If you want to keep all of your raw data points indefinitely, your data set grows linearly over time. However, if your use case allows you to have less fine-grained data further back in time, you can apply downsampling. This allows you to keep fewer historical data points by aggregating raw data for a given time window using a given aggregation function.

```
 TS.CREATERULE bike_sales_5 bike_sales_5_per_day AGGREGATION sum 86400000
```

Try other data structure examples in Workbench and let us know if you'd like to contribute your own examples.

## Use RedisInsight to manage streams and consumer groups

A _stream_ is an append-only log file. 
When you add data to it, you cannot change it. 
That may seem like a disadvantage; however, a stream serves as a log or single source of truth. 
It can also be used as a buffer between processes that work at different speeds and do not need to know about each other. 
For more conceptual information about streams, see [Redis Streams](/docs/manual/data-types/streams). 

In this example, you will learn how to add and work with streams as well as consumer groups in RedisInsight.

Here's a stream that models temperature and humidity sensors. Processes interacting with the stream perform one of two roles: _consumer_ and _producer_. 
The point of a stream is that it's not going to end, so you cannot capture whole datasets and do some processing on them. 
 
In this stream, sensors are considered _producers_, which broadcast data. 
A _consumer_ reads from the stream and does some work on it. 
For example, if the temperature is above a certain threshold, it puts a message out to turn on the air conditioner in that unit or notify the maintenance.

<img src="../images/stream.png">

It is possible to have multiple consumers doing different jobs, one measuring humidity, and another taking temperature measurements over periods of time. 
Redis stores a copy of the entire dataset in memory, which is a finite resource.
To avoid runaway data, streams can be trimmed when you add something to them. 
When adding to a stream with `XADD`, you can optionally specify that the stream should be trimmed to a specific or approximate number of the newest entries, or to only include entries whose ID is higher than the ID specified.
You can also manage the storage required for streaming data using key expiry.  For example, by writing each day's data to its own stream in Redis and expiring each stream's key after a period of time, say a week.
An ID can be any number, but each new entry in the stream must have an ID whose value is higher than the last ID added to the stream.

**Adding new entries** 

Use `XADD` with `*` for the ID to have Redis automatically generate a new ID for you consisting of a millisecond precision timestamp, a dash and a sequence number.  For example `1656416957625-0`.  Then supply the field names and values to store in the new stream entry.

There are a couple of ways of retrieving things. You can retrieve entries by time range or you could ask for everything that's happened since a timestamp or ID that you specify. Using a single command you can ask for anything from 10:30 until 11:15 am on a given day.

**Using consumer groups**

A more realistic use case would be a system with many temperature sensors whose data Redis puts in a stream, records the time they arrive, and orders them. 

<img src="../images/consumer.png">

On the right side, we have two consumers that read the stream. One of them is alerting if the temperature is over a certain number and texting the maintenance crew that they need to do something, and the other is a data warehouse that is taking the data and putting it into a database. 

They run independently of each other. 
Up in the right, we have another sort of task. 
Let's assume that alerting and data warehouse are really fast. 
You get a message whether the temperature is larger than a specific value, which might take a millisecond. 
And alerting can keep up with the data flow. 
One way you can scale consumers is _consumer groups_, which allows multiple instances of the same consumer or same code to work as a team to process the stream.

**Managing streams in RedisInsight**

You can add a stream in RedisInsight in two ways: create a new stream or add to an existing stream.

To create a stream, start by selecting the key type (stream). 
You cannot set time to live (TTL) because it cannot be put on a message in a stream; it can only be done on a Redis key. Name the stream _mystream_. 
Then, set the *Entry ID* to `*` to default to timestamp. 
If you have your own ID generation strategy, enter the next ID from your sequence. Remember that the ID must be higher than the ID of any other entry in the stream.
 
Then, enter fields and values using + to add more than one (for example, name and location). 
Now you have a stream that appears in the **Streams** view and you can continue adding fields and values to it.

RedisInsight runs read commands for you so you can see the stream entries in the **Streams** view. 
And the **Consumer Groups** view shows each consumers in a given consumer group and the last time Redis allocated a message, what the ID of it was and how many times that process has happened, and whether a consumer has you have told Redis that you are finished working with that task using the `XACK` command.

### Monitor temperature and humidity from sensors in RedisInsight

This example shows how to bring an existing stream into RedisInsight and work with it.

**Step 1: Setup**

1. Install [RedisInsight](https://redis.com/redis-enterprise/redis-insight/?_ga=2.48624486.1318387955.1655817244-1963545967.1655260674#insight-form).
2. Download and install [Node.js](https://nodejs.org/en/download/) (LTS version).
3. Install [Redis](https://redis.io/download/). In Docker, check that Redis is running locally on the default port 6379 (with no password set). 
4. Clone the [code repository](https://github.com/redis-developer/introducing-redis-talk) for this example. 
See the [README](https://github.com/redis-developer/introducing-redis-talk/tree/main/streams) for more information about this example and installation tips.
5. On your command-line, navigate to the folder containing the code repository and install the Node.js package manager (npm). 

 {{< highlight bash >}}
 npm install
 {{< / highlight >}}

**Step 2: Run the producer**

To start the producer, which will add a new entry to the stream every few seconds, enter:

```
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

**Step 3: Run the consumer**

To start the consumer, which reads from the stream every few seconds, enter:

```
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

```
Reading stream...
No new entries since entry 1632771060229-0.
Reading stream...
No new entries since entry 1632771060229-0.
Reading stream...
```

Stop it using `Ctrl+C`.

**Step 4: Run a consumer group**

A consumer group consists of multiple consumer instances working together. Redis manages allocation of entries read from the stream to members of a consumer group. A consumer in a group will receive a subset of the entries, with the group as a whole receiving all of them. When working in a consumer group, a consumer process must acknowledge receipt/processing of each entry.

Using multiple terminal windows, start three instances of the consumer group consumer, giving each a unique name:

```
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

```
npm run consumergroup consumer2
```

And in a third:

```
npm run consumergroup consumer3
```

The consumers will run indefinitely, waiting for new messages to be added to the stream by a producer instance when they have collectively consumed the entire stream. 
Note that in this model, each consumer instance does not receive all of the entries from the stream, but the three members of the group each receive a subset.

**Step 5: View the stream in RedisInsight**

1. Launch RedisInsight.
1. Select `localhost:6379`
1. Select **STREAM**. Optionally, select full screen from the upper right corner to expand the view.

<img src="../images/insight_streams.png">

You can now toggle between **Stream** and **Consumer Groups** views to see your data. 
As mentioned earlier in this example, a stream is an append-only log so you can't modify the contents of an entry, but you can delete an entire entry. 
A case when that's useful is in the event of a so-called _poison-pill message_ that can cause consumers to crash. You can physically remove such messages in the **Streams** view or use the `XDEL` command at the command-line interface (CLI).

You can continue interacting with your stream at the CLI. For example, to get the current length of a stream, use the `XLEN` command:

```
XLEN ingest:temphumidity
```

Use streams for auditing and processing events in banking, gaming, supply chain, IoT, social media, and so on.

## Related topics

- [Redis Streams](/docs/manual/data-types/streams)
- [Introducing Redis Streams with RedisInsight, node.js, and Python](https://www.youtube.com/watch?v=q2UOkQmIo9Q) (video)