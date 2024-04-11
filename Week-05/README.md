## DB Backup and Recovery

Database backup and recovery are essential components of a robust data management strategy, ensuring data integrity, availability, and disaster recovery.

**Backup:**
- Regular backups are crucial to prevent data loss in the event of hardware failures, human errors, or cyberattacks.
- Backups can be classified into physical and logical backups.
  - **Physical Backup:** Physical backups involve copying the entire database files, including data files, control files, and redo logs. These backups are taken at the filesystem level and are platform-dependent. Physical backups are typically faster to create and restore but may require more storage space compared to logical backups.
  - **Logical Backup:** Logical backups capture the database's logical structure and data in a format independent of the physical structure. Common methods for logical backups include database dumps or exports in formats like SQL or CSV. While logical backups are more flexible and portable, they may take longer to create and restore compared to physical backups.

**Recovery:**
- Recovery processes aim to restore the database to a consistent state after a failure or data loss event.
- Recovery methods vary depending on the type of backup and the severity of the incident. Common recovery techniques include point-in-time recovery, roll-forward recovery, and roll-backward recovery.
- Testing backup and recovery procedures regularly is essential to ensure their effectiveness and minimize downtime during real-world incidents.


## Data Partitioning and Sharding

Data partitioning and sharding are strategies used to horizontally scale databases and improve performance and availability for large-scale applications.

**Data Partitioning:**
- Data partitioning involves dividing a large dataset into smaller, more manageable partitions or shards.
- Partitioning can be based on various criteria such as range, hash, list, or composite methods.
- Partitioning improves query performance by distributing data across multiple nodes, reducing the load on individual servers.
- It also enhances data availability and fault tolerance since the failure of one partition does not affect the entire dataset.

**Sharding:**
- Sharding is a specific implementation of data partitioning in distributed databases.
- In sharding, each shard is stored on a separate database server or node, allowing for parallel processing of queries and transactions.
- Sharding is particularly useful for applications with high write and read throughput requirements.
- However, sharding introduces complexities such as data distribution, shard management, and query routing, which must be carefully managed to ensure system reliability and performance.

![Partioning and Sharding](https://res.cloudinary.com/dxnufruex/image/upload/c_limit,q_auto,w_1200/v1671666242/macrometa-web/images/6347a20e8598ff81de4fc4f7_QVjhYNKEHaJ3ZumpY0xicg19Tqoj0vHOVEHklTYHI65E9oG-t9sg0hZcokmdJI26_VDNkbnynbNvvF0Rl6Crx8cqq_Ffq129xsPbykCGqE8LLwPkKDaJ2zUQNJ0H55otwnNMi8IDEPE8ki4nPULl1RY6VLhh2DrsuuRs2fx0tNr9UyBOq0RAg0SLOg.png)


### CAP theorem:

It is a concept in distributed systems that states that it is impossible for a distributed system to simultaneously provide all three of the following guarantees:

- Consistency: All clients see the same data at all times.
- Availability: All clients can access the data at all times.
- Partition tolerance: The system continues to function correctly even when network partitions occur.

In other words, a distributed system can only guarantee two of the three guarantees at the same time. This theorem is often used to help designers of distributed systems make trade-offs between consistency, availability, and partition tolerance.

Discover insights from Eric Brewer, the original architect of the CAP theorem, in his own blog

```bash
https://cloud.google.com/blog/products/databases/inside-cloud-spanner-and-the-cap-theorem
```
