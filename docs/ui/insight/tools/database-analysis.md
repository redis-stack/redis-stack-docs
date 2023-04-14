---
title: "Database Analysis"
linkTitle: Database Analysis
description: Learn how RedisInsight helps to optimize your database
weight: 10
aliases:
---

Use the **Database Analysis** tool to optimize the performance and memory usage of your Redis database. Check data type distribution and memory allocation and review the summary of key expiration time and memory to be freed over time. Inspect the top keys and namespaces sorted by consumed memory or key length and count of keys, respectively. Capture and track the changes in your database by viewing historical analysis reports. 

The following image shows a sample database analysis report.

<img src="../../images/database_analysis.png">

Use recommendations based on developer best practices to:

* Reduce memory usage
* Improve application performance
* Increase the security of your database

Recommendations are generated specifically for your Redis or Redis Stack database.

<img src="../../images/database_recommendations.png">

## Optimize database memory and performance

While investigating ways to optimize memory and performance or inspecting high memory usage in your Redis or Redis Stack database, you may need to find the biggest keys or most memory-intensive data structures or analyze the allocation of data structures and compare it with previous intervals.

The **Database analysis** tool can help you to:

* Check data type distribution and memory allocation.
* Review the summary of key expiration time and memory to be freed over time.
* Inspect the top keys and namespaces sorted by consumed memory or key length and count of keys, respectively.
* Capture and track the changes in your database by viewing historical analysis reports.

After you launch RedisInsight following [Get started](/docs/ui/insight/get-started):

* Add your Redis database instance or create a new, free Redis Enterprise Cloud database. 
* To test the features, open the database. Then, go to **Analysis tools > Database Analysis** and generate a new report.

RedisInsight automatically analyzes up to 10,000 keys in your database and generates a report with diagrams that contains a summary of your database.

## Review database analysis report

Next diagram contains information about memory allocation and the number of keys per data structure in your Redis or Redis Stack database. You get an overview of the most popular and memory-intensive data structures.

<img src="../../images/memory-allocation.png">

The next diagram summarizes the expiration time in your database and the amount of memory to be freed over time. 

To optimize memory usage, configure the expiration time to allow Redis to automatically remove keys that are no longer needed. Setting the expiration time is useful for cache invalidation, because cached data is refreshed periodically to avoid stale data and keep the cache up to date.

<img src="../../images/expiration-time.png">

