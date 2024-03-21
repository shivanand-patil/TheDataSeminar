# TheDataSeminar Notes WEEK-1

## Authentication vs Authorization

### Authentication (AuthN)
Authentication is the process of verifying the identity of a user or entity attempting to access a system or resource. It ensures that the user is who they claim to be. Authentication typically involves presenting credentials, such as a username and password, to verify identity.

**Real-life Example:**
When you log in to your email account by providing your username and password, the system verifies that the credentials match the stored information associated with your account. If they match, you are authenticated and granted access to your inbox.

### Authorization (AuthZ)
Authorization, on the other hand, is the process of determining what actions a user or entity is allowed to perform after they have been authenticated. It involves granting or denying access to specific resources or functionalities based on the permissions assigned to the user.

**Real-life Example:**
In a banking application, after successfully logging in, you may be authorized to view your account balance, make transfers within your account, but not authorized to perform administrative tasks such as adding new users to the system.

## SQL vs NoSQL

### SQL (Structured Query Language)
SQL databases are relational databases that use a structured schema and a query language (SQL) to store and manage data. They organize data into tables with rows and columns, and relationships between tables are established using foreign keys.

**Real-life Example:**
A classic example of a SQL database is an e-commerce platform where customer information, product details, and order data are stored in structured tables with predefined schemas. MySQL and PostgreSQL are popular examples of SQL databases.

### NoSQL (Not Only SQL)
NoSQL databases are non-relational databases that provide flexible schema design and scalability. They can handle unstructured or semi-structured data and are well-suited for use cases requiring high availability and horizontal scalability.

**Real-life Example:**
A social media platform like Facebook uses a NoSQL database to store vast amounts of user-generated content, such as posts, comments, and likes. The flexible schema of a NoSQL database allows for easy storage and retrieval of diverse data types.

## Steps for SQL

1. **Decide the Schema**: Define the structure of the database including tables, columns, and relationships between tables.
   
2. **Write the Data**: Insert data into the tables based on the defined schema.

## Schema on Read vs Schema on Write

**Schema on Read**
- NoSQL databases often employ a schema-on-read approach, where data is stored without a predefined schema. Instead, the schema is interpreted or applied when data is read from the database.
- For example, In the farm house where we're dealing with NoSQL databases, which often employ a schema-on-read approach, the situation is more flexible and adaptable. This is analogous to maintaining and cooking a pork dish on the farm. Here, you have more space and resources at your disposal, allowing for a more relaxed and flexible approach to cooking. You might not have a predefined recipe or strict guidelines to follow. Instead, you can adapt to the ingredients and cooking methods available at the farm. For example, you might decide to use different parts of the pig depending on what is available or what suits your taste at the moment. You can experiment with different cooking techniques and seasonings without being constrained by a predefined recipe.

**Schema on Write**
- SQL databases follow a schema-on-write approach, where the schema must be defined and enforced at the time of writing data to the database.
- On the other hand, In the small kitchen of Dombey-Valley Town, let's imagine we're dealing with SQL databases, which follow a schema-on-write approach. This is akin to preparing and cooking a pork dish. In this scenario, you have limited resources and space, so you must carefully plan and organize the ingredients and cooking process before starting. Before you even start cooking, you need to decide on the recipe, gather all the necessary ingredients (pork, seasoning, vegetables, etc.), and prepare them according to the predefined recipe (schema). Once everything is ready, you cook the pork dish following the exact steps outlined in the recipe, ensuring that every ingredient is used as intended.

In summary, Schema on Write (SQL) requires careful planning and adherence to predefined schemas, similar to cooking in a small kitchen with limited resources. Schema on Read (NoSQL), on the other hand, offers more flexibility and adaptability, allowing for experimentation and improvisation, much like cooking in a farm house where you have more freedom to use different ingredients and cooking methods.

## MongoDB Docker Compose Example  [click-here](Week-01/mongodb/docker-compose.yaml)

```yaml
version: '3.1'

services:
  mongo:
    image: mongo
    restart: always
    ports:
      - 27017:27017
    environment:
      MONGO_INITDB_ROOT_USERNAME: nilesh
      MONGO_INITDB_ROOT_PASSWORD: A12345

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

# Mongo Docker Compose Configuration, what does it do

## MongoDB Service

- **mongo**:
  - This service uses the `mongo` image, which is a MongoDB database.
  - It's configured to restart automatically (`restart: always`).
  - Port 27017 on the host machine is mapped to port 27017 on the container (`ports: - 27017:27017`).
  - Environment variables are set to initialize the MongoDB database:
    - `MONGO_INITDB_ROOT_USERNAME` is set to "nilesh".
    - `MONGO_INITDB_ROOT_PASSWORD` is set to "A12345".

## MongoDB Express Service

- **mongo-express**:
  - This service uses the `mongo-express` image, which is a web-based MongoDB admin interface.
  - It's also configured to restart automatically (`restart: always`).
  - Port 8082 on the host machine is mapped to port 8081 on the container (`ports: - 8082:8081`).
  - Environment variables are set to configure access to the MongoDB database:
    - `ME_CONFIG_MONGODB_ADMINUSERNAME` is set to "nilesh".
    - `ME_CONFIG_MONGODB_ADMINPASSWORD` is set to "A12345".
    - `ME_CONFIG_MONGODB_URL` specifies the connection URL to the MongoDB database.
    - `ME_CONFIG_OPTIONS_EDITORTHEME` sets the theme for the Mongo Express editor.
    - `ME_CONFIG_BASICAUTH_USERNAME` and `ME_CONFIG_BASICAUTH_PASSWORD` are set for basic authentication.

This configuration sets up a MongoDB database and a web-based admin interface for managing it, with appropriate environment variables for authentication and access configuration.


## Mariadb Docker Compose Example [click-here](Week-01/mariadb/docker-compose.yaml)

```yaml
# Use root/example as user/password credentials
version: "3.1"

services:
  mariadb:
    image: mariadb
    restart: always
    ports:
      - 3306:3306
    environment:
      MARIADB_ROOT_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8082:8080
```

# Mariadb Docker Compose Configuration, what does it do


## MariaDB Service

- **mariadb**:
  - This service uses the `mariadb` image, which sets up a MariaDB database server.
  - It's configured to restart automatically (`restart: always`).
  - Port 3306 on the host machine is mapped to port 3306 on the container (`ports: - 3306:3306`).
  - An environment variable `MARIADB_ROOT_PASSWORD` is set to "example", specifying the root password for the MariaDB database server.

## Adminer Service

- **adminer**:
  - This service uses the `adminer` image, which is a web-based database management tool.
  - It's also configured to restart automatically (`restart: always`).
  - Port 8082 on the host machine is mapped to port 8080 on the container (`ports: - 8082:8080`).

# JSON and BSON

- **JSON (JavaScript Object Notation)**: A lightweight data interchange format that is easy for humans to read and write. JSON is commonly used for transmitting data between a server and a web application.

- **BSON (Binary JSON)**: BSON is a binary-encoded serialization of JSON-like documents used in MongoDB. It extends JSON with additional data types and optimizations for storage and data retrieval in MongoDB.

**Resource:** [MongoDB BSON Basics](https://www.mongodb.com/basics/bson)
