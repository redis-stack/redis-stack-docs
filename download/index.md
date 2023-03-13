---
title: Download
linkTitle: Download
---
<div class="download-cards">
<div id="download-redis">

## Redis

You can download the last Redis source files here. For additional options, see the [Redis downloads](#redis-downloads) section below.

### Stable (7.0)

Redis 7.0 includes several new user-facing features, significant performance optimizations, and many other improvements. It also includes changes that potentially break backwards compatibility with older versions.

* [Download 7.0.9](https://github.com/redis/redis/archive/7.0.9.tar.gz)
* [7.0 Release Notes](https://raw.githubusercontent.com/redis/redis/7.0/00-RELEASENOTES)
* [More installation options ->](#redis-downloads)

</div>

<div id="download-redis-stack">

## Redis Stack

Download the latest Redis Stack Server binaries here, or install with [Docker](/docs/stack/get-started/install/docker), [Homebrew](/docs/stack/get-started/install/mac-os), or [on Linux](/docs/stack/get-started/install/linux).

### Stable (6.2.6)

Redis Stack Server extends Redis with modern data models such as document, graph, time series. Redis Stack also includes RedisInsight, a visualization tool for Redis. Read the [latest release notes](https://github.com/redis-stack/redis-stack/releases/tag/v6.2.6-v6), or download the latest 6.2.6 binaries:

* [macOS x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.catalina.x86_64.zip)
* [Ubuntu focal x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.focal.x86_64.tar.gz)
* [Ubuntu focal arm64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.focal.arm64.tar.gz)
* [All installation options ->](#redis-stack-downloads)
</div>
</div>

<div id="download-details">

## Redis downloads

### Docker

You can download and run Redis Docker images from DockerHub. Multiple versions are available, usually updated shortly after each new release.

[Go to Redis DockerHub](https://hub.docker.com/_/redis).

### Unstable

This is where all the development happens. Only for hard-core hackers or for folks who need to test the latest features or performance improvements. As this is an experimental build, it's not guaranteed to be fit for production deployment.

[Download Redis Unstable Build](https://github.com/redis/redis/archive/unstable.tar.gz)

### Latest Stable

The latest stable release is always available at the fixed [https://download.redis.io/redis-stable.tar.gz](https://download.redis.io/redis-stable.tar.gz) URL along with its [SHA-256 sum](https://download.redis.io/redis-stable.tar.gz.SHA256SUM).

### Older Redis Versions

#### Redis 6.2

Redis 6.2 includes many new commands and improvements. Redis 6.2 improves on the completeness of Redis and addresses issues that have been requested by many users frequently or for a long time.

See the [release notes](https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES) or [download 6.2.11](https://download.redis.io/releases/redis-6.2.11.tar.gz).

#### Redis 6.0

Redis 6.0 (GA October, 2021) introduced SSL, the new RESP3 protocol, ACLs, client side caching, diskless replicas, I/O threads, faster RDB loading, new modules APIs, and many more improvements.

See the [release notes](https://raw.githubusercontent.com/redis/redis/6.0/00-RELEASENOTES) or [download 6.0.18](https://download.redis.io/releases/redis-6.0.18.tar.gz).

#### Redis 5.0

Redis 5.0 (GA October 2018) introduced the new stream data type, sorted set blocking pop operations, LFU/LRU info in RDB, a cluster manager in redis-cli, active defragmentation V2, better HyperLogLogs, and many other improvements.

See the [release notes](https://raw.githubusercontent.com/redis/redis/5.0/00-RELEASENOTES) or [download 5.0.14](https://download.redis.io/releases/redis-5.0.14.tar.gz).

### List of all releases and hash digests

You can find a [listing of all previous Redis releases](https://download.redis.io/releases/) on the [releases page](https://download.redis.io/releases/). SHA-256 digests for these downloads are available in the [redis-hashes git repository](https://github.com/redis/redis-hashes/).

## Redis Stack downloads

### Redis Stack 6.2.6-v6

* macOS: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.catalina.x86_64.zip), [arm64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.monterey.arm64.zip)
* AppImage: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6-x86_64.AppImage)
* Ubuntu: [Xenial x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.xenial.x86_64.tar.gz), [Bionic x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.bionic.x86_64.tar.gz), [Bionic arm64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.bionic.arm64.tar.gz), [Focal x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.focal.x86_64.tar.gz), [Focal arm64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.focal.arm64.tar.gz), [Snap x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.x86_64.snap), [Snap arm64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.arm64.snap), [Jammy x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.jammy.x86_64.tar.gz), [Jammy arm64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.jammy.arm64.tar.gz) 
* Debian: [Bullseye x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.bullseye.x86_64.tar.gz)
* Redhat/CentOS 7: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.rhel7.x86_64.tar.gz)
* Redhat/CentOS 8: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v6.rhel8.x86_64.tar.gz)
* Redis Stack on [Dockerhub](https://hub.docker.com/u/redis): [x86_64 and arm64](https://hub.docker.com/r/redis/redis-stack)
* Redis Stack server on [Dockerhub](https://hub.docker.com/u/redis): [x86_64 and arm64](https://hub.docker.com/r/redis/redis-stack-server)

See the [release notes for 6.2.6-v6](https://github.com/redis-stack/redis-stack/releases/tag/v6.2.6-v6).

### RedisInsight

RedisInsight is a powerful tool for visualizing and optimizing data in Redis or Redis Stack. Read the latest [RedisInsight release notes](https://github.com/RedisInsight/RedisInsight/releases).

Download the latest RedisInsight the [RedisInsight download page](https://redis.com/redis-enterprise/redis-insight/).

#### Download Redis Stack Server 7.0.6-rc8:

* macOS: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.catalina.x86_64.zip), [amd64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.monterey.arm64.zip)
* AppImage: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8-x86_64.AppImage)
* Ubuntu: [Xenial x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.xenial.x86_64.tar.gz), [Bionic x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.bionic.x86_64.tar.gz), [Bionic arm64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.bionic.arm64.tar.gz), [Focal x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.focal.x86_64.tar.gz), [Focal arm64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.focal.arm64.tar.gz), [Snap x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.x86_64.snap), [Snap arm64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.arm64.snap), [Jammy x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.jammy.x86_64.zip), [Jammy arm64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.jammy.arm64.zip)
* Debian: [Bullseye x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.bullseye.x86_64.tar.gz)
* Redhat/CentOS 7: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.rhel7.x86_64.tar.gz)
* Redhat/CentOS 8: [x86_64](https://packages.redis.io/redis-stack/redis-stack-server-7.0.6-RC8.rhel8.x86_64.tar.gz)
* Redis Stack on [Dockerhub](https://hub.docker.com/u/redis): [x86_64 and arm64](https://hub.docker.com/r/redis/redis-stack)
* Redis Stack server on [Dockerhub](https://hub.docker.com/u/redis): [x86_64 and arm64](https://hub.docker.com/r/redis/redis-stack-server)

See the [release notes for 7.0.6-RC8](https://github.com/redis-stack/redis-stack/releases/tag/v7.0.6-RC8).

</div>
