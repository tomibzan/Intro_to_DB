import mysql.connector
from mysql.connector import Error, errorcode


def create_database():
    connection = None
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='alxbe'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            try:
                cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
                print("Database 'alx_book_store' created successfully.")
            except Error as err:
                print(f"Failed to create database: {err}")
            finally:
                cursor.close()

    except Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Access denied: Incorrect username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist.")
        else:
            print(f"Connection Error: {err}")

    finally:
        if connection and connection.is_connected():
            connection.close()


if __name__ == "__main__":
    create_database()
