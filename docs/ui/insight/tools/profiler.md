---
title: Profiler
linkTitle: Profiler
description: Analyze commands in real time
weight: 10

---

Debug and monitor the performance and security of your Redis or Redis Stack instance using the **Profiler** tool.

**Profiler** is a tool based on Redis `MONITOR` command that streams back every command processed by the Redis server in real-time.

**Profiler** can help you to:

* Debug issues with your database.
* Diagnose issues and identify problematic commands.
* Identify performance issues and bottlenecks.
* Detect suspicious activity such as unauthorized access attempts or unusual commands being sent to the Redis server.
* Spot bugs in an application both when using Redis or Redis Stack as a database and as a distributed caching system.

{{% alert title="Note" color="warning" %}}
 
Because `MONITOR` streams back all commands, its use comes at a cost of reducing the throughput of your database. Therefore, avoid running **Profiler** in production databases.

{{% /alert %}}

RedisInsight also allows you to download the file with all the logs streamed back to analyze them outside of the application. Before starting the **Profiler**, enable saving to save the logs to a `.txt` file.

<img src="../../images/Profiler.png">