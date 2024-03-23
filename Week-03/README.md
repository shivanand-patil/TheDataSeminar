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

### MongoDB Replica Sets and MongoDB Sharded cluster

In MongoDB, replica sets are groups of mongod instances that maintain identical copies of your data, ensuring high availability, redundancy, and fault tolerance. They are the foundation for most production deployments, offering several key benefits:

- High Availability: If the primary mongod instance (which handles writes) fails, a secondary member is automatically elected to become the new primary, minimizing downtime and maintaining data accessibility for your applications.
- Redundancy: By replicating data across multiple members, replica sets provide a safety net in case of hardware failures or data corruption.
- Scalability: You can add or remove members from a replica set to adjust to changing read and write workloads.
- Scalable Reads: You can configure replica sets to allow reads from secondary members, offloading read queries from the primary and improving overall performance.

Key Components of a Replica Set:

- Primary: The single member responsible for accepting write operations and replicating them to the secondaries.
- Secondary: Members that maintain copies of the data from the primary and are eligible for election as the new primary in case of a primary failure.
- Arbiter: An optional member (often with voting rights set to 0) that helps break ties during primary elections, ensuring a smooth transition.
- Replica Set Configuration (replset.config): Defines the members of the replica set and their roles.
- Operation Log (oplog): A capped collection on the primary that stores all write operations applied to the data. Secondaries continuously replicate the oplog to maintain consistency.

Transactions (Not Supported in Replica Sets)

While replica sets offer high availability, they do not natively support ACID (Atomicity, Consistency, Isolation, Durability) transactions across multiple documents. If you need transactional guarantees, consider using MongoDB sharding with a dedicated replica set for each shard.

Change Streams (Available in MongoDB 3.6+):

Change streams provide a mechanism to capture data modifications in real-time. You can configure a change stream on a replica set to receive notifications whenever documents are inserted, updated, or deleted. This is useful for building applications that react to data changes, such as data replication to other systems, materialized views, or real-time dashboards.

Accessing the Oplog:

The oplog is an internal mechanism primarily used for replication within the replica set. While it's generally not recommended to access the oplog directly for application logic, you can use the $currentOp aggregation pipeline stage to view ongoing operations on the primary. However, exercise caution as this can impact performance.

Replica Sets vs. Sharding

Replica sets and sharding are two distinct scaling approaches in MongoDB:

Replica sets provide high availability and redundancy by replicating data across multiple members. They are ideal for deployments where data consistency and failover are the primary concerns.

Sharding enables horizontal scaling by distributing data across multiple shards (replica sets or standalone mongod instances) based on a shard key. This is suitable for very large datasets or high write workloads that a single replica set might struggle with.

In conclusion, MongoDB replica sets are a core concept for ensuring data availability and redundancy in your deployments. They work seamlessly to maintain data consistency and provide seamless failover in case of primary failures.
