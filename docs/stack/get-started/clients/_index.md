---
title: Redis Stack clients
linkTitle: Clients
description: Client libraries supporting Redis Stack
weight: 2
---

Redis Stack is built on Redis and uses the same client protocol as Redis. As a result, most Redis client libraries work with Redis Stack. But some client libraries provide a more complete developer experience.

To meaningfully support Redis Stack support, a client library must provide an API for the commands exposed by Redis Stack. Core client libraries generally provide one method per Redis Stack command. High-level libraries provide abstractions that may make use of multiple commands.

## Official client libraries

The following official client libraries support Redis Stack:

* [NRedisStack (.Net)](/docs/clients/dotnet/) >= 0.6
* [Jedis (Java)](/docs/clients/java/) >= 4.4
* [node-redis (Node.js)](/docs/clients/nodejs/) >= 4.6
* [redis-py (Python)](/docs/clients/python/) >= 4.5

## High-level client libraries

The Redis OM client libraries let you use the document modeling, indexing, and querying capabilities of Redis Stack much like the way you'd use an [ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping). The following Redis OM libraries support Redis Stack:

* [Redis OM .NET](https://github.com/redis/redis-om-dotnet)
* [Redis OM Node](https://github.com/redis/redis-om-node)
* [Redis OM Python](https://github.com/redis/redis-om-python)
* [Redis OM Spring](https://github.com/redis/redis-om-spring)
