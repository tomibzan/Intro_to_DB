# from getpass import getpass
from getpass import getpass
from mysql.connector import connect,
    Error import subprocess try: with connect(
        host = "localhost",
        user = input("Enter your username: "),
        password = getpass("Enter password: "),
        database = "alx_book_store"
    ) as connection: with connection.cursor() as cursor: cursor.execute("SHOW TABLES") tables = [row[0] for row in cursor.fetchall() ] if tables: print("Tables found:", tables) # Join table names for use in shell command
    tables_arg = ' '.join(tables) # Prompt for password again for shell use (optional security)
    db_user = input("Re-enter your username for shell command: ") db_pass = getpass("Re-enter password for shell command: ") # Construct mysql command
    cmd = f 'mysql -u {db_user} -p{db_pass} -e "USE alx_book_store; SHOW CREATE TABLE {tables_arg};"' print("Running command:", cmd) subprocess.run(cmd, shell = True)
    else: print("No tables found.")
except Error as e: print("Error while connecting to MySQL:", e)