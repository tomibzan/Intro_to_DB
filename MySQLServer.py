import mysql.connector


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
                print("Database 'alx_book_store' created successfully!")
            except mysql.connector.Error as db_error:
                print(f"Error creating database: {db_error}")
            finally:
                cursor.close()

    except mysql.connector.Error as conn_error:
        print(f"Failed to connect to MySQL server: {conn_error}")

    finally:
        if connection and connection.is_connected():
            connection.close()
            print("MySQL connection is closed")


if __name__ == "__main__":
    create_database()
