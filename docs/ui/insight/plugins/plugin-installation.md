---
title: "Install RedisInsight plugins"
linkTitle: Install plugin
description: Learn how to add `plugins` for the Workbench to RedisInsight
weight: 20
aliases:
---

{{% alert title="Note" color="warning" %}}
 
To avoid automatic execution of malicious code, when adding new plugins for Workbench, use files from trusted authors only.

{{% /alert %}}

1. Download the plugin for the Workbench.
2. Open the `plugins` folder with the following path:
   * For MacOs: `<usersHomeDir>/.redisinsight-preview/plugins`
   * For Windows: `C:/Users/{Username}/.redisinsight-preview/plugins`
   * For Linux: `<usersHomeDir>/.redisinsight-preview/plugins`
3. Add the folder with plugin to the `plugins` folder.

To see the uploaded plugin visualizations in the command results, reload the Workbench 
page and run Redis command relevant for this visualization.


## Usage

The plugin may contain different visualizations for any Redis commands. 
To see command results in the uploaded plugin visualization:

1. Open RedisInsight.
2. Open the database.
3. Open **Workbench**.
4. Run the Redis command for the plugin visualization.
5. Select the plugin visualization in which to display results, if this visualization has not been set by default.