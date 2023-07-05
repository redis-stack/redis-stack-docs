---
title: About Redis Stack
linkTitle: About Redis Stack
description: Learn more about Redis Stack
weight: 7
stack: true
aliases:
    - /docs/stack/about
---

Redis Stack is the best starting point for working with Redis. We've bundled together the best of the technology that we have to offer into an easy-to-use package. Redis Stack extends the core features of Redis OSS and provides a complete developer experience for debugging and more.

In addition to all of the features of Redis OSS, Redis Stack supports:

* Probabilistic data structures
* Queryable JSON documents
* Querying across hashes and JSON documents 
* Time series data support (ingestion & querying), including full-text search

## Why Redis Stack?

Redis Stack was created to allow developers to build real-time applications with a backend data platform that can reliably process requests in 
milliseconds or less. Redis Stack does this by taking the original Redis OSS as the core and enhancing it with modern data models, data processing tools,
and continuing to fight complexity at every turn. Ultimately, the goal of Redis Stack is to build a real-time data platform that continues to fulfill the
philosophy of Redis OSS: simplicity, performance, and reliability. 

Redis Stack unifies and simplifies the developer experience of Redis by offering all the cutting-edge features provided by the leading Redis features. Redis Stack bundles the following features into Redis: [JSON](/docs/stack/json), [Search and Query](/docs/stack/search), [Time Series](/docs/stack/timeseries), and [Probabilistic](/docs/stack/bloom).

The overarching vision is to provide developers with a powerful platform for all real-time data use cases. As we continue to advance the features of 
Redis beyond caching, Redis Stack is the place to start. Redis Stack delivers the core features developers love about Redis and goes beyond 
to help you build modern applications where performance is paramount. 

## RedisInsight

The best way to get started with Redis Stack is with [RedisInsight](https://docs.redis.com/latest/ri/), a visualization tool for understanding and optimizing Redis data.

RedisInsight allows you to:
* View data structures visually with the Browser tool and group keys according to their namespaces.
* Use CRUD on most Redis Stack data structures.
* Leverage Workbench, an advanced command-line interface with intelligent command auto-complete and complex data visualizations.
* Analyze traffic to Redis in real time using the Profiler tool.
* Use embedded Redis CLI at any time. 
* Analyze memory usage with the Memory Analysis tool.
* Identify and troubleshoot bottlenecks using the Slowlog tool.

## Redis Stack packaging

There are two distinct Redis Stack packages to choose from:

* **Redis Stack Server**:  This package contains Redis OSS and module extensions only. It does *not* contain RedisInsight, the developer desktop
application. This package is best for production deployment and is intended to be a drop-in replacement (for example, if you're already deploying 
Redis OSS as a cache).  You can still download RedisInsight separately.

* **Redis Stack**: This package contains everything a developer needs in a single bundle. This includes Redis Stack Server (Redis OSS and module extensions)
along with the RedisInsight desktop application (or part of the docker container). If you want to create an application locally and explore how it interacts with Redis, this is 
the package for you.

## Use cases

Explore [use cases](/docs/stack/use-cases/) of the applied modern data models and processing engines provided by Redis Stack across industries and applications. 

{{% alert title="Note" color="warning" %}}
 
Modules as described here are generic, and we list only the representative use cases.

{{% /alert %}}

## Clients

Several Redis client libraries support Redis Stack. These include [redis-py](https://redis-py.readthedocs.io/en/stable/), [node_redis](https://github.com/redis/node-redis), [NRedisStack](https://github.com/redis/NRedisStack), and [Jedis](https://github.com/redis/jedis). In addition, four higher-level object 
mapping libraries also support Redis Stack: [Redis OM .NET](/docs/stack/get-started/tutorials/stack-dotnet/), [Redis OM Node](/docs/stack/get-started/tutorials/stack-node/), [Redis OM Python](/docs/stack/get-started/tutorials/stack-python/), [Redis OM Spring](/docs/stack/get-started/tutorials/stack-spring/).

## Redis Stack license

Redis Stack is made up of several components, licensed as follows:

* Redis Stack Server, which combines open source Redis with Search and Query, JSON, Time Series, and Probabilistic features is dual-licensed under the Redis Source Available License ([RSALv2]((/docs/stack/license/)) and the [Server Side Public License](https://en.wikipedia.org/wiki/Server_Side_Public_License) (SSPL). A breakdown of licensing by Stack component versions is shown in the table below. For more information about Redis licensing, see [Licenses](https://redis.com/legal/licenses/).

* RedisInsight is licensed under the SSPL.

### Versions and licenses

As of November 15, 2022, our default binary distributions of Redis Stack and the Redis modules that it includes are dual-licensed under RSALv2 and SSPL. When using the source code, you can apply either RSALv2 or SSPLv1. 

<table>
  <tr>
    <th>Module</th>
    <th>RSALv1</th>
    <th>Binary distribution: RSALv2</br>
    Source code: RSALv2 or SSPLv1</th>
  </tr>
  <tr>
    <td>Redis Stack</td>
    <td><= 6.2.4</td>
    <td>>= 6.2.6</td>
  </tr>
  <tr>
    <td>RediSearch</td>
    <td><= 2.4</td>
    <td>>= 2.6</td>
  </tr>
    <tr>
    <td>RedisJSON</td>
    <td><= 2.2</td>
    <td>>= 2.4</td>
  </tr>
  <tr>
    <td>RedisTimeSeries</td>
    <td><=1.6</td>
    <td>>= 1.8</td>
  </tr>
  <tr>
    <td>RedisBloom</td>
    <td><= 2.2</td>
    <td>>=2.4</td>
  </tr>
</table>

To get going quickly with Redis Stack, see the [Get started](/docs/stack/get-started/) guide. 
