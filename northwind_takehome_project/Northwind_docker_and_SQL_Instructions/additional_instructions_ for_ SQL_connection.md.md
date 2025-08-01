The instructions assume familiarity with database command-line interfaces. You can run those SQL commands in a few different ways, but they are _not_ meant to be run directly in your standard Mac terminal prompt.

You need to connect to the **MySQL client**, which is running inside the Docker container. Here are the most common ways to do that.

---

### Option 1: Run the Command Directly (Recommended) 🚀

This is the most straightforward method. You can use a single command from your Mac's Terminal to "reach into" the Docker container and execute the SQL query without ever leaving your own terminal session.

The troubleshooting section of the guide hints at this method.

1. **Open your Mac's Terminal.**
    
2. **Copy and paste the following commands.** Each command sends one SQL query to the database and prints the result.
    
    To see all the tables:
    
    Bash
    
    ```
    docker exec -it northwind mysql -uroot -psupersecret -e "USE northwind; SHOW TABLES;"
    ```
    
    To count the customers (should return 29):
    
    Bash
    
    ```
    docker exec -it northwind mysql -uroot -psupersecret -e "USE northwind; SELECT COUNT(*) FROM customers;"
    ```
    
    To count the products (should return 77):
    
    Bash
    
    ```
    docker exec -it northwind mysql -uroot -psupersecret -e "USE northwind; SELECT COUNT(*) FROM products;"
    ```
    
    _**Note**: If you are using an Apple Silicon (M1/M2/M3) Mac, change `-uroot -psupersecret` to `-uuser -ppassword` to match the credentials for that specific image._
    

---

### Option 2: Connect _Inside_ the Docker Container 🖥️

Your guess was spot on—this is another common way to do it. You first open a shell _inside_ the container and then launch the MySQL client from there.

1. **Open a terminal session inside the container:**
    
    Bash
    
    ```
    docker exec -it northwind bash
    ```
    
    Your terminal prompt will change, indicating you are now inside the Docker container (e.g., `root@<container_id>:/#`).
    
2. **Connect to the MySQL client:**
    
    Bash
    
    ```
    mysql -u root -p
    ```
    
    It will prompt you for the password. Type `supersecret` and press Enter.
    
3. **Run the SQL commands:** Once you see the `mysql>` prompt, you can run the commands from the guide:
    
    SQL
    
    ```
    USE northwind;
    SHOW TABLES;
    SELECT COUNT(*) FROM customers;
    SELECT COUNT(*) FROM products;
    exit;
    ```
    
4. **Exit the container:** After you type `exit;` to leave MySQL, type `exit` again to close the container session and return to your Mac's terminal.
    

---

### Option 3: Use a GUI Database Tool 🖱️

If you prefer a visual interface, you can connect any standard SQL client (like TablePlus, DBeaver, or MySQL Workbench) to the database using the connection details provided in the guide:

- **Host**: `localhost`
    
- **Port**: `3307`
    
- **Username**: `root` (or `user` for Apple Silicon)
    
- **Password**: `supersecret` (or `password` for Apple Silicon)
    
- **Database**: `northwind`