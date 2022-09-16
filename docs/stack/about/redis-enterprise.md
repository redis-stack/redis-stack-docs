---
title: "Redis Enterprise"
linkTitle: "Enterprise"
weight: 7
description: Learn about Redis Enterprise
aliases:

---

[Redis Enterprise](https://redis.com/redis-enterprise-software/overview/) is an enterprise-grade Redis, available both [on-premises](https://redis.com/redis-enterprise-software/overview/) and [in the cloud](https://redis.com/try-free/) (on AWS, GCP, or Azure). Redis Enterprise simplifies operations, scaling, and multi-tenancy, includes many integrations (e.g., K8s), and provides multiple tiers of support.

Read on to learn about Redis Enterprise and the benefits of its extended offerings.

## About Redis the company

[Redis](https://redis.com/), the company, develops [OSS Redis](https://redis.io/download/#redis-downloads) and [Redis Stack](https://redis.io/download/#redis-stack-downloads) and also provides [Redis Enterprise](https://redis.com/redis-enterprise/advantages/) as a commercial product. Redis Enterprise maintains the simplicity and high performance of Redis, while adding many enterprise-grade capabilities:  

* Linear scaling to hundreds of millions of operations per second
* Improved high availability with up to 99.999% uptime
* Geo-replicated, active-active data distribution
* Data tiering
* Advanced security features
* Several deployment options (managed cloud service, software packages, K8s)
* Enterprise-grade support

## Redis OSS vs. Redis Enterprise

Here are the key differences between open source Redis and Redis Enterprise.

<table>
  <thead>
    <tr>
      <th>Phase</th>
      <th>Feature</th>
      <th>Open-source Redis</th>
      <th>Enterprise Redis</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan=3>Build</td>
      <td>Boost app performance with Redis cache</td>
      <td style="text-align:center">&check;</td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td>Support enterprise caching (read replica, write-behind, write-through)</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td>Admin UIs for operations and monitoring</td>
      <td style="text-align:center">&check;</td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td rowspan=2>Deploy</td>
      <td>Fully supported and automated deployment on-premises, hybrid cloud, and multicloud</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td>Ingest data from external data sources with RedisConnect</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td rowspan=4>Run</td>
      <td>Deliver consistent real-time global response times with geo-distributed Redis</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td>Automated database and cluster management (scaling, re-sharding, rebalancing)</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td>Built-in high-availability and disaster recovery</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
    <tr>
      <td>Enterprise-grade customer support</td>
      <td> </td>
      <td style="text-align:center">&check;</td>
    </tr>
  </tbody>
</table>

For more information on the advantages of Redis Enterprise, see [_Redis Open Source vs. Redis Enterprise_](https://redis.com/wp-content/uploads/2022/06/comparison-redis-open-source-vs-redis-enterprise.pdf) (PDF).

## Redis Enterprise offerings

Redis Enterprise offers three deployment options: 

* Self-managed
* Fully managed
* Hybrid

### Self-managed options

[Redis Enterprise Software](https://redis.com/redis-enterprise-software/overview/) is the on-premises distribution of Redis Enterprise. You download, install, and manage a Redis Enterprise Software cluster wherever you like:

* IaaS cloud environments &mdash; Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure
* Bare-metal servers in a private datacenter
* Virtual machines (VMs), Kubernetes pods, etc.

Redis provides a Kubernetes operator that deploys and manages a Redis Enterprise cluster. You can use the operator on premises or on a private or public cloud.

The [Google Cloud Marketplace](https://console.cloud.google.com/marketplace/product/endpoints/gcp.redisenterprise.com?pli=1&project=redislabs-university) also offers Redis Enterprise as a Kubernetes app for easy deployment.

### Fully managed options

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

### Hybrid options

If you're thinking about Active-Active geo-distribution, there are several Redis Enterprise deployment options:

* Hybrid cloud with Active-Active &mdash; Combines self-managed on-prem clusters with Redis Cloud clusters
* Multicloud with Active-Active &mdash; Multiple fully-managed Redis Cloud clusters with a geo-replicated database across multiple cloud vendors (for example, AWS and GCP)

## Build real-time apps using Redis modules

Redis Stack [documentation](/docs/stack) extends Redis with additional data models and capabilities, such as indexing, SQL-like querying, and time-series data support. For enterprise-level guidance, see [Redis Stack and modules](https://docs.redis.com/latest/modules/). 

## Redis tools

* [RedisInsight](https://redis.com/redis-enterprise/redis-insight/) provides a Redis admin UI that can help you optimize Redis and visualize your data. RedisInsight supports Redis OSS, Redis Stack, Redis Enterprise Software, and Redis Enterprise Cloud. It runs cross-platform on Linux, Windows, and MacOS. For open source resources, see [RedisInsight docs](/docs/stack/insight/).
* [Clients and connectors](https://redis.com/redis-enterprise/clients-connectors/) &mdash; Redis Enterprise is fully compatible with Redis OSS. Any standard Redis client can be used with Redis Enterprise. Redis clients are available in over 60 programming languages and development environments.

## Support

You can contact the [Redis Customer Success Team](https://redis.com/deployment/customer-success/) for help with planning your project and implementation as well as maintaining and optimizing your solution. Redis Customer Success will work directly with you to deliver personalized account and product-lifecycle management, best practices, and expert guidance.

## Learn more

### Redis Enterprise advantages

* [Introduction to Running Redis at Scale](https://developer.redis.com/operate/redis-at-scale/)
* [Redis Enterprise vs. Redis Open Source: Why Make the Switch?](https://redis.com/redis-enterprise/advantages/)
* [Take control of your data with Redis Enterprise Software](https://redis.com/redis-enterprise-software/overview/)
* [Empowering dreamers to build real-time apps](https://redis.com/redis-enterprise-cloud/overview/)
* [Operate Your Redis Database](https://developer.redis.com/operate/)
* [Redis Backup and Restore](https://redis.com/redis-enterprise/technology/backup-disaster-recovery/)
* [Redis Security and Access Management: Build vs. Buy](https://redis.com/webinars-on-demand/redis-security-and-access-management-build-vs-buy/)

### Redis Enterprise deployments 

* [Redis Enterprise Software Deployment Options](https://redis.com/redis-enterprise-software/deployment/)
* [Redis Enterprise Cloud: seamlessly deploy & manage your multicloud application](https://redis.com/redis-enterprise-cloud/multicloud/)
* [Running Redis in Kubernetes](https://redis.com/redis-enterprise-software/redis-enterprise-on-kubernetes/)

### Redis Stack 

* [Build real-time applications with Redis modules](https://redis.com/modules/get-started/)
* [RedisInsight: The best Redis GUI](https://redis.com/redis-enterprise/redis-insight/)
* [A high-performance document store for modern applications](https://redis.com/modules/redis-json/)
* [Time series as a native data structure in Redis](https://redis.com/modules/redis-timeseries/)
* [Deliver search and analytics at the speed of transactions](https://redis.com/modules/redis-search/)
* [Fast graph processing powered by linear algebra and matrix multiplication](https://redis.com/modules/redis-graph/)
* [Intuitive Object Mapping and Fluent Queries for Redis](https://redis.com/blog/introducing-redis-om-client-libraries/)
* [Get started with Redis Cloud, for free](https://redis.com/try-free/)

### Redis Enterprise pricing and download

* [Redis Pricing](https://redis.com/redis-enterprise-cloud/pricing/)
* [Download Center](https://redis.com/redis-enterprise-software/download-center/software/)
* [Get started with Redis Cloud, for free](https://redis.com/try-free/)

