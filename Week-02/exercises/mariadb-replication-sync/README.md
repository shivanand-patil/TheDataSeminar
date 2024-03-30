# Full synchronous replication

## Planned:

https://jira.mariadb.org/browse/MDEV-19140

## Another option - Galera:

- https://mariadb.com/kb/en/galera-cluster/
- https://mariadb.com/kb/en/getting-started-with-mariadb-galera-cluster/
- https://mariadb.org/ha-minifest2021/automate/

### Using ansible:

- https://github.com/mrlesmithjr/ansible-mariadb-galera-cluster

MariaDB/MySQL Galera Cluster using ansible:

This is Active-active cluster, where every node is read-write and a change made to one is replicated to all.

Prerequisites:

- Three fresh ubuntu nodes with ansible machine able to ssh cluster nodes with open ports

```
sudo ufw status
sudo ufw allow ssh
sudo ufw allow 3306,4567,4568,4444/tcp
sudo ufw allow 4567/udp
```

Steps:

```
conda env list
conda env remove --name galera -y
conda create python=3.11 -y --name galera
conda activate galera

pip install ansible
pip install netaddr

rm -rf roles collections ~/.ansible
ansible-galaxy install -r requirements.yaml --force

ansible all -m ping
ansible all -a "apt-get update"
ansible all -a "apt-get install ufw -y"
ansible all -a "ufw status"
ansible all -a "ufw allow 3306,4567,4568,4444/tcp"
ansible all -a "ufw allow 4567/udp"
ansible all -a "ufw status"
ansible all -a "ufw allow ssh"
ansible all -a "ufw show added"
ansible all -a "ufw --force enable"
ansible all -m ping

ansible-playbook main.yaml
```

### Now, test this galera cluster for sync replication

```
Create database and insert data into dB to verify that replication is working.


- on Node 1:

mysql -uroot -proot

create database galeratest;

- on Node 2

mysql -uroot -proot

USE galeratest;

CREATE TABLE `t` (
  `t` char(15) NOT NULL
);

INSERT INTO `t` (`t`)
VALUES ('Nilesh');

INSERT INTO `t` (`t`)
VALUES ('Ayaan');

INSERT INTO `t` (`t`)
VALUES ('Vikas');

INSERT INTO `t` (`t`)
VALUES ('Sahil');

INSERT INTO `t` (`t`)
VALUES ('Shivanand');


- on Node 3:

mysql -uroot -proot

USE galeratest;
select * from t;


```

### Manually:

- https://www.digitalocean.com/community/tutorials/how-to-configure-a-galera-cluster-with-mariadb-on-ubuntu-18-04-servers
