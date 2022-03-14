---
title: Download
linkTitle: Download
menu:
  main:
    weight: 30
---

<div id="download-redis">

## Redis

You can download the last Redis source files here. For additional options, see the Redis download section below.
Stable (6.2)

Redis 6.2 includes many new commands and improvements. Redis 6.2 improves on the completeness of Redis and addresses issues that have been requested by many users frequently or for a long time. 

* [Download 6.2.6](https://download.redis.io/releases/redis-6.2.6.tar.gz)
* [Redis 6.2.6 Release Notes](https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES)
* [More installation options ->](#redis-downloads)

</div>

<div id="download-redis-stack">

## Redis Stack

We publish Redis Stack packages for Docker, Homebrew, Debian, and RHEL. Redis Stack is also available in [Redis Cloud](https://redis.com/try-free/).

### Stable (1.0)

Redis Stack 1.0 extends Redis with support for JSON, search, time series, graph, and probabilistic data models. Stack also includes RedisInsight for visualizing and optimizing your Redis data.

* [Redis Stack Server 1.0.1]()
* [Stack 1.0.1 Release Notes]()
* [More installation options ->](#redis-stack-downloads)
</div>

<div id="download-redis-options">

## Redis downloads

### Release-candidate (7.0)

Redis 7.0 includes several new user-facing features, significant performance optimizations, and many other improvements. It also includes changes that potentially break backwards compatibility with older versions. 

* [Download 7.0-rc2](https://github.com/redis/redis/archive/7.0-rc2.tar.gz)
* [7.0-rc2 Release Notes](https://raw.githubusercontent.com/redis/redis/7.0/00-RELEASENOTES)

### Unstable

This is where all the development happens. Only for hard-core hackers or for folks who need to test the latest features or performance improvements. As this is an experimental build, it's not guaranteed to be fit for production deployment.

[Download Redis Unstable Build](https://github.com/redis/redis/archive/unstable.tar.gz)

### Latest Stable

The latest stable release is always available at the fixed [https://download.redis.io/redis-stable.tar.gz](https://download.redis.io/redis-stable.tar.gz) URL along with its [SHA-256 sum](https://download.redis.io/redis-stable.tar.gz.SHA256SUM).

### Older Redis Versions

#### Redis 6.x

Redis 6.0 (GA October, 2021) introduced SSL, the new RESP3 protocol, ACLs, client side caching, diskless replicas, I/O threads, faster RDB loading, new modules APIs, and many more improvements.

See the [release notes](https://raw.githubusercontent.com/redis/redis/6.0/00-RELEASENOTES) or [download 6.0.16](https://download.redis.io/releases/redis-6.0.16.tar.gz).

#### Redis 5.x

Redis 5.0 (GA October 2018) introduced the new stream data type, sorted set blocking pop operations, LFU/LRU info in RDB, a cluster manager in redis-cli, active defragmentation V2, better HyperLogLogs, and many other improvements.

See the [release notes](https://raw.githubusercontent.com/redis/redis/5.0/00-RELEASENOTES) or [download 5.0.14](https://download.redis.io/releases/redis-5.0.14.tar.gz).

### List of all releases and hash digests

You can find a [listing of all previous Redis releases](https://download.redis.io/releases/) on the [releases page](https://download.redis.io/releases/). SHA-256 digests for these downloads are available in the [redis-hashes git repository](https://github.com/redis/redis-hashes/).

### Docker

You can download and run Docker images of Redis from DockerHub. Multiple versions are available, usually updated in a short time after a new release is available.

[Go to Redis DockerHub](https://hub.docker.com/_/redis).
</div>

<div id="download-redis-stack-options">

## Redis Stack downloads

### Docker

You can download and run Docker images of Redis Stack from DockerHub. Multiple versions are available, usually updated in a short time after a new release is available.

[Go to Redis Stack DockerHub](https://hub.docker.com/_/redis)
</div>
