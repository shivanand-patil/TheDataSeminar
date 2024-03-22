### CAP theorem:

It is a concept in distributed systems that states that it is impossible for a distributed system to simultaneously provide all three of the following guarantees:

- Consistency: All clients see the same data at all times.
- Availability: All clients can access the data at all times.
- Partition tolerance: The system continues to function correctly even when network partitions occur.

In other words, a distributed system can only guarantee two of the three guarantees at the same time. This theorem is often used to help designers of distributed systems make trade-offs between consistency, availability, and partition tolerance.

### Differences between MongoDB standalone, replica set, and sharded cluster:

- MongoDB Standalone:

Use standalone for development or small, low-traffic deployments.

Think of a standalone as a single shelf holding your stuff. If the shelf breaks, you lose everything.

This is the simplest deployment option. A single server instance (mongod) stores all your data. Offers basic functionality but lacks redundancy and scalability. Suitable for development environments or small datasets with low traffic.

- MongoDB Replica Set:

PSA architecture (primary, secondary, arbiter)

A replica set is like having multiple copies of your stuff on different shelves. If one shelf breaks, you still have your stuff on the others.

Use replica sets for most production deployments for redundancy and high availability.

A group of mongod instances working together for data redundancy and high availability. One node is the primary, receiving writes and replicating them to secondary nodes. If the primary fails, a secondary is elected automatically to minimize downtime. Provides data protection and improved read performance (depending on configuration). Recommended for most production deployments.

- MongoDB Sharded Cluster:

A sharded cluster is like having several rooms, each holding specific categories of your stuff. It provides more space and easier access for a massive collection.

Use sharded clusters for large-scale applications with significant data growth and high traffic.

A distributed database architecture for massive datasets and high traffic. Splits data across multiple servers (shards) based on a shard key. Enables horizontal scaling by adding more shards as data grows. Improves read and write performance by distributing workload across shards. More complex to set up and manage compared to replica sets. Ideal for large-scale applications with significant data growth.
