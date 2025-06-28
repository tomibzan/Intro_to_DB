import mysql.connector import subprocess def get_table_names(): try: connection = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "alxbe",
    database = "alx_book_store"
) cursor = connection.cursor() cursor.execute(
    "SELECT table_name FROM information_schema.tables WHERE table_schema = 'alx_book_store'"
) tables = cursor.fetchall() table_names = [table[0] for table in tables ] return table_names
except mysql.connector.Error as err: print(f "Error: {err}") return [] finally: if connection.is_connected(): cursor.close() connection.close() def run_mysql_command(table_list): tabel_str = " ".join(table_list) command = f 'mysql -u root -palxbe -D alx_book_store -e "SELECT * FROM {table_list[0]} LIMIT 5;"' subprocess.run(command, shell = True) if __name__ == "__main__": tables = get_table_names() if tables: print("Tables in 'alx_book_store':", tables) run_mysql_command(tables)
    else: print("No tables found in 'alx_book_store'.")