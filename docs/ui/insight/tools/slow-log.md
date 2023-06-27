---
title: Slow Log
linkTitle: Slow Log
description: Display logs captured by the SLOWLOG command
weight: 10

---

Use **Slow Log** to:

* Monitor and improve the performance of your Redis and Redis Stack databases.
* Identify Redis commands that are running slowly and that can negatively impact the performance of your database. 
* Identify other issues such as increased latency or reduced throughput.

To get started: 

1. Select **Analysis Tools > Slow Log**. 

1. In **Configure**, specify both the runtime and the maximum length of `SLOWLOG` to configure the list of commands logged. 

1. Under **Last refresh** dropdown, set the auto-refresh interval to `Auto Refresh` to automatically update the list of commands displayed.

Using `SLOWLOG`, RedisInsight captures the list of slow commands.

Investigate slow commands so you can optimize your Redis or Redis Stack database and ensure faster response times and improved application performance.

<img src="../../images/slowlog.png">
