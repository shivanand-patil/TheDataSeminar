### Create a key for replica set secure intercommunication

```
openssl rand -base64 756 > replica.key
chmod 600 replica.key
sudo chown 999:999 replica.key
```

### Gather the files needed

```
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-04/exercises/mongo-replicaset/.env
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-04/exercises/mongo-replicaset/docker-compose.yaml
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-04/exercises/mongo-replicaset/mongodb_rs_init.sh

chmod +x mongodb_rs_init.sh
```

### Bring up the replica set

```
docker compose down --remove-orphans
sudo rm -rf volumes/
docker compose up -d
docker compose logs -f mongo-setup
docker compose logs -f mongo-express
```

### Test the replication status

```
docker compose exec -it mongod1 mongosh -u "nilesh" -p "A12345"  --eval "rs.status();"

```

### replicaSet is already initiated via that script so don't need to reinitiate

```
docker compose exec -it mongod1 mongosh -u "nilesh" -p "A12345" --quiet --eval "rs.initiate();"

docker compose exec -it mongod1 mongosh -u "nilesh" -p "A12345" --quiet --eval "rs.initiate();" --json relaxed
```

### Connection string

```

mongodb://nilesh:A12345@cosmos.cg.home.arpa:27017/?authSource=admin

mongodb://nilesh:A12345@cosmos.cg.home.arpa:27017,cosmos.cg.home.arpa:27018,cosmos.cg.home.arpa:27019/?
authSource=admin&replicaSet=dbrs

mongodb://cosmos.cg.home.arpa:27017,cosmos.cg.home.arpa:27018,cosmos.cg.home.arpa:27019/?replicaSet=dbrs

```

### Misc

```
mongosh

use admin;
db.auth("nilesh","A12345");

db.createUser({user:"user",pwd:"pass",roles:["clusterAdmin","readWriteAnyDatabase","dbAdminAnyDatabase","userAdminAnyDatabase"]});
```

### destroy

```
docker compose down --remove-orphans
sudo rm -rf volumes/
```
