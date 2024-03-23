# Create a key for replica set secure intercommunication

```
openssl rand -base64 756 > replica.key
chmod 600 replica.key
sudo chown 999:999 replica.key

wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-03/exercises/mongo-replicaset/.env
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-03/exercises/mongo-replicaset/docker-compose.yaml
wget https://github.com/shivanand-patil/TheDataSeminar/raw/main/Week-03/exercises/mongo-replicaset/mongodb_rs_init.sh

chmod +x mongodb_rs_init.sh
```
