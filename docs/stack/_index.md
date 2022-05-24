---
title: Redis Stack
linkTitle: Redis Stack
description: Extend Redis with modern data models and processing engines.
---

Redis Stack is an extension of Redis that adds modern data models and processing engines to provide a complete developer experience.

Itamar was here!!!Itamar was here!!!Itamar was here!!!

In addition to all of the features of OSS Redis, Redis stack supports:

* Queryable JSON documents
* Full-text search
* Time series data (ingestion & querying)
* Graph data models with the Cypher query language
* Probabilistic data structures

## Getting started

To get started with Redis Stack, see the [Getting Started](/docs/stack/get-started/) guide. You may also want to:

* [Install Redis Stack](/docs/stack/get-started/install/)
* [See the list of clients supporting Redis Stack](/docs/stack/get-started/clients/)
* [View the Redis Stack tutorials](/docs/stack/get-started/tutorials/)

If you want to learn more about the vision for Redis Stack, read on.

## Why Redis Stack?

Redis Stack was created to allow developers build to real-time applications with a back end data platform that can reliably process requests in under a millisecond. Redis Stack does this by extending Redis with modern data models and data processing tools (Document, Graph, Search, and Time Series).

Redis Stack unifies and simplifies the developer experience of the leading Redis modules and the capabilities they provide. Redis Stack bundles five Redis modules: RedisJSON, RedisSearch, RedisGraph, RedisTimeSeries, and RedisBloom.

### Clients

Several Redis client libraries support Redis Stack. These include redis-py, node_redis, and Jedis. In addition, four higher-level object mapping libraries also support Redis Stack: Redis OM .NET, Redis OM Node, Redis OM Python, Redis OM Spring.

### RedisInsight

Redis Stack also includes RedisInsight, a visualization tool for understanding and optimizing Redis data.

## Redis Stack license

Redis Stack is made up of several components, licensed as follows:

* Redis Stack Server combines open source Redis with RediSearch, RedisJSON RedisGraph, RedisTimeSeries and RedisBloom is licensed under the [Redis Source Available License](https://github.com/RediSearch/RediSearch/blob/master/LICENSE) (RSAL).

* RedisInsight is licensed under the [Server Side Public License](https://en.wikipedia.org/wiki/Server_Side_Public_License) (SSPL).
