--1
Here are the definitions for each term:

1.Data: Data refers to raw facts, figures, or information that can be collected, stored, and processed. It can exist in various forms such as numbers, text, 
images, or sounds. Data itself doesn't have meaning until it's interpreted or processed.

2.Database: A database is an organized collection of data that is stored and managed in a structured way. It allows for efficient retrieval, modification, 
and storage of data. Databases can be small (like a file system) or large (like those used by enterprises or websites).

3.Relational Database: A relational database is a type of database that stores data in tables, which are related to each other through predefined relationships. 
Each table consists of rows (records) and columns (attributes). Relational databases use SQL (Structured Query Language) to manage and manipulate data. Examples 
of relational databases include MySQL, PostgreSQL, and SQL Server.

4.Table: A table is a collection of data organized into rows and columns in a relational database. Each table typically represents an entity 
(like "Customers" or "Orders"), and each row represents a record or instance of that entity, while each column represents an attribute or field of the entity. 
Tables are the core structure in a relational database.

--2

Here are five key features of SQL Server:

1.Relational Database Management System (RDBMS): SQL Server is a relational database management system that stores data in tables and supports relationships 
between different tables. It allows you to use SQL (Structured Query Language) to manage, retrieve, and manipulate the data efficiently.

2.Security: SQL Server provides robust security features, including authentication, encryption, and role-based access control. It supports both 
Windows and SQL Server authentication methods and offers tools like Transparent Data Encryption (TDE) and Always Encrypted to protect data at rest and in transit.

3.Scalability and Performance: SQL Server is designed to handle large volumes of data and high workloads. It supports high availability features 
like Always On Availability Groups and database mirroring, and it offers tools such as indexing, partitioning, and query optimization to enhance performance.

4.Advanced Analytics and Reporting: SQL Server includes features for data analysis and reporting, such as SQL Server Analysis Services (SSAS) for 
OLAP (Online Analytical Processing) and data mining, and SQL Server Reporting Services (SSRS) for generating and managing reports. It also integrates 
with Power BI for interactive data visualization.

5.Transactional Consistency and ACID Compliance: SQL Server ensures data integrity and consistency through ACID properties (Atomicity, Consistency, Isolation,
Durability). This means that transactions are processed reliably and securely, even in the case of system failures. This is crucial for maintaining accurate 
and trustworthy data in multi-user environments.

--3
When connecting to SQL Server, two primary authentication modes are available:

Windows Authentication Mode:

This authentication method relies on the credentials of the user logged into the Windows operating system. When a user tries to connect to SQL Server, the system uses the Windows login and password to verify access.

It is considered more secure because it integrates with Windows security policies, such as password complexity and account lockout policies.

No additional login credentials are required to connect to SQL Server if the Windows user has the necessary permissions.

SQL Server Authentication Mode:

This mode allows users to log in to SQL Server using a SQL Server-specific username and password, independent of the Windows operating system.

The login credentials are managed and stored within SQL Server itself. This is useful when users do not have Windows accounts or when accessing SQL Server from non-Windows environments.

While convenient, SQL Server Authentication is considered less secure than Windows Authentication, especially if passwords are not managed carefully.

--4
Using SQL Query:
Open SQL Server Management Studio (SSMS):

Launch SSMS and connect to your SQL Server instance.

Open a New Query Window:

In the Object Explorer panel, right-click on the SQL Server instance you are connected to and select New Query.

Write the SQL Query to Create the Database:

In the query window, type the following SQL code:

CREATE DATABASE SchoolDB;
Execute the Query:

Press F5 or click on the Execute button in the toolbar to run the query.

Verify the Database Creation:

After executing the query, expand the Databases node in the Object Explorer to check if SchoolDB appears.

Using SSMS GUI:
In SSMS, right-click on the Databases node in the Object Explorer.

Select New Database... from the context menu.

In the New Database window:

Enter SchoolDB as the Database name.

Click OK to create the database.

--5
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
--6
1. SQL Server:
What It Is: SQL Server is a Relational Database Management System (RDBMS) developed by Microsoft. It is used to store, manage, and retrieve data in relational databases. SQL Server manages and handles large volumes of structured data, supports transaction processing, and offers features like high availability, security, and performance optimization.

Key Role: SQL Server is the database engine that actually stores and processes the data. It provides the infrastructure to run and manage databases.

Example: Microsoft SQL Server 2019, SQL Server 2022.

2. SSMS (SQL Server Management Studio):
What It Is: SSMS is an Integrated Environment provided by Microsoft to manage SQL Server instances and databases. It is a GUI-based tool for database administrators and developers to manage, query, and configure SQL Server.

Key Role: SSMS serves as a client application that connects to a SQL Server instance. It allows users to run queries, manage database objects (like tables, views, and procedures), perform administrative tasks, and analyze data. It also allows for visual management and monitoring of the SQL Server instance.

Example: When you use SSMS to write queries and execute them against a SQL Server database, you are interacting with the SQL Server instance via SSMS.

3. SQL (Structured Query Language):
What It Is: SQL is a programming language used for managing and manipulating relational databases. SQL is used to query, update, insert, and delete data in a database. It is the language that communicates with SQL Server (or any RDBMS) to perform actions on data and database objects.

Key Role: SQL is the language you use to interact with SQL Server. It’s used to define database structures (like tables and relationships), retrieve data (via SELECT statements), and manipulate data (via INSERT, UPDATE, DELETE).

Example: SQL queries like SELECT * FROM Students;, INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'John', 20);, or CREATE TABLE Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT);.

Summary of Differences:
SQL Server is the database engine that stores and manages your data.

SSMS is a management tool (GUI) that allows you to interact with SQL Server, run queries, and perform administrative tasks.

SQL is the language used to communicate with and manage the data stored in SQL Server.
--7
DQL: Used to query data (e.g., SELECT).

DML: Used to manipulate data (e.g., INSERT, UPDATE, DELETE).

DDL: Used to define and modify database structure (e.g., CREATE, ALTER, DROP).

DCL: Used to control access and permissions (e.g., GRANT, REVOKE).

TCL: Used to manage transactions (e.g., COMMIT, ROLLBACK, SAVEPOINT).

These five categories help structure how you interact with a database for querying,
--8
INSERT INTO Students (StudentID, Name, Age)
VALUES
    (1, 'John Doe', 20),
    (2, 'Jane Smith', 22),
    (3, 'Alice Johnson', 19);
--9
Step 1: Create a Backup of SchoolDB
Open SQL Server Management Studio (SSMS) and connect to your SQL Server instance.

In Object Explorer, locate and expand the Databases node.

Right-click on SchoolDB and select Tasks > Back Up....

Alternatively, you can run the following SQL query:

BACKUP DATABASE SchoolDB
TO DISK = 'C:\Backup\SchoolDB.bak';
Replace C:\Backup\SchoolDB.bak with the path where you want to save your backup file.

This command creates a .bak backup file for your SchoolDB database.

In the Back Up Database window:

Database: Select SchoolDB.

Backup Type: Select Full (recommended for a complete backup).

Under Destination, ensure the Disk option is selected, and specify the path where you want the backup to be stored (e.g., C:\Backup\SchoolDB.bak).

Click OK to begin the backup process.

After the backup completes successfully, a message will appear indicating that the backup has finished.


