---
title: "Database analysis"
linkTitle: Database analysis
description: Learn how RedisInsight helps to optimize your database
weight: 10
aliases:
---

Use the database analysis tool to optimize the performance and memory usage of your Redis database. Check data type distribution and memory allocation and review the summary of key expiration time and memory to be freed over time. Inspect the top keys and namespaces sorted by consumed memory or key length and count of keys, respectively. Capture and track the changes in your database by viewing historical analysis reports. 

Next figure shows a sample database analysis report.

<img src="../../images/database_analysis.png">

Use recommendations based on developer best practices to:

* Reduce memory usage
* Improve application performance
* Increase the security of your database

Recommendations are generated specifically for your Redis or Redis Stack database.

<img src="../../images/database_recommendations.png">

While investigating ways to optimize memory and performance, or inspecting cases when you noticed high memory usage in your Redis or Redis Stack database, you may need to find the biggest keys or most memory-intensive data structures in your database, or to analyze the allocation of data structures and compare it with previous periods.

The **Database analysis** tool can help you to:

* Check data type distribution and memory allocation.
* Review the summary of key expiration time and memory to be freed over time.
* Inspect the top keys and namespaces sorted by consumed memory or key length and count of keys, respectively.
* Capture and track the changes in your database by viewing historical analysis reports.

After you launch RedisInsight following [Get started](/docs/interfaces/ui/insight/get-started):

* Add your Redis database instance or create a new and free cloud database. 
* To test the features, open the database. Then, go to **Analysis tools > Database Analysis** and generate a new report.

RedisInsight automatically analyzes up to 10,000 keys in your database and generates a report with diagrams that contains a summary of your database.

The first generated diagram contain information about memory allocation and the number of keys per data structure in your Redis or Redis Stack database. Yoy get an overview of the most popular and memory-intensive data structures.

<img src="../../images/memory-allocation.png">

The next diagram summarizes the expiration time in your database, allowing you to observe the amount of memory to be freed over time. Configuring the expiration time helps to optimize memory usage because it allows Redis to automatically remove keys that are no longer needed. Additionally, it is useful for cache invalidation, ensuring that cached data is refreshed periodically to avoid stale data and keep the cache up to date.

<img src="../../images/expiration-time.png">

The **Database analysis** tool also gives you an overview of existing keys and namespaces used so you can find the biggest keys or the most memory-intensive or used namespaces in your database.
RedisInsight also helps you capture and track changes in your database by providing historical analysis reports.

## Feedback

To provide your feedback, [open a ticket in our RedisInsight repository](https://github.com/RedisInsight/RedisInsight/issues/new).