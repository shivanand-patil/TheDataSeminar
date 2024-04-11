## Docker Compose Configuration

### MongoDB Service

```yaml
services:
  mongo:
    image: mongo
    restart: always
    ports:
      - 27017:27017
    environment:
      MONGO_INITDB_ROOT_USERNAME: nilesh
      MONGO_INITDB_ROOT_PASSWORD: A12345
```
- Image: Specifies the Docker image to use for the mongo service, which is the official MongoDB image from Docker Hub.

- Restart Policy: Set to always, meaning Docker will always attempt to restart the container if it stops for any reason.
  
- Port Mapping: Maps host port 27017 to container port 27017, allowing external communication with MongoDB.
  
- Environment Variables: Defines MongoDB root username and password.


### MongoDB Express Service

```yaml
mongo-express:
  image: mongo-express
  restart: always
  ports:
    - 8082:8081
  environment:
    ME_CONFIG_MONGODB_ADMINUSERNAME: nilesh
    ME_CONFIG_MONGODB_ADMINPASSWORD: A12345
    ME_CONFIG_MONGODB_URL: mongodb://nilesh:A12345@mongo:27017/
    ME_CONFIG_OPTIONS_EDITORTHEME: "ambiance"
    ME_CONFIG_BASICAUTH_USERNAME: "nilesh"
    ME_CONFIG_BASICAUTH_PASSWORD: "A12345"
```

- Image: Specifies the Docker image to use for the mongo-express service, which is the official MongoDB Express image.
- Restart Policy: Set to always, similar to the MongoDB service.
- Port Mapping: Maps host port 8082 to container port 8081, allowing access to MongoDB Express from a web browser.
- Environment Variables: Configure MongoDB Express interface settings, including admin username, password, connection URL, editor theme, and basic authentication credentials.

## Run Docker-Compose

Run the following command to start the services defined in the [docker-compose.yml](docker-compose.yaml) file:

```bash
docker-compose up -d
```

  
