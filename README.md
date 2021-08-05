# Order Service for Tumpang

## Features
Order Service allows users to browse tumpangs, and create order. It features functionality to let people hitch onto your deliver or to hitch on others' delivery.
Features like Tumpang History is also available.

Having these done, order service keeps track of emission history that will be shown in the intervals of month.

This microservice also communicates with two other services - User Service and Restaurant Service to do implicit updates needed.

## Environment Variables
```local_env.yml``` 
- ```RDS_USER```
    - Your postgres username
- ```RDS_PASSWORD```
    - Your postgres password
- ```RDS_ENDPOINT```
    - Connection endpoint to connect to your postgres database
- ```AWS_ACCESS_KEY```
    - 
- ```AWS_SECRET_KEY```
    - 
- ```AWS_REGION```
    - The configured AWS region in your instance
- ```USER_SERVICE_ID```
    - 
- ```OPEN_ROUTES_API_KEY```
    - The key to access Open Routes Service API
- ```BING_MAPS_KEY```
    - The key to access Bing Maps Service API
 
File format:
```sh
RDS_USER: 
RDS_PASSWORD: 
RDS_ENDPOINT: 

AWS_ACCESS_KEY:
AWS_SECRET_KEY: 
AWS_REGION:
USER_SERVICE_ID: 

OPEN_ROUTES_API_KEY: 
BING_MAPS_KEY:

```

## Dependencies
1. Ensure you have PostgresQL running
2. Configure ```config/local_env.yml``` with above environment variables in order for your service to work.
3. Ensure that you have setup the database migrations 
  ```sh
  rails db:create db:migrate
  ```
