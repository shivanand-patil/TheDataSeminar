# MongoDB

MongoDB is a popular, open-source, NoSQL database management system designed for scalability, flexibility, and high performance. It is a document-oriented database, which means it stores data in flexible, JSON-like documents, making it easier to model and manage complex data structures compared to traditional relational databases.


## Getting Started
To get started with MongoDB, you can  [perform this mongo docker exercise](exercises/mongo) 
- Refer to the [MongoDB Documentation](https://docs.mongodb.com/) for detailed guides, tutorials, and reference materials.
- [MongoDB GitHub Repository](https://github.com/mongodb/mongo)

**MongoDB Replica Set**

MongoDB Replica Set is a distributed database architecture that provides high availability and data redundancy by maintaining multiple copies of data across multiple servers. It consists of multiple MongoDB instances, called members, organized into a replica set.

**Example Configuration:**

```yaml
# MongoDB Replica Set Configuration
replication:
  replSetName: "myReplicaSet"
  members:
    - _id: 0
      host: mongodb1.example.com:27017
    - _id: 1
      host: mongodb2.example.com:27017
    - _id: 2
      host: mongodb3.example.com:27017
```

### Differences between MongoDB standalone and replica set:

- MongoDB Standalone:

Use standalone for development or small, low-traffic deployments.

Think of a standalone as a single shelf holding your stuff. If the shelf breaks, you lose everything.

This is the simplest deployment option. A single server instance (mongod) stores all your data. Offers basic functionality but lacks redundancy and scalability. Suitable for development environments or small datasets with low traffic.

- MongoDB Replica Set:

PSA architecture (primary, secondary, arbiter)

A replica set is like having multiple copies of your stuff on different shelves. If one shelf breaks, you still have your stuff on the others.

Use replica sets for most production deployments for redundancy and high availability.



A group of mongod instances working together for data redundancy and high availability. One node is the primary, receiving writes and replicating them to secondary nodes. If the primary fails, a secondary is elected automatically to minimize downtime. Provides data protection and improved read performance (depending on configuration). Recommended for most production deployments.

[perform this mongo replicaset docker exercise](exercises/mongo-replicaset)
