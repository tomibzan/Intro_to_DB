from getpass import getpass
from mysql.connector import connect,
    Error try: # Prompt for credentials and database name
    user = input("Enter your MySQL username: ") password = getpass("Enter your password: ") db_name = input(
        "Enter the database name (e.g., alx_book_store): "
    ) # Establish connection
    with connect(
        host = "localhost",
        user = user,
        password = password,
        database = db_name
    ) as connection: insert_query = """
        INSERT INTO customer (customer_id, customer_name, email, address)
        VALUES (%s, %s, %s, %s)
        """ # List of customers to insert
    customer_data = [
            (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
            (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
            (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.')
        ] with connection.cursor() as cursor: cursor.executemany(insert_query, customer_data) connection.commit() print(
        f "{cursor.rowcount} customers inserted successfully."
    )
except Error as e: print("Error:", e)