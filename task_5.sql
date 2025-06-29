from getpass import getpass
from mysql.connector import connect,
    Error try: # Get credentials from user
    user = input("Enter your MySQL username: ") password = getpass("Enter your password: ") db_name = input("Enter the database name: ") # Connect to MySQL
    with connect(
        host = "localhost",
        user = user,
        password = password,
        database = db_name
    ) as connection: insert_query = """
        INSERT INTO Customers (customer_id, customer_name, email, address)
        VALUES (%s, %s, %s, %s)
        """ customer_data = (
        1,
        'Cole Baidoo',
        'cbaidoo@sandtech.com',
        '123 Happiness Ave.'
    ) with connection.cursor() as cursor: cursor.execute(insert_query, customer_data) connection.commit() print("Customer inserted successfully.")
except Error as e: print("Error:", e)