import os
from error_handler import FileError

def read_file(file_path='students.txt'):
    if not os.path.exists(file_path):
        # Create the file if it doesn't exist
        with open(file_path, 'w') as file:
            pass
        print(f"{file_path} created successfully.")
    
    with open(file_path, 'r') as file:
        data = file.readlines()
    return data

def write_file(data, file_path='students.txt'):
    with open(file_path, 'w') as file:
        file.writelines(data)

def append_to_file(record, file_path='students.txt'):
    with open(file_path, 'a') as file:
        file.write(record + '\n')
