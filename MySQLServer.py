import mysql.connector
from mysql.connector import Error


def create_database():
    connection = None
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='alxbe'
        )

        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

    except Error as db_error:
        print(f"MySQL Error: {db_error}")
    except Exception as e:
        print(f"Unexpected error: {e}")
    finally:
        if connection:
            if connection.is_connected():
                connection.close()
                print("MySQL connection is closed")


if __name__ == "__main__":
    create_database()
