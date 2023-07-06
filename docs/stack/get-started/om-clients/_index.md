---
title: Object-Mapper libraries (Beta)
linkTitle: Object mapping (Beta)
description: Object-Mapper libraries for Redis Stack
weight: 6
stack: true
---


Redis OM (pronounced *REDiss OHM*) is a library that provides object mapping for Redis—that's what the OM stands for... *object mapping*. It maps Redis data types — specifically Hashes and JSON documents — to JavaScript objects. And it allows you to search over these Hashes and JSON documents. It uses the Redis JSON and Search and Query features to do this.

JSON and Search and Query are two of the features included in Redis Stack. Features, formerly called modules, are extensions to Redis that add new data types and new commands. JSON adds a JSON document data type and the commands to manipulate it. With the search and query features you get various search commands to index the contents of JSON documents and Hashes.

Redis OM comes in *four* different versions. We'll be working with Redis OM for Node.js in this tutorial, but there are also flavors and tutorials for [Python](/docs/stack/get-started/tutorials/stack-python), [.NET](/docs/clients/om-clients/stack-dotnet/), and [Spring](/docs/clients/om-clients/stack-spring/).

This tutorial will get you started with Redis OM for Node.js, covering the basics. But if you want to dive deep into *all* of Redis OM's features, check out [the README](https://github.com/redis/redis-om-node) over on GitHub.

