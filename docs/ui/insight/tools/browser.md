---
title: Browser
linkTitle: Browser
description: Visualize and manage your data structures
weight: 10

---

**Browser** allows you to visualize and interact with the data stored in your Redis and Redis Stack database.

With the **Browser** tool, you can: 

* Explore Redis keys, their values, and metadata
* Perform create, read, update, and delete (CRUD) operations on strings, hashes, sets, sorted sets, lists, streams, and JSON.
* Navigate through and analyze your list of keys quicker by grouping keys per their namespaces using the Tree view, or use filters per key name or Redis data type to find the keys you need.

<img src="../../images/Browser.png">

The Browser tool also helps you observe, validate, and manage your key values in a human-readable format using formatters that prettify and highlight data in different formats (for example, Unicode, JSON, MessagePack, HEX, ASCII, an so on), as well as automatically decompress your data to display it in a human-readable format, supporting GZIP, LZ4, SNAPPY, and other compressions.

<img src="../../images/data_formatting.png">

Leverage the [Search capabilities](/docs/ui/insight/tools/search) to see and work with found keys and their values, or use a dedicated form to create a secondary index.

Delete keys in bulk from your Redis or Redis Stack database based on the filters set in Browser using [Bulk actions](/docs/ui/insight/tools/bulk-actions).

