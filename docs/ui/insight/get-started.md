---
title: Get started with RedisInsight
linkTitle: Get started
description: Get started with RedisInsight
weight: 20

---

RedisInsight is available as a standalone download or [bundled with Redis Stack](/docs/stack/get-started/install). 
Standalone downloads are available for Windows, MacOS, and Linux from the Redis Enterprise website and stores.

## Install on Windows

**From website**

1. Download [RedisInsight](https://redis.com/redis-enterprise/redis-insight). 

1. Open the `RedisInsight-v2-win-installer.exe` file.

1. Open the RedisInsight icon.

**From stores**

* Go to [Microsoft Windows Apps](https://apps.microsoft.com/store/detail/redisinsight/XP8K1GHCB0F1R2) and download the RedisInsight app.

## Install on MacOS

**From website**

1. Download [RedisInsight](https://redis.com/redis-enterprise/redis-insight). 

1. Add RedisInsight to **Applications**. 

**Using Homebrew**

```
brew install --cask redisinsight
```

To start RedisInsight from your Terminal, run this command.

```
redisinsight
``` 

**From stores**

* Go to [Apple Store](https://apps.apple.com/us/app/redisinsight/id6446987963) and download the RedisInsight app.

## Install on Linux

**From website**

1. Download [RedisInsight](https://redis.com/redis-enterprise/redis-insight). 

1. Open the Linux command line and install the package. 

   * For the `.AppImage` package: 

     - To make your downloaded file executable, run:

        ```
        chmod a+x RedisInsight-v2-linux-x86_64.AppImage
        ```

     - To start RedisInsight, open the Linux command line and navigate to the directory containing the downloaded file. Then, run:

       ```
       ./RedisInsight-v2-linux-x86_64.AppImage
       ```

   * For Debian, run:

     ```
     sudo apt install ./RedisInsight-v2-linux-amd64.deb
     ```


**From stores**

* You can install RedisInsight from [Snapcraft](https://snapcraft.io/redisinsight) or [FlatHub](https://flathub.org/apps/details/com.redis.RedisInsight) using instructions available at those sites.

## Add a Redis database

If you already have a Redis database, you can:

* Add it manually by specifying connection details.

* Auto-discover your Redis Enterprise Cluster or Cloud databases, as well as your Redis Sentinel instances.

If you need a free Redis database with modern data models and processing engines, select **Try Redis Cloud with enhanced database capabilities**.

If you already have a Redis database up and running locally, RedisInsight automatically searches for it and adds it if found.

Once added, your database appears with **Database Alias**, **Host:Port**, **Connection Type**, **Modules**, and **Last connection**.

<img src="../images/add_database.png">

## Add a new key

Select **+Key** to add a new key.

Once added, the dashboard UI shows the hash key details.

<img src="../images/add_key.png">

## Change the color

RedisInsight allows you to specify the color theme of your choice. Select **Settings > General** and change the appearance between **Dark Theme** and **Light Theme**.

## Explore

To explore ways you can interact with your database, see [Tools](/docs/ui/insight/tools) and [Tutorials](/docs/ui/insight/tutorials).
