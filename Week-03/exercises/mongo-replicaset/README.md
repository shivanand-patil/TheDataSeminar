# Create a key for replica set secure intercommunication

```
openssl rand -base64 756 > replica.key
chmod 600 replica.key
sudo chown 999:999 replica.key
```

Gather the files needed

```
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-03/exercises/mongo-replicaset/.env
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-03/exercises/mongo-replicaset/docker-compose.yaml
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-03/exercises/mongo-replicaset/mongodb_rs_init.sh

chmod +x mongodb_rs_init.sh
```

Bring up the replica set

```
docker compose down --remove-orphans
sudo rm -rf volumes/
docker compose up -d
docker compose logs -f mongo-setup
docker compose logs -f mongo-express
```

Test the replication status

```
docker compose exec -it mongod1 mongosh -u "nilesh" -p "A12345"  --eval "rs.status();"
```
