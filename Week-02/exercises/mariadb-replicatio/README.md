https://mariadb.org/mariadb-semi-sync-replication-using-containers/

```
docker compose up -d

docker compose ps

docker compose down --remove-orphans
```

Check that semi-sync is enabled using the mariadb client

```
docker exec -it mariadb-primary mariadb -uroot -psecret -e "select @@rpl_semi_sync_master_enabled;"
```

Check the rpl_semi_sync_master_timeout variable (default 10 [s]). When this time elapses and the primary doesn’t get any acknowledgment from the replica, it switches back to asynchronous replication.

```
docker exec -it mariadb-primary mariadb -uroot -psecret -e "select @@rpl_semi_sync_master_timeout;"
```

Check primary status (check position in the binlog as well as the name of the binlog).

```
docker exec mariadb-primary mariadb -uroot -psecret -e "show master status\G;"
```

Check databases for replication

```
docker exec -it mariadb-primary mariadb -uroot -psecret -e "show databases like '%test%'";
```

Check binary logs

```
docker exec --workdir /var/lib/mysql mariadb-primary bash -c "ls maria*"
```

The same can be seen from the mariadb client

```
docker exec mariadb-primary mariadb -uroot -psecret -e "show binary logs\G;"
```

example of fresh start

```
docker exec mariadb-primary mariadb-binlog /var/lib/mysql/mariadb-bin.000002
```

Check replica’s status

```
docker exec -it mariadb-replica-1 mariadb -uroot -psecret -e "select @@rpl_semi_sync_slave_enabled;"

docker exec -it mariadb-replica-2 mariadb -uroot -psecret -e "select @@rpl_semi_sync_slave_enabled;"
```

Check replicated database

```
docker exec -it mariadb-replica-1 mariadb -uroot -psecret -e "show databases like '%test%'";
docker exec -it mariadb-replica-2 mariadb -uroot -psecret -e "show databases like '%test%'";
```

Start replicating

We will perform 2 transactions.
For each transaction we will check
the primary status query (status below),

validate the binlog using the mariadb-binlog client (binlog below),
results of replication, validated on the replica (replica below).

Transaction 1: create table t(t int)
Status (we get the new name of the file and the current position in the binlog)

```
docker exec -it mariadb-primary mariadb -uroot -psecret -e "show master status;"
docker exec mariadb-primary mariadb-binlog /var/lib/mysql/mariadb-bin.000002

docker exec -it mariadb-replica-1 mariadb -uroot -psecret -e "show replica status \G;"
docker exec -it mariadb-replica-2 mariadb -uroot -psecret -e "show replica status \G;"

INSERT MORE VALUES

docker exec -it mariadb-replica-1 mariadb -uroot -psecret -e "use testdb; show tables; show create table t;"

docker exec -it mariadb-replica-2 mariadb -uroot -psecret -e "use testdb; show tables; show create table t;"


docker exec -it mariadb-primary mariadb -uroot -psecret -e "show master status;"

docker exec -it mariadb-replica-2 mariadb -uroot -psecret -e "select * from testdb.t"
docker exec -it mariadb-replica-1 mariadb -uroot -psecret -e "select * from testdb.t"
```
