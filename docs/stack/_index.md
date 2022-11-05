---
title: Redis Stack
linkTitle: Redis Stack
description: Extends Redis with modern data models and processing engines. Includes documentation for the bundled Redis modules and RedisInsight.
---

Redis Stack is an improved starting point for working with Redis. We've bundled together the best of the technology that we have to offer into an easy 
to use package. Redis Stack extends the core capabilities of Redis OSS and provides a complete developer experience for debugging and more.

In addition to all of the features of Redis OSS, Redis Stack supports:

* Probabilistic data structures
* Queryable JSON documents
* Querying across hashes and JSON documents 
* Time series data support (ingestion & querying)
* Graph data models with the Cypher query language

## Why Redis Stack?

Redis Stack was created to allow developers to build real-time applications with a backend data platform that can reliably process requests in 
milliseconds or less. Redis Stack does this by taking the original Redis OSS as the core and enhancing it with modern data models, data processing tools,
and continuing to fight complexity at every turn. Ultimately, the goal of Redis Stack is to build a real-time data platform that continues to fulfill the
philosophy of Redis OSS: simplicity, performance, and reliability. 

Redis Stack unifies and simplifies the developer experience of the leading Redis modules and the capabilities they provide. Redis Stack bundles 
five Redis modules: [RedisJSON](/docs/stack/json), [RediSearch](/docs/stack/search), [RedisGraph](/docs/stack/graph), 
[RedisTimeSeries](/docs/stack/timeseries), and [RedisBloom](/docs/stack/bloom).

The overaching vision is to provide developers with a powerful platform for all real-time data use cases. As we continue to advance the capabilities of 
Redis beyond caching, Redis Stack is the place to start. Redis Stack delivers the core capabilities developers love about Redis and goes beyond 
to help you build modern applications where performance is paramount. 

## Redis Stack Packaging

There are three distinct Redis Stack packages to choose from:

* **Redis Stack Server**:  This packages contains Redis OSS and module extensions only. It does *not* contain Redis Insight, the developer desktop
application. This package is best for production deployment and is intended to be a drop-in replacement (for example, if you're already deploying 
Redis OSS as a cache and/or more.

* **Redis Stack (Desktop)**: This package contains everything a developer needs in a single bundle. This includes Redis OSS and module extension 
along with the Redis Insight desktop application. If you want to create an application locally and explore how it interacts with Redis, this is 
the package for you.

* **Redis Stack Insights**: This package ONLY contains RedisInsight, the developer desktop application. If you've used Redis Stack Server and 
you want to explore how your application is working with it, use this package and connect it to your Redis Stack Server deployment.

## Getting started

To get started with Redis Stack, see the [Getting Started](/docs/stack/get-started/) guide. You may also want to:

* [Install Redis Stack](/docs/stack/get-started/install/)
* [See the list of clients supporting Redis Stack](/docs/stack/get-started/clients/)
* [View the Redis Stack tutorials](/docs/stack/get-started/tutorials/)


### Clients

Several Redis client libraries support Redis Stack. These include redis-py, node_redis, and Jedis. In addition, four higher-level object 
mapping libraries also support Redis Stack: Redis OM .NET, Redis OM Node, Redis OM Python, Redis OM Spring.

### RedisInsight

Redis Stack also includes [RedisInsight](https://docs.redis.com/latest/ri/), a visualization tool for understanding and optimizing Redis data.

RedisInsight allows you to:
* View performance metrics for your Redis instance with the Overview tool
* View data structures visually with the Browser tool
* Manage basic properties of your Redis cluster such as cluster node timeout, IP, or port with the Cluster Management tool
* Run commands with a REPL (read-eval-print-loop) with the the CLI tool
* Analyze memory usage with the Memory Analysis tool
* Identify and troubleshoot bottlenecks with the Slowlog tool
* Edit the configuration of your Redis instance with the Configuration tool
* and more...


## Redis Stack license

Redis Stack is made up of several components, licensed as follows:

* Redis Stack Server, which combines open source Redis with RediSearch, RedisJSON, RedisGraph, RedisTimeSeries, and RedisBloom, is licensed 
* under the [Redis Source Available License](https://github.com/RediSearch/RediSearch/blob/master/LICENSE) (RSAL).

* RedisInsight is licensed under the [Server Side Public License](https://en.wikipedia.org/wiki/Server_Side_Public_License) (SSPL).
