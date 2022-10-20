---
title: Install Redis Stack on Windows
linkTitle: Windows
description: "How to install Redis Stack on Windows"
weight: 2
---

To install Redis Stack on Windows, you will need to have Docker installed. When Docker is up and running, open Windows PowerShell and follow the instructions described in [Run Redis Stack on Docker](/docs/stack/get-started/install/docker). Then, use Docker to connect with `redis-cli` as explained in that topic.

{{% alert title="About using WSL and Ubuntu for Windows " color="warning" %}}
If you attempt to use Windows Subsystem for Linux (WSL) or Ubuntu for Windows to follow [Linux instructions](/docs/stack/get-started/install/linux), you will get a `systemd` error telling you `System has not been booted with systemd as init system (PID 1). Can't operate.` Do not fret. Just use Docker. 

_`systemd` is a suite of basic building blocks for a Linux system._ For more information about its function, see [System and Service Manager](https://systemd.io/). This becomes an issue due to the lack of support for Linux workflows on WSL. But, you can test the instructions listed in [Systemd support is now available in WSL!](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/). Let us know how that worked for you. 
{{% /alert %}}

