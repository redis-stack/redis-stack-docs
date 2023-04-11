---
title: "RedisInsight plugins"
linkTitle: Plugins
description: Create your own custom data visualizations
weight: 40
aliases:
---

With RedisInsight, you can extend the core functionality by building your own data visualizations.

Redis can hold a range of different data types. Visualizing these data types in a format that's convenient to you for validation and debugging is paramount. 
You can now easily extend the core functionality of RedisInsight independently by building your own custom visualization plugin.

Data visualization provided by the plugin is rendered in the **Workbench** results area and is based on the executed command. 
A Redis command can generate its own custom data visualization.

For your reference, see the [plugin package example](https://github.com/RedisInsight/RedisInsight/tree/main/redisinsight/ui/src/packages/clients-list): running the CLIENT LIST command presents the output in a tabular format for easier reading.

