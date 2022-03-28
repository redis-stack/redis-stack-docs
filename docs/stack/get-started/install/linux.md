---
title: Install Redis Stack on Linux
linkTitle: Linux
description: "How to install Redis Stack on Linux"
weight: 1
---



## From the official Debian/Ubuntu APT Repository
You can install recent stable versions of Redis Stack from the official packages.redis.io APT repository. Add the repository to the apt index, update it and install:

{{< highlight bash >}}
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install redis-stack-server
{{< / highlight >}}

## Install on Red Hat

1. Install dependencies:

{{< highlight bash >}}
yum install epel-release
yum install openssl-devel jemalloc-devel libgomp
{{< /highlight bash >}}
 
2. Download a tar.gz file for [Redhat/CentOS 7 x86_64](https://redismodules.s3.amazonaws.com/redis-stack/redis-stack-server-6.2.0-v1.rhel7.x86_64.tar.gz) or [Redhat/CentOS 8 x86_64](https://redismodules.s3.amazonaws.com/redis-stack/redis-stack-server-6.2.0-v1.rhel8.x86_64.tar.gz).

3. Untar the file to your favourite location

4. Add information to PATH

5. Install [RedisInsight](https://redis.com/redis-enterprise/redis-insight/#insight-form) manually
