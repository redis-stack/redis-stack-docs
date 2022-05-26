---
title: RedisInsight
linkTitle: RedisInsight
description: Visualize and optimize Redis data
weight: 3
---

[![Discord](https://img.shields.io/discord/697882427875393627?style=flat-square)](https://discord.gg/QUkjSsk)
[![Github](https://img.shields.io/static/v1?label=&message=repository&color=5961FF&logo=github)](https://github.com/redisinsight/redisinsight/)

RedisInsight is a powerful tool for visualizing and optimizing data in Redis or Redis Stack, making real-time application development easier and more fun than ever before. RedisInsight lets you do both GUI- and CLI-based interactions in a fully-featured desktop GUI client.

### Download the latest RedisInsight

* Download the latest RedisInsight [here](https://redis.com/redis-enterprise/redis-insight/)
* [RedisInsight Release Notes](https://github.com/RedisInsight/RedisInsight/releases)

## Overview

### Connection management

* Automatically discover and add your local Redis or Redis Stack databases (that use standalone connection type and do not require authentication)
* Discover your databases in Redis Enterprise Cluster and databases with Flexible plans in Redis Cloud
* Use a form to enter your connection details and add any Redis database running anywhere (including OSS Cluster, Sentinel)

<img src="/images/insight/Databases.png">

### Browser

Browse, filter and visualize your key-value Redis data structures.
* [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) support for Lists, Hashes, Strings, Sets, Sorted Sets 
* CRUD support for [RedisJSON](https://oss.redis.com/redisjson/)
* Group keys according to their namespaces

<img src="/images/insight/Browser.png">

### Profiler

Analyze every command sent to Redis in real time

<img src="/images/insight/Profiler.png">

### CLI

The CLI is accessible at any time within the application. 
* Employs integrated help to deliver intuitive assistance
* Use together with a convenient command helper that lets you search and read on Redis commands.

<img src="/images/insight/CLI.png">

### Workbench

Advanced command line interface with intelligent command auto-complete and complex data visualizations.
* Built-in guides: you can conveniently discover Redis and Redis Stack capabilities using the built-in guides.
* Command auto-complete support for all capabilities in Redis and Redis Stack.
* Visualizations of your [RediSearch](https://oss.redis.com/redisearch/) index, queries, and aggregations
* Visualizations of your [RedisGraph](https://oss.redis.com/redisgraph/) and [RedisTimeSeries](https://oss.redis.com/redistimeseries/) data.

<img src="/images/insight/Workbench_Graph.png">

<img src="/images/insight/Workbench_TimeSeries.png">


## Plugins

With RedisInsight you can now also extend the core functionality by building your own data visualizations. See our [plugin documentation](https://github.com/RedisInsight/RedisInsight/wiki/Plugin-Documentation) for more information.

## Telemetry

RedisInsight includes an opt-in telemetry system. This help us improve the developer experience of the app. We value your privacy; all collected data is anonymised.

## Feedback

To provide your feedback, [open a ticket in our RedisInsight repository](https://github.com/RedisInsight/RedisInsight/issues/new).

## License 

RedisInsight is licensed under [SSPL](https://github.com/RedisInsight/RedisInsight/blob/main/LICENSE) license.
