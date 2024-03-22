# Create a key for replica set secure intercommunication

```
openssl rand -base64 756 > replica.key
chmod 600 replica.key
sudo chown 999:999 replica.key
```
