---
title: "Install RedisInsight plugins"
linkTitle: Install plugin
description: Learn how to add Workbench plugins to RedisInsight
weight: 20
aliases:
---

{{% alert title="Note" color="warning" %}}
 
To avoid automatic execution of malicious code when adding new Workbench plugins, use files from trusted authors only.

{{% /alert %}}

1. Download the plugin for the Workbench.
1. Open the `plugins` folder with the following path:
   * For MacOS: `<usersHomeDir>/.redisinsight-preview/plugins`
   * For Windows: `C:/Users/{Username}/.redisinsight-preview/plugins`
   * For Linux: `<usersHomeDir>/.redisinsight-preview/plugins`
1. Add the folder that contains the plugin to the `plugins` folder.

To see the uploaded plugin visualizations in the command results, reload the Workbench 
page and run the relevant Redis command.

## Usage

The plugin may contain different visualizations for any Redis commands. 
To see command results in the uploaded plugin visualization:

1. Open RedisInsight.
1. Open the database.
1. Open **Workbench**.
1. Run the Redis command for the plugin visualization.
1. Select the plugin visualization to use if this visualization was not set by default.