---
title: Get started with RedisInsight
linkTitle: Get started
description: Get started with RedisInsight
weight: 40

---

RedisInsight is available as a [standalone download](https://redis.com/redis-enterprise/redis-insight/) or [bundled with Redis Stack](/docs/stack/get-started/install). Install it and try the in-app examples available in Workbench.


## Install RedisInsight 

You can use RedisInsight on MacOS, Linux, or Windows.

**Install on MacOS**

Redis offers RedisInsight on Intel and M1. 

1. Download [RedisInsinght](https://redis.com/redis-enterprise/redis-insight) or [Redis Stack](/docs/stack/get-started/install/mac-os). 

1. Add RedisInsight to **Applications**. 

1. From your Terminal, run this command.

```
redisinsight
``` 

To resume your journey, [start Redis Stack Server](#start-redis-stack-server).   

**Install on Linux**

RedisInsight is available for Linux as a Debian or AppImage package.

1. Download [RedisInsinght](https://redis.com/redis-enterprise/redis-insight) or [Redis Stack](/docs/stack/get-started/install/linux). 

2. Make your downloaded file into an executable.

 ```
 chmod a+x RedisInsight-v2-linux-x86_64.AppImage

 ```

3. Open the Linux command line and navigate to the folder containing the downloaded file. To open RedisInsight, run this command.

```
./RedisInsight-v2-linux-x86_64.AppImage

```

To resume your journey, [start Redis Stack Server](#start-redis-stack-server).   

**Install on Windows**

1. Download [RedisInsinght](https://redis.com/redis-enterprise/redis-insight) or [Redis Stack](/docs/stack/get-started/install/windows). 

2. Double-click the `RedisInsight-v2-win-installer.exe` file.

3. Double-click the RedisInsight icon.

## Start Redis Stack Server

You can now start Redis Stack Server as follows:

```bash
 redis-stack-server
```

## Add a Redis database

You can add a Redis database either by adding a database manually, creating a new Redis Enterprise Cloud database, or connecting to an existing database. To try Redis Enterprise Cloud, select **Try Redis Cloud with enhanced database capabilities**.

If you already have Redis database up and running locally, select **Autodiscover Databases**.

Enter the requested details, then click **Submit** or **Add Redis Database**.

Once added, your database appears with **Database Alias**. **Host:Port**, **Connection Type**, **Modules**, and **Last connection**.

## Add a new key

Select **+Key** to add a new key.

Once added, the dashboard UI shows the hash key details

## Change the color

RedisInsight allows you to specify the color theme of your choice. Select **Settings > General** and change the appearance between **Dark Theme** and **Light Theme**.

## Explore

To learn how to use RedisInsight with your database, see [Examples](/docs/ui/insight/examples).