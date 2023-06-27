---
title: Object-Mapper libraries (Beta)
linkTitle: Object mapping (Beta)
description: Object-Mapper libraries for Redis Stack
weight: 6
---


Redis OM (pronounced *REDiss OHM*) is a library that provides object mapping for Redis—that's what the OM stands for... *object mapping*. It maps Redis data types — specifically Hashes and JSON documents — to JavaScript objects. And it allows you to search over these Hashes and JSON documents. It uses RedisJSON and RediSearch to do this.

RedisJSON and RediSearch are two of the modules included in Redis Stack. Modules are extensions to Redis that add new data types and new commands. RedisJSON adds a JSON document data type and the commands to manipulate it. RediSearch adds various search commands to index the contents of JSON documents and Hashes.

Redis OM comes in *four* different versions. We'll be working with Redis OM for Node.js in this tutorial, but there are also flavors and tutorials for [Python](/docs/stack/get-started/tutorials/stack-python), [.NET](/docs/stack/get-started/tutorials/stack-dotnet/), and [Spring](docs/stack/get-started/tutorials/stack-spring).

This tutorial will get you started with Redis OM for Node.js, covering the basics. But if you want to dive deep into *all* of Redis OM's capabilities, check out [the README](https://github.com/redis/redis-om-node) over on GitHub.

