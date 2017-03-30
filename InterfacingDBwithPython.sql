### Interfaceing with Databases from python

### Python Code <---> DBMS
### Need to import a database library such as SQLITE3
### Connect to a specific database
### Get a cursor (like session) on that particular session.
### Run SQL commands on that connection
### COMMIT any writes to the DB or else they will not be saved. Then close the connection
### Remeber the ACID properties: Atomicity, Consistency, Isolation, Durability
### Atomicity: A group of actions are all or nothing
### Ensured by comitting your writes.
### If you are only reading then there is no need to commit.


###