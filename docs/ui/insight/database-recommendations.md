---
title: Database recommendations
linkTitle: Database recommendations
description: Optimize usage of Redis databases
weight: 40

---

RedisInsight provides database recommendations to enable you to use your databases more efficiently, leading to performance increase and memory usage optimization.

## Avoid dynamic Lua script

### Conditions

Used_memory_lua > 3,000,000 (3M) bytes

### Recommendations

* Avoid dynamic Lua script 
* Refrain from generating dynamic scripts, which can cause your Lua cache to grow and get out of control. Memory is consumed as scripts are loaded. If you have to use dynamic Lua scripts, then remember to track your Lua memory consumption and flush the cache periodically with a `SCRIPT FLUSH`
* Do not hardcode and/or programmatically generate key names in your Lua scripts because it makes them useless in a clustered Redis setup.

## Switch to 32-bits

### Conditions

* Data is stored in 64-bits.
* The database is less than 3 GB.

### Recommendations

When you set an expiry on a key, Redis does not expire it at that instant, which consumes memory to hold keys that have already expired. 

Follow one of these steps to reclaim the memory: 

* Restart your redis-server. 
* Increase `memorysamples` in `redis.conf` (default is `5`, max is `10`) so that expired keys are reclaimed faster. Keep in mind that increasing it costs more CPU cycles and affects the latency of commands. 
* Set up a cron job that runs the scan command after an interval, which helps to reclaim the memory of the expired keys. 
* Increase the expiry of keys.

## Reclaim expired keys' memory faster

### Conditions

1. Run the `INFO` command and find the `total_memory_used` and sum of all the keys for all the databases.
1. Then take a Redis Dump (RDB) and find out the total memory and the total number of keys.
1. If the difference is more than 5%, (keys in Redis - keys in the RDB)/keys in Redis > 5%), RedisInsight displays the recommendation.

### Recommendations

Reclaim expired keys' memory faster.

## Change serializer

### Conditions

The following regular means of serializing are detected:

* JSON Serializer
* Java serialized objects
* Python Pickle
* PHP Serializer
* Unknown Serializer

### Recommendations

Redis stores serialized objects as byte arrays, so regular means of serializing can be of larger size, impacting the memory consumption and latency. Instead of using the default serializer of your programming language, switch to another library like Protocol Buffers, MessagePack, and so on.

## Combine small strings to hashes

### Conditions

The following conditions are met:

* More than 1000 strings whose values are not encoded.
* The key size is smaller than 200 bytes.

### Recommendations

Strings data type has an overhead of about 90 bytes on a 64-bit machine. If different expiration values for these keys are not required, combine small strings into a larger hash to optimize the memory usage. Also, ensure that the hash has less than `hash-max-ziplist-entries` elements, and the size of each element is within `hash-max-ziplist-values` bytes. This approach should not be used if you need different expiration values for string keys.

## Convert hashtable to ziplist for hashes

### Conditions

* Number of hash entries exceeds `hash-max-ziplist-entries`.
* Number of bytes for the string value exceeds `hash-max-ziplist-values`.

### Recommendations

Increase `hash-max-ziplist-entries` and/or `hash-max-ziplist-values` (display the numbers calculated). 
If any value for a key exceeds `hash-max-ziplist-entries` or `hash-max-ziplist-values`, it is stored automatically as a hashtable instead of a ziplist, which consumes almost double the memory. 
To save the memory, increase the configurations and convert your hashtables to ziplists. The trade-off can be an increase in latency and possibly an increase in CPU utilization.

## Convert hashtable to ziplist for sorted sets

### Conditions

* Number of sorted set members exceeds `zset-max-ziplist-entries`.
* Number of bytes for the string member exceeds `zset-max-ziplist-values`.

### Recommendations

Increase `zset-max-ziplist-entries` and/or `zset-max-ziplist-values` (display the numbers calculated). 
If any value for a key exceeds `zset-max-ziplist-entries` or `zset-max-ziplist-values`, it is stored automatically as a hashtable instead of a ziplist, which consumes almost double the memory. 
To save the memory, increase the configurations and convert your hashtables to ziplists. The trade-off can be an increase in latency and possibly an increase in CPU utilization.

## Switch from set to IntSet

### Conditions

Found set values that contain strings.

### Recommendations

Sets that contain only integers are extremely efficient memory-wise. Try to use integers. Map string identifiers to integers, by either using `enum`s in your programming language or using a Redis hash data structure to map values to integers. Once you switch to integers, Redis uses the `IntSet` encoding internally. The `IntSet` encoding is extremely memory efficient. By default, the value of `set-max-intset-entries` is `512` and is configurable in `redis.conf`. However, increasing this value leads to an increase in latency of set operations and CPU utilization. To verify the latency numbers, run `INFO COMMANDSTATS` before and after making this change.

## Increase the set-max-intset-entries

### Conditions

Found sets with length > `set-max-intset-entries`.

### Recommendations

Several set values with `IntSet` encoding exceed the `set-max-intset-entries`. To efficiently use the `IntSet` encoding, change the configuration in `redis.conf`. Note that increasing this value leads to an increase in latency of set operations and CPU utilization. To verify the latency numbers, run `INFO COMMANDSTATS` before and after making this change.

## Use smaller keys

### Conditions

The database has 1M+ keys.

### Recommendations

Shorten key names to optimize memory usage. Even though descriptive key names are better, large key names consume memory.

## Convert to a list instead of a hash

### Conditions

* Hash length > 5,000.
* FT.SEARCH is not loaded or there is no index created.

### Recommendations

A Redis hash stores field names and values. 
If you have thousands of small hash objects with similar field names, the memory used by field names adds up. 
To prevent this, consider using a Redis list instead of a hash. 
Convert field names into indexes in the list. 
While this may save memory, you should only use this approach if you have thousands of hashes and if each of those hashes has similar fields. 
However, this approach is not recommended when you have more than 512 fields in your hash, or the size of your hash values is not consistent (for instance, when some hashes contain only a few field-value pairs while others contain many).

## Shard big hashes to small hashes

### Conditions

Found hashes with length > 5,000.

### Recommendations

If you have a hash with a large number of key/value pairs, and if each key/value pair is small enough, break it into smaller hashes to save memory. To shard a `HASH` table, choose a method of partitioning the data. Hashes themselves have keys that can be used for partitioning the keys into different shards. The number of shards is determined by the total number of keys to be stored and the shard size. Using this and the hash value you can determine the shard ID in which the key resides. Note that converting big hashes to small hashes increases the complexity of your code.

## Compress Hash field names

### Conditions

Hash length > 5,000.

### Recommendations

Hash field name also consumes memory, so use smaller or shortened field names to reduce memory usage.

## Compress values

### Conditions

The difference between the actual and compressed values is more than 5%.

### Recommendations

Compress the data before storing it in Redis to optimize the memory (sometimes even between 30-50%), increase the throughput, reduce the payload, and decrease latency. There are several compression algorithms to choose from, each with its trade-offs. Snappy aims for high speed and reasonable compression. LZO compresses fast and decompresses faster. Others, such as Gzip, are more widely available. To avoid CPU increases, do not compress short strings and unstructured data.

## Enable compression for the list

### Conditions

The difference between actual and compressed values is more than 5%.

### Recommendations

If you use long lists and mostly access elements from the head and tail only, you can enable compression.
To compress every list node except the head and tail of the list, in `redis.conf` set `list-compression-depth=1`. Even though list operations that involve elements in the center of the list become slower, the compression can increase CPU utilization.
Run `INFO COMMANDSTATS` before and after making this change to verify the latency numbers.

## Do not open a new connection for every request/command

### Conditions

Connected_clients > 100

### Recommendations

When the value of your `total_connections_received` in the stats section is high, it usually means that your application is opening and closing a connection for every request it makes. 
Opening a connection is an expensive operation that adds to both client and server latency. 
To rectify this, consult your Redis client documentation and configure your Redis to use persistent connections.

## Rename or disable dangerous commands

### Conditions

One of the commands from `ACL CAT @dangerous` is not disabled or renamed.

### Recommendations

`{commands}` are currently not renamed or disabled for your instance. 
Carefully manage these commands. 
Consider renaming or disabling them, especially for the production environment.

## Do not store large strings

### Conditions

String length > 5M bytes is found.

### Recommendations

Avoid storing large strings, because transferring them takes time and consumes the network bandwidth. Large keys are acceptable only to read/write portions of the string.

