# MySQL Command Line Overview

## Connection & Session Management

**Connecting to MySQL:**
```bash
# Basic connection (will prompt for password)
mysql -u username -p

# Connect to specific database
mysql -u username -p database_name

# Connect to Docker container (if Northwind is containerized)
docker exec -it container_name mysql -u username -p

# Connect with host/port specification
mysql -h localhost -P 3306 -u username -p
```

**Session Commands (these don't need semicolons):**
```sql
-- Show all databases
SHOW DATABASES;

-- Switch to a database
USE northwind;

-- Show current database
SELECT DATABASE();

-- Show all tables in current database
SHOW TABLES;

-- Exit MySQL
EXIT; or QUIT; or \q
```

## Key Command Line Syntax Differences

**Statement Termination:**
- **MUST** end SQL statements with semicolon (`;`)
- Commands like `SHOW`, `USE`, `EXIT` are exceptions but semicolon still works

**Multi-line Statements:**
- MySQL CLI allows multi-line input
- Prompt changes from `mysql>` to `    ->` for continuation lines
- Statement executes only when you type semicolon

**Case Sensitivity:**
- SQL keywords: case-insensitive (`SELECT` = `select`)
- Database/table names: depends on OS (case-sensitive on Linux, insensitive on macOS/Windows)
- Column names: case-insensitive

## MySQL-Specific Syntax Notes

**String Quoting:**
- Single quotes for strings: `'John Doe'`
- Backticks for identifiers with spaces/reserved words: `` `Order Details` ``
- Double quotes work but single quotes preferred

**Date Formats:**
- Standard format: `'YYYY-MM-DD'` or `'YYYY-MM-DD HH:MM:SS'`
- Example: `'1997-07-04'` or `'1997-07-04 12:30:00'`

**LIMIT vs TOP:**
- MySQL uses `LIMIT`: `SELECT * FROM customers LIMIT 10;`
- SQL Server uses `TOP`: `SELECT TOP 10 * FROM customers;`

**String Concatenation:**
- MySQL: `CONCAT(first_name, ' ', last_name)`
- SQL Server: `first_name + ' ' + last_name`

## Command History & Editing

**Useful CLI Features:**
- Use ↑/↓ arrows to navigate command history
- Use `\c` to cancel current command without executing
- Use `\G` instead of `;` to display results vertically (great for wide tables)
