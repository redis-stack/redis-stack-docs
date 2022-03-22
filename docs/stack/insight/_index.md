---
title: RedisInsight
linkTitle: RedisInsight
description: Visualize and optimize Redis data
weight: 3
---

# <img src="images/ico-redisinsight.svg" alt="logo" width="25"/>  RedisInsight - Developer GUI for Redis, by Redis. 

RedisInsight is a powerful tool for visualizing and optimizing data in Redis or Redis Stack, making real-time application development easier and more fun than ever before. RedisInsight lets you do both GUI- and CLI-based interactions in a fully-featured Desktop GUI client that provides capabilities to help you design, develop and optimize your Redis application. 

* Download the latest RedisInsight for [macOS x86_64](https://download.redisinsight.redis.com/latest/RedisInsight-v2-mac-x64.dmg) [macOS aarch64](https://download.redisinsight.redis.com/latest/RedisInsight-v2-mac-arm64.dmg) [Linux](https://download.redisinsight.redis.com/latest/RedisInsight-v2-linux-x86_64.AppImage) [Windows](https://download.redisinsight.redis.com/latest/RedisInsight-v2-win-installer.exe)
* [RedisInsight Release Notes](https://docs.redis.com/staging/release-ri-v2.0/ri/release-notes/)

## Overview

### Connection management

Connect to any Redis, anywhere.
* Automatically discover and add your local Redis or Redis Stack databases (that use standalone connection type and do not require authentication).
* Discover your databases in Redis Enterprise Cluster and databases with Flexible plans in Redis Cloud
* Use a form to enter your connection details and add any Redis database running anywhere (including OSS Cluster, Sentinel)

<img src="images/Databases.png">

### Browser

Browse, filter and visualise your key-value Redis data structures.
* [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) support for Lists, Hashes, Strings, Sets, Sorted Sets 
* CRUD support for [RedisJSON](https://oss.redis.com/redisjson/)
* Group keys according to their namespaces

<img src="images/Browser.png">

### Profiler

Analyze every command sent to Redis in real-time

<img src="images/Profiler.png">

### CLI

Accessible at any time within the applicaiton with command hints.
* Employs integrated help to deliver intuitive assistance
* Use together with a convenient command helper that lets you search and read on Redis commands.

<img src="images/CLI.png">

### Workbench

Advanced command line interface with intelligent command auto-complete and complex data visualizations.
* Built-in Guides: Developers can conveniently discover Redis and Redis Stack capabilities via built-in guides.
* Command auto-complete support for all capabilities in Redis and Redis Stack.
* Visualizations of your [RediSearch](https://oss.redis.com/redisearch/) index, queries, and aggregations
* Visualizations of your [RedisGraph](https://oss.redis.com/redisgraph/) and [RedisTimeSeries](https://oss.redis.com/redistimeseries/) data.

<img src="images/Workbench_Graph.png">

<img src="images/Workbench_TimeSeries.png">


## RedisInsight Plugins

With RedisInsight you can now also extend the core functionality by building your own data visualizations. See our wiki for more information.

* [Plugin Documentation](https://github.com/RedisInsight/RedisInsight/wiki/Plugin-Documentation)

## Telemetry

RedisInsight includes an opt-in telemetry system, that is leveraged to help improve the developer experience (DX) within the app. We value your privacy, so stay assured, that all the data collected is anonymised.

## Feedback

* RedisInsight [repository](https://github.com/RedisInsight/RedisInsight)

## License 

RedisInsight is licensed under [SSPL](/LICENSE) license.
