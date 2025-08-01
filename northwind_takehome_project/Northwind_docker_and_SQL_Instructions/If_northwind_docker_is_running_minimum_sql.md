If_northwind_docker_is_running_minimum_sql.md

##################################################################################
## Convention all the things I'm saying to type will be flush left with >>>     ##
##################################################################################


## Reminders

### We initailly ran it with this:

``` Bash
# Run the container (works for both architectures)

docker run -d -p 3307:3306 --name northwind \
  -e MYSQL_ROOT_PASSWORD=supersecret \
  manchestercodes/northwind

```

###  Connection Details for later usin in platforms

- **Host**: localhost
- **Port**: 3307  
- **Username**: root (Intel/AMD) or user (M1)
- **Password**: supersecret (Intel/AMD) or password (M1)
- **Database**: northwind


## Things to run when it is up:

If Northwind is up on Docker and it is running:

>>> docker ps                

CONTAINER ID   IMAGE                       COMMAND                  CREATED       STATUS        PORTS                                         NAMES
12ee7db86f78   manchestercodes/northwind   "docker-entrypoint.s…"   3 days ago    Up 13 hours   0.0.0.0:3307->3306/tcp, [::]:3307->3306/tcp   northwind


## Test Connection:

One way to connect - _Inside_ the Docker Container.  See [[additional_instructions_ for_ SQL_connection.md]]
You first open a shell _inside_ the container and then launch the MySQL client from there.

Open a terminal session inside the container:
    
>>> docker exec -it northwind bash
    
    
Your terminal prompt will change, indicating you are now inside the Docker container (e.g., root@<container_id>:/#).
Connect to the MySQL client:
    
>>> mysql -u root -p
    
It will prompt you for the password. Type 

>>> supersecret 

and press Enter. You should see output like the bellow.

		root@12ee7db86f78:/# mysql -u root -p
		Enter password: 
		Welcome to the MySQL monitor.  Commands end with ; or \g.
		Your MySQL connection id is 11
		Server version: 8.0.28 MySQL Community Server - GPL

		Copyright (c) 2000, 2022, Oracle and/or its affiliates.

		Oracle is a registered trademark of Oracle Corporation and/or its
		affiliates. Other names may be trademarks of their respective
		owners.

		Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

		mysql>
    
Run the SQL commands: Once you see the mysql> prompt, you can run the commands from the guide.md s


## Check Connection:

Run the SQL commands: Once you see the mysql> prompt, you can run the commands from the guide.
Remember to end commands with a ; , and that everything is case sensitive:
    
>>> SQL
>>>   USE northwind; 
>>>   SHOW TABLES;
>>>   SELECT COUNT() FROM customers;  -- Should return 29
>>>   SELECT COUNT() FROM products;   -- Should return 77
>>>   exit;
    
Exit the container:** After you type:exit; to leave MySQL, type exit again to close the container session and return to your Mac's terminal.


## To Exit

Exit the container:
** After you type:

>>> exit; 

to leave MySQL, type 

>>> exit 

again to close the container session and return to your Mac's terminal.

#############################
##  Optional queries:      ##
#############################


-- Show all databases
SHOW DATABASES;

-- Switch to a database
USE northwind;

-- Show current database
SELECT DATABASE();

mysql> SHOW DATABASES
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| northwind          |
| performance_schema |
| sys                |
+--------------------+

-- Show all tables in current database
SHOW TABLES;

	+-----------------------------+
	| Tables_in_northwind         |
	+-----------------------------+
	| customers                   |
	| employee_privileges         |
	| employees                   |
	| inventory_transaction_types |
	| inventory_transactions      |
	| invoices                    |
	| order_details               |
	| order_details_status        |
	| orders                      |
	| orders_status               |
	| orders_tax_status           |
	| privileges                  |
	| products                    |
	| purchase_order_details      |
	| purchase_order_status       |
	| purchase_orders             |
	| sales_reports               |
	| shippers                    |
	| strings                     |
	| suppliers                   |
	+-----------------------------+


We're going to need to describe the database schema to the LLMs, in one case we'll do it with a Query.
So:

mysql> SELECT 
    ->     TABLE_NAME,
    ->     COLUMN_NAME,
    ->     DATA_TYPE,
    ->     IS_NULLABLE,
    ->     COLUMN_DEFAULT,
    ->     COLUMN_KEY
    -> FROM INFORMATION_SCHEMA.COLUMNS 
    -> WHERE TABLE_SCHEMA = 'northwind'
    -> ORDER BY TABLE_NAME, ORDINAL_POSITION;
+-----------------------------+---------------------------+-----------+-------------+----------------+------------+
| TABLE_NAME                  | COLUMN_NAME               | DATA_TYPE | IS_NULLABLE | COLUMN_DEFAULT | COLUMN_KEY |
+-----------------------------+---------------------------+-----------+-------------+----------------+------------+
| customers                   | id                        | int       | NO          | NULL           | PRI        |
| customers                   | company                   | varchar   | YES         | NULL           | MUL        |
| customers                   | last_name                 | varchar   | YES         | NULL           | MUL        |
| customers                   | first_name                | varchar   | YES         | NULL           | MUL        |
| customers                   | email_address             | varchar   | YES         | NULL           |            |
| customers                   | job_title                 | varchar   | YES         | NULL           |            |
| customers                   | business_phone            | varchar   | YES         | NULL           |            |
| customers                   | home_phone                | varchar   | YES         | NULL           |            |
| customers                   | mobile_phone              | varchar   | YES         | NULL           |            |
| customers                   | fax_number                | varchar   | YES         | NULL           |            |
| customers                   | address                   | longtext  | YES         | NULL           |            |
| customers                   | city                      | varchar   | YES         | NULL           | MUL        |
| customers                   | state_province            | varchar   | YES         | NULL           | MUL        |
| customers                   | zip_postal_code           | varchar   | YES         | NULL           | MUL        |
| customers                   | country_region            | varchar   | YES         | NULL           |            |
| customers                   | web_page                  | longtext  | YES         | NULL           |            |
| customers                   | notes                     | longtext  | YES         | NULL           |            |
| customers                   | attachments               | longblob  | YES         | NULL           |            |
| employee_privileges         | employee_id               | int       | NO          | NULL           | PRI        |
| employee_privileges         | privilege_id              | int       | NO          | NULL           | PRI        |
| employees                   | id                        | int       | NO          | NULL           | PRI        |
| employees                   | company                   | varchar   | YES         | NULL           | MUL        |
| employees                   | last_name                 | varchar   | YES         | NULL           | MUL        |
| employees                   | first_name                | varchar   | YES         | NULL           | MUL        |
| employees                   | email_address             | varchar   | YES         | NULL           |            |
| employees                   | job_title                 | varchar   | YES         | NULL           |            |
| employees                   | business_phone            | varchar   | YES         | NULL           |            |
| employees                   | home_phone                | varchar   | YES         | NULL           |            |
| employees                   | mobile_phone              | varchar   | YES         | NULL           |            |
| employees                   | fax_number                | varchar   | YES         | NULL           |            |
| employees                   | address                   | longtext  | YES         | NULL           |            |
| employees                   | city                      | varchar   | YES         | NULL           | MUL        |
| employees                   | state_province            | varchar   | YES         | NULL           | MUL        |
| employees                   | zip_postal_code           | varchar   | YES         | NULL           | MUL        |
| employees                   | country_region            | varchar   | YES         | NULL           |            |
| employees                   | web_page                  | longtext  | YES         | NULL           |            |
| employees                   | notes                     | longtext  | YES         | NULL           |            |
| employees                   | attachments               | longblob  | YES         | NULL           |            |
| inventory_transaction_types | id                        | tinyint   | NO          | NULL           | PRI        |
| inventory_transaction_types | type_name                 | varchar   | NO          | NULL           |            |
| inventory_transactions      | id                        | int       | NO          | NULL           | PRI        |
| inventory_transactions      | transaction_type          | tinyint   | NO          | NULL           | MUL        |
| inventory_transactions      | transaction_created_date  | datetime  | YES         | NULL           |            |
| inventory_transactions      | transaction_modified_date | datetime  | YES         | NULL           |            |
| inventory_transactions      | product_id                | int       | NO          | NULL           | MUL        |
| inventory_transactions      | quantity                  | int       | NO          | NULL           |            |
| inventory_transactions      | purchase_order_id         | int       | YES         | NULL           | MUL        |
| inventory_transactions      | customer_order_id         | int       | YES         | NULL           | MUL        |
| inventory_transactions      | comments                  | varchar   | YES         | NULL           |            |
| invoices                    | id                        | int       | NO          | NULL           | PRI        |
| invoices                    | order_id                  | int       | YES         | NULL           | MUL        |
| invoices                    | invoice_date              | datetime  | YES         | NULL           |            |
| invoices                    | due_date                  | datetime  | YES         | NULL           |            |
| invoices                    | tax                       | decimal   | YES         | 0.0000         |            |
| invoices                    | shipping                  | decimal   | YES         | 0.0000         |            |
| invoices                    | amount_due                | decimal   | YES         | 0.0000         |            |
| order_details               | id                        | int       | NO          | NULL           | PRI        |
| order_details               | order_id                  | int       | NO          | NULL           | MUL        |
| order_details               | product_id                | int       | YES         | NULL           | MUL        |
| order_details               | quantity                  | decimal   | NO          | 0.0000         |            |
| order_details               | unit_price                | decimal   | YES         | 0.0000         |            |
| order_details               | discount                  | double    | NO          | 0              |            |
| order_details               | status_id                 | int       | YES         | NULL           | MUL        |
| order_details               | date_allocated            | datetime  | YES         | NULL           |            |
| order_details               | purchase_order_id         | int       | YES         | NULL           | MUL        |
| order_details               | inventory_id              | int       | YES         | NULL           | MUL        |
| order_details_status        | id                        | int       | NO          | NULL           | PRI        |
| order_details_status        | status_name               | varchar   | NO          | NULL           |            |
| orders                      | id                        | int       | NO          | NULL           | PRI        |
| orders                      | employee_id               | int       | YES         | NULL           | MUL        |
| orders                      | customer_id               | int       | YES         | NULL           | MUL        |
| orders                      | order_date                | datetime  | YES         | NULL           |            |
| orders                      | shipped_date              | datetime  | YES         | NULL           |            |
| orders                      | shipper_id                | int       | YES         | NULL           | MUL        |
| orders                      | ship_name                 | varchar   | YES         | NULL           |            |
| orders                      | ship_address              | longtext  | YES         | NULL           |            |
| orders                      | ship_city                 | varchar   | YES         | NULL           |            |
| orders                      | ship_state_province       | varchar   | YES         | NULL           |            |
| orders                      | ship_zip_postal_code      | varchar   | YES         | NULL           | MUL        |
| orders                      | ship_country_region       | varchar   | YES         | NULL           |            |
| orders                      | shipping_fee              | decimal   | YES         | 0.0000         |            |
| orders                      | taxes                     | decimal   | YES         | 0.0000         |            |
| orders                      | payment_type              | varchar   | YES         | NULL           |            |
| orders                      | paid_date                 | datetime  | YES         | NULL           |            |
| orders                      | notes                     | longtext  | YES         | NULL           |            |
| orders                      | tax_rate                  | double    | YES         | 0              |            |
| orders                      | tax_status_id             | tinyint   | YES         | NULL           | MUL        |
| orders                      | status_id                 | tinyint   | YES         | 0              | MUL        |
| orders_status               | id                        | tinyint   | NO          | NULL           | PRI        |
| orders_status               | status_name               | varchar   | NO          | NULL           |            |
| orders_tax_status           | id                        | tinyint   | NO          | NULL           | PRI        |
| orders_tax_status           | tax_status_name           | varchar   | NO          | NULL           |            |
| privileges                  | id                        | int       | NO          | NULL           | PRI        |
| privileges                  | privilege_name            | varchar   | YES         | NULL           |            |
| products                    | supplier_ids              | longtext  | YES         | NULL           |            |
| products                    | id                        | int       | NO          | NULL           | PRI        |
| products                    | product_code              | varchar   | YES         | NULL           | MUL        |
| products                    | product_name              | varchar   | YES         | NULL           |            |
| products                    | description               | longtext  | YES         | NULL           |            |
| products                    | standard_cost             | decimal   | YES         | 0.0000         |            |
| products                    | list_price                | decimal   | NO          | 0.0000         |            |
| products                    | reorder_level             | int       | YES         | NULL           |            |
| products                    | target_level              | int       | YES         | NULL           |            |
| products                    | quantity_per_unit         | varchar   | YES         | NULL           |            |
| products                    | discontinued              | tinyint   | NO          | 0              |            |
| products                    | minimum_reorder_quantity  | int       | YES         | NULL           |            |
| products                    | category                  | varchar   | YES         | NULL           |            |
| products                    | attachments               | longblob  | YES         | NULL           |            |
| purchase_order_details      | id                        | int       | NO          | NULL           | PRI        |
| purchase_order_details      | purchase_order_id         | int       | NO          | NULL           | MUL        |
| purchase_order_details      | product_id                | int       | YES         | NULL           | MUL        |
| purchase_order_details      | quantity                  | decimal   | NO          | NULL           |            |
| purchase_order_details      | unit_cost                 | decimal   | NO          | NULL           |            |
| purchase_order_details      | date_received             | datetime  | YES         | NULL           |            |
| purchase_order_details      | posted_to_inventory       | tinyint   | NO          | 0              |            |
| purchase_order_details      | inventory_id              | int       | YES         | NULL           | MUL        |
| purchase_order_status       | id                        | int       | NO          | NULL           | PRI        |
| purchase_order_status       | status                    | varchar   | YES         | NULL           |            |
| purchase_orders             | id                        | int       | NO          | NULL           | PRI        |
| purchase_orders             | supplier_id               | int       | YES         | NULL           | MUL        |
| purchase_orders             | created_by                | int       | YES         | NULL           | MUL        |
| purchase_orders             | submitted_date            | datetime  | YES         | NULL           |            |
| purchase_orders             | creation_date             | datetime  | YES         | NULL           |            |
| purchase_orders             | status_id                 | int       | YES         | 0              | MUL        |
| purchase_orders             | expected_date             | datetime  | YES         | NULL           |            |
| purchase_orders             | shipping_fee              | decimal   | NO          | 0.0000         |            |
| purchase_orders             | taxes                     | decimal   | NO          | 0.0000         |            |
| purchase_orders             | payment_date              | datetime  | YES         | NULL           |            |
| purchase_orders             | payment_amount            | decimal   | YES         | 0.0000         |            |
| purchase_orders             | payment_method            | varchar   | YES         | NULL           |            |
| purchase_orders             | notes                     | longtext  | YES         | NULL           |            |
| purchase_orders             | approved_by               | int       | YES         | NULL           |            |
| purchase_orders             | approved_date             | datetime  | YES         | NULL           |            |
| purchase_orders             | submitted_by              | int       | YES         | NULL           |            |
| sales_reports               | group_by                  | varchar   | NO          | NULL           | PRI        |
| sales_reports               | display                   | varchar   | YES         | NULL           |            |
| sales_reports               | title                     | varchar   | YES         | NULL           |            |
| sales_reports               | filter_row_source         | longtext  | YES         | NULL           |            |
| sales_reports               | default                   | tinyint   | NO          | 0              |            |
| shippers                    | id                        | int       | NO          | NULL           | PRI        |
| shippers                    | company                   | varchar   | YES         | NULL           | MUL        |
| shippers                    | last_name                 | varchar   | YES         | NULL           | MUL        |
| shippers                    | first_name                | varchar   | YES         | NULL           | MUL        |
| shippers                    | email_address             | varchar   | YES         | NULL           |            |
| shippers                    | job_title                 | varchar   | YES         | NULL           |            |
| shippers                    | business_phone            | varchar   | YES         | NULL           |            |
| shippers                    | home_phone                | varchar   | YES         | NULL           |            |
| shippers                    | mobile_phone              | varchar   | YES         | NULL           |            |
| shippers                    | fax_number                | varchar   | YES         | NULL           |            |
| shippers                    | address                   | longtext  | YES         | NULL           |            |
| shippers                    | city                      | varchar   | YES         | NULL           | MUL        |
| shippers                    | state_province            | varchar   | YES         | NULL           | MUL        |
| shippers                    | zip_postal_code           | varchar   | YES         | NULL           | MUL        |
| shippers                    | country_region            | varchar   | YES         | NULL           |            |
| shippers                    | web_page                  | longtext  | YES         | NULL           |            |
| shippers                    | notes                     | longtext  | YES         | NULL           |            |
| shippers                    | attachments               | longblob  | YES         | NULL           |            |
| strings                     | string_id                 | int       | NO          | NULL           | PRI        |
| strings                     | string_data               | varchar   | YES         | NULL           |            |
| suppliers                   | id                        | int       | NO          | NULL           | PRI        |
| suppliers                   | company                   | varchar   | YES         | NULL           | MUL        |
| suppliers                   | last_name                 | varchar   | YES         | NULL           | MUL        |
| suppliers                   | first_name                | varchar   | YES         | NULL           | MUL        |
| suppliers                   | email_address             | varchar   | YES         | NULL           |            |
| suppliers                   | job_title                 | varchar   | YES         | NULL           |            |
| suppliers                   | business_phone            | varchar   | YES         | NULL           |            |
| suppliers                   | home_phone                | varchar   | YES         | NULL           |            |
| suppliers                   | mobile_phone              | varchar   | YES         | NULL           |            |
| suppliers                   | fax_number                | varchar   | YES         | NULL           |            |
| suppliers                   | address                   | longtext  | YES         | NULL           |            |
| suppliers                   | city                      | varchar   | YES         | NULL           | MUL        |
| suppliers                   | state_province            | varchar   | YES         | NULL           | MUL        |
| suppliers                   | zip_postal_code           | varchar   | YES         | NULL           | MUL        |
| suppliers                   | country_region            | varchar   | YES         | NULL           |            |
| suppliers                   | web_page                  | longtext  | YES         | NULL           |            |
| suppliers                   | notes                     | longtext  | YES         | NULL           |            |
| suppliers                   | attachments               | longblob  | YES         | NULL           |            |
+-----------------------------+---------------------------+-----------+-------------+----------------+------------+

-- Exit MySQL
EXIT; or QUIT; or \q

