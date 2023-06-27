
---
title: Connection management
linkTitle: Connections
description: Manage connections in RedisInsight
weight: 10

---

Before viewing and interacting with your data, optimizing your Redis or Redis Stack database, or troubleshooting performance issues, you must first add the database so RedisInsight can connect to it.
While all your local Redis or Redis Stack databases with the standalone connection type and without any authentication will be automatically identified and added to your list of database connections when RedisInsight launches for the first time, there are many cases when you need to add database connections to work with them via RedisInsight.
To do so, you can use one of the available options:

* Discover your databases in Redis Enterprise Cluster and databases with Flexible plans in Redis Cloud, as well as primary groups from Redis Sentinel.
* Use a form to enter your connection details and add any Redis database running anywhere.
* Connect to your database connections via SSH tunnels using a password or private key in the PEM format.

<img src="../../images/Databases.png">