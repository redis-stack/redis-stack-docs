---
title: "Workbench tutorials"
linkTitle: Workbench tutorials
description: Interact with Workbench tutorials
weight: 20
aliases:
---

Tutorials you find in **Workbench** allow you interact with some sample data in a few taps. For this orientation, we will use an example called _Redis for time series_. 

<img src="../../images/workbench_tutorial.png">

If you haven't done so, [add a database](/docs/ui/insight/get-started#add-a-redis-database). To try the tutorials, you can create a database manually using RedisInsight instructions. Then navigate to this example in Workbench and read the introduction. Next, you will create time series for bike shops.

## Step 1: Create a time series per bike shop

Select the **Create time series per shop** button to create five time series for bike shops. 

<img src="../../images/create_time_series.png">

This creates a time series per shop, tracking the total amount of all sales. As you can tell from the labels, each time series is marked `east` or `west` to query bike sales by time periods, shop, region, or across all shops. 
Each shop has a numbered id. You also add the `DUPLICATE_POLICY SUM` argument to describe what should be done when two events in the same time series share the same timestamp. 

Here, we assume two sales happen at exactly the same time, resulting in a value that is the sum of two sales values. 
If you're running this example from your command line, you'll see Redis `OK` responses. But, you can also follow along in Workbench by selecting the right arrow. 

Because the metrics are collected with a millisecond timestamp, you can compact the time series into sales per hour.

## Step 2: Compact time series

Redis Stack supports downsampling with these aggregations: `avg`, `sum`, `min`, `max`, `range`, `count`, `first`, and `last`. If you want to keep all of your raw data points indefinitely, your data set grows linearly over time. However, if your use case allows you to have less fine-grained data further back in time, you can apply downsampling. This allows you to keep fewer historical data points by aggregating raw data for a given time window using a given aggregation function.

Select the **Time series compaction** button to create five time series for bike shops. 

<img src="../../images/time_series_compaction.png">

Follow the remaining steps in Workbench to load more data points and get sales based on different queries.

## Create your own Workbench tutorial

Try other data structure examples in Workbench. Share your Redis expertise with your team and the wider community by building custom RedisInsight tutorials. Use our [instructions](https://github.com/RedisInsight/Tutorials) to describe your implementations of Redis for other users to follow and interact with in the context of a connected Redis database.
