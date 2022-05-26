---
title: Install Redis Stack on Linux
linkTitle: Linux
description: "How to install Redis Stack on Linux"
weight: 1
---



### From the official Debian/Ubuntu APT Repository
You can install recent stable versions of Redis Stack from the official packages.redis.io APT repository. The repository currently supports Ubuntu Xenial (16.04), Ubuntu Bionic (18.04), and Ubuntu Focal (20.04) on x86 processors. Add the repository to the apt index, update it and install:

{{< highlight bash >}}
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install redis-stack-server
{{< / highlight >}}

### From the official RPM Feed

You can install recent stable versions of Redis Stack from the official packages.redis.io YUM repository. The repository currently supports RHEL7/CentOS7, and RHEL8/Centos8. Add the repository to the repository index, and install the package.

Create the file /etc/yum.repos.d/redis.repo with the following contents

{{< highlight text >}}
[Redis]
name=Redis
baseurl=http://packages.redis.io/rpm/rhel7
enabled=1
gpgcheck=1
{{< / highlight >}}

{{< highlight bash >}}
curl -fsSL https://packages.redis.io/gpg > /tmp/redis.key
sudo rpm --import /tmp/redis.key
sudo yum install epel-release
sudo yum install redis-stack-server
{{< / highlight >}}
