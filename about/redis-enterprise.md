---
title: "Redis Enterprise"
linkTitle: "Redis Enterprise"
weight: 7
description: Learn about Redis Enterprise
aliases:
---

[Redis Enterprise](https://redis.com/redis-enterprise-software/overview/) is an enterprise-grade Redis, available both [on-premises](https://redis.com/redis-enterprise-software/overview/) and [in the cloud](https://redis.com/try-free/) (on AWS, GCP, or Azure). Redis Enterprise simplifies operations, scaling, and multi-tenancy, includes many integrations (e.g., K8s), and provides multiple tiers of support.

Read on to learn about Redis Enterprise and the benefits of its extended offerings.

## Overview

[Redis](https://redis.com/), the company, develops [OSS Redis](https://redis.io/download/#redis-downloads) and [Redis Stack](https://redis.io/download/#redis-stack-downloads) and also provides [Redis Enterprise](https://redis.com/redis-enterprise/advantages/) as a commercial product. Redis Enterprise maintains the simplicity and high performance of Redis, while adding many enterprise-grade capabilities:  

* Linear scaling to hundreds of millions of operations per second
* Improved high availability with up to 99.999% uptime
* Geo-replicated, active-active data distribution
* Data tiering
* Advanced security features
* Several deployment options (managed cloud service, software packages, K8s)
* 24/7 support

Redis Enterprise offers three deployment options: 

* Software
* Cloud
* Hybrid and Multi-cloud

### Redis Enterprise Software

[Redis Enterprise Software](https://redis.com/redis-enterprise-software/overview/) is the on-premises distribution of Redis Enterprise. You download, install, and manage a Redis Enterprise Software cluster wherever you like:

* IaaS cloud environments &mdash; Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure
* Bare-metal servers in a private datacenter
* Virtual machines (VMs), Kubernetes pods, etc.

Redis provides a [Kubernetes operator](https://redis.com/redis-enterprise-software/redis-enterprise-on-kubernetes/) that deploys and manages a Redis Enterprise cluster. You can use the operator on premises or in a private or public cloud.

The [Google Cloud Marketplace](https://console.cloud.google.com/marketplace/product/endpoints/gcp.redisenterprise.com?pli=1&project=redislabs-university) also offers Redis Enterprise as a Kubernetes app for easy deployment.

### Redis Enterprise Cloud

[Redis Enterprise Cloud](https://redis.com/redis-enterprise-cloud/overview/) is a Database-as-a-Service provided by Redis. The fully-managed cloud service is based on Redis Enterprise and accessible via a self-service portal, which gives you access to the subscription/database control plane. Redis manages the Redis Enterprise clusters and the complexity of the underlying infrastructure.

To get started, see the [Redis Enterprise Cloud quick start](https://docs.redis.com/latest/rc/rc-quickstart/).

Let [Support](https://redis.com/company/support/) know if you have any questions.

You can also purchase and deploy Redis Enterprise Cloud directly through the cloud provider's marketplace:

* [Redis Enterprise Cloud Flexible - Pay as You Go](https://aws.amazon.com/marketplace/pp/prodview-mwscixe4ujhkq) (AWS)
* [Azure Cache for Redis Enterprise pricing](https://azure.microsoft.com/en-us/pricing/details/cache/#pricing) (Azure)
* [Redis Enterprise Cloud](https://console.cloud.google.com/marketplace/product/endpoints/gcp.redisenterprise.com?project=redislabs-university) (GCP)

**Notes:**

* Azure Cache is not managed by Redis but by Microsoft with a revenue-sharing arrangement.
* Redis provides second-level support to Microsoft customers.

### Hybrid and multi-cloud deployments

Redis Enterpise support both hybrid (on-premises / cloud) and multi-cloud deployments using Active-Active replication:

* Hybrid cloud with Active-Active &mdash; Combines self-managed on-prem clusters with Redis Cloud clusters
* [Multicloud with Active-Active](https://redis.com/redis-enterprise-cloud/multicloud/) &mdash; Multiple fully-managed Redis Cloud clusters with a geo-replicated database across multiple cloud vendors (for example, AWS and GCP)

## Build real-time apps using Redis modules

[Redis Stack](/docs/stack) extends Redis with additional data models and capabilities such as indexing, SQL-like querying, and time-series data support. If you're using Redis Stack with Redis Enteprise, see our [Stack and Enterprise docs](https://docs.redis.com/latest/modules/). 

## Redis tools

* [RedisInsight](https://redis.com/redis-enterprise/redis-insight/) is a Redis admin UI that can help you optimize Redis and visualize your data. RedisInsight supports Redis OSS, Redis Stack, Redis Enterprise Software, and Redis Enterprise Cloud. It runs cross-platform on Linux, Windows, and MacOS.
* [Clients and connectors](https://redis.com/redis-enterprise/clients-connectors/) &mdash; Redis Enterprise is fully compatible with Redis OSS. Any standard Redis client can be used with Redis Enterprise.

## Support

You can contact the [Redis Customer Success Team](https://redis.com/deployment/customer-success/) for help with planning your project and implementation as well as maintaining and optimizing your solution. Redis Customer Success will work directly with you to deliver personalized account and product-lifecycle management, best practices, and expert guidance.

## Learn more

* [Redis Enterprise Software Deployment Options](https://redis.com/redis-enterprise-software/deployment/)
* [Redis Enterprise vs. Redis Open Source](https://redis.com/redis-enterprise/advantages/)
* [Multi-cloud with Redis Enterprise](https://redis.com/redis-enterprise-cloud/multicloud/)
* [Redis Enterprise on Kubernetes](https://redis.com/redis-enterprise-software/redis-enterprise-on-kubernetes/)
* [Introduction to Running Redis at Scale](https://developer.redis.com/operate/redis-at-scale/)
