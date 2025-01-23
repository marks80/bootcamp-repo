print("Loading student_operations.py")

from file_handler import read_file, write_file, append_to_file
from error_handler import CRUDOperationError

def generate_id(records):
    print("generate_id function")
    if not records:
        return 1
    last_record = records[-1].strip().split(',')
    return int(last_record[0]) + 1

def create_student(name, surname, speciality, group_number, email):
    print("create_student function")
    try:
        records = read_file()
        student_id = generate_id(records)
        record = f"{student_id},{name},{surname},{speciality},{group_number},{email}"
        append_to_file(record)
        return "Record successfully created."
    except Exception as e:
        raise CRUDOperationError(f"Error creating record: {e}")

def read_students():
    print("read_students function")
    try:
        records = read_file()
        return records
    except Exception as e:
        raise CRUDOperationError(f"Error reading records: {e}")

def update_student(student_id, name=None, surname=None, speciality=None, group_number=None, email=None):
    print("update_student function")
    try:
        records = read_file()
        updated = False
        updated_records = []
        for record in records:
            record_data = record.strip().split(',')
            if int(record_data[0]) == student_id:
                if name: record_data[1] = name
                if surname: record_data[2] = surname
                if speciality: record_data[3] = speciality
                if group_number: record_data[4] = group_number
                if email: record_data[5] = email
                updated = True
            updated_records.append(','.join(record_data))
        
        if not updated:
            raise CRUDOperationError("Student ID not found.")
        
        write_file(updated_records)
        return "Record successfully updated."
    except Exception as e:
        raise CRUDOperationError(f"Error updating record: {e}")

def delete_student(student_id):
    print("delete_student function")
    try:
        records = read_file()
        updated_records = [record for record in records if int(record.strip().split(',')[0]) != student_id]
        
        if len(records) == len(updated_records):
            raise CRUDOperationError("Student ID not found.")
        
        write_file(updated_records)
        return "Record successfully deleted."
    except Exception as e:
        raise CRUDOperationError(f"Error deleting record: {e}")
