CAP theorem:

It is a concept in distributed systems that states that it is impossible for a distributed system to simultaneously provide all three of the following guarantees:

- Consistency: All clients see the same data at all times.
- Availability: All clients can access the data at all times.
- Partition tolerance: The system continues to function correctly even when network partitions occur.

In other words, a distributed system can only guarantee two of the three guarantees at the same time. This theorem is often used to help designers of distributed systems make trade-offs between consistency, availability, and partition tolerance.
