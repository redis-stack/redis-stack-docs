---
title: RedisInsight tools
linkTitle: Tools
description: Learn about RedisInsight features
weight: 50

---

RedisInsight makes it easy to query, visualize, and interactively work with Redis capabilities. Whether using Redis Stack, Redis Enterprise, or Redis Enterprise Cloud, RedisInsight allows you to manipulate complex data models such as documents, graphs, and time series. Explore queryable JSON documents, full-text search, probabilistic data structures, and more.

## Connection management

* Automatically discover and add your local Redis or Redis Stack databases (that use standalone connection type and do not require authentication).
* Discover your databases in Redis Enterprise Cluster and databases with Flexible plans in Redis Cloud.
* Use a form to enter your connection details and add any Redis database running anywhere (including OSS Cluster, Sentinel).

<img src="../images/Databases.png">

## Browser

Browser offers [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) support for lists, hashes, strings, sets, sorted sets, streams, as well as for [RedisJSON](/docs/stack/json).

* Browse, filter, and visualize your key-value Redis data structures. 

* Group keys according to their namespaces.

  <img src="../images/Browser.png">

* View, validate, and manage your key values in a human-readable format using formatters that prettify and highlight data in different formats (for example, Unicode, JSON, MessagePack, HEX, and ASCII) in the Browser tool.

  <img src="../images/data_formatting.png">

## Profiler

Analyze every command sent to Redis in real time.

<img src="../images/Profiler.png">

## CLI

The CLI is accessible at any time within the application. It:

* Employs type-ahead help to deliver intuitive assistance.
* Includes a command helper that lets you filter and search for Redis commands.

Try executing Redis commands as shown here:


<img src="../images/CLI.png">

## Workbench

Workbench is a command-line interface with intelligent command auto-complete and complex data visualizations that lets you run commands against your Redis server. 
Find the workbench on the left sidebar. It displays click-through examples of Redis capabilities. You can also see a number of metrics always on display within the database workspace. These metrics get updated every 5 seconds. The metrics include CPU, number of keys, commands/sec, network input, network output, total memory, and number of connected clients. Workbench provides: 

* Built-in examples that help you discover Redis and Redis Stack capabilities using the built-in guides.
* Command auto-complete support for all capabilities in Redis and Redis Stack.
* Visualizations of your [RediSearch](https://oss.redis.com/redisearch/) index, queries, and aggregations.
* Visualizations of your [RedisGraph](https://oss.redis.com/redisgraph/).

  <img src="../images/Workbench_Graph.png">

* Visualizations of your [RedisTimeSeries](https://oss.redis.com/redistimeseries/) data.

  <img src="../images/Workbench_TimeSeries.png">

## Database analysis

Use the database analysis tool to optimize the performance and memory usage of your Redis database. Check data type distribution and memory allocation and review the summary of key expiration time and memory to be freed over time. Inspect the top keys and namespaces sorted by consumed memory or key length and count of keys, respectively. Capture and track the changes in your database by viewing historical analysis reports. Next figure shows a sample database analysis report.

<img src="../images/database_analysis.png">

Use recommendations based on developer best practices to:

* Reduce memory usage
* Improve application performance
* Increase the security of your database

Recommendations are generated specifically for your Redis or Redis Stack database.

## Redis Streams support

Create and manage streams by adding, removing, and filtering entries per timestamp. To see and work with new entries, enable and customize the automatic refresh rate.

View and manage the list of consumer groups. See existing consumers in a given consumer name as well as the last messages delivered to them. Inspect the list of pending messages, explicitly acknowledge the processed items, or claim unprocessed messages via RedisInsight.

<img src="../images/streams.png">

## Search capabilities

If you're using Redis Stack's indexing, querying, or full-text search capabilities, RedisInsight provides UI controls to run search queries against a preselected index. You can also create a secondary index of your data in a dedicated pane.

<img src="../images/search.png">

## Bulk actions

Easily and quickly delete multiple keys of the same type and/or with the same key name pattern in bulk. To do so, in the List or Tree view, set filters per key type or key names and open the Bulk Actions section. The section displays a summary of all the keys with the expected number of keys that will be deleted based on the set filters.

When the bulk deletion is completed, RedisInsight displays the results of this operation with the number of keys processed and the time taken to delete the keys in bulk.
Use bulk deletion to optimize the usage of your database based on the results from the Redis database analysis.

<img src="../images/bulk_actions.png">

## Slow Log

The Slow Log tool displays the list of logs captured by the `SLOWLOG` command to analyze all commands that exceed a specified runtime, which helps with troubleshooting performance issues. Specify both the runtime and the maximum length of Slowlog (which are server configurations) to configure the list of commands logged and set the auto-refresh interval to automatically update the list of commands displayed.

<img src="../images/slowlog.png">

## Create your own custom data visualizations

With RedisInsight you can now also extend the core functionality by building your own data visualizations. See our [plugin documentation](https://github.com/RedisInsight/RedisInsight/wiki/Plugin-Documentation) for more information.

## Telemetry

RedisInsight includes an opt-in telemetry system. This helps us improve the developer experience of the app. We value your privacy, so all collected data is anonymized.

