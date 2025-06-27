import mysql.connector
from mysql.connector import Error


def create_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='alxbe'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully.")

    except Error as err:
        print(f"Error: {err}")

    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()


if __name__ == "__main__":
    # Replace with your MySQL root password
    create_database()
