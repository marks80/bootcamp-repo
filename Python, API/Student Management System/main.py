import os
from student_operations import create_student, read_students, update_student, delete_student
from error_handler import InputError, CRUDOperationError, FileError

def main():
    # Create the file if it doesn't exist
    if not os.path.exists('students.txt'):
        with open('students.txt', 'w') as file:
            pass
        print("The file 'students.txt' did not exist and has been created.")

    while True:
        print("\nStudent Management System")
        print("1. Create Student")
        print("2. Read Students")
        print("3. Update Student")
        print("4. Delete Student")
        print("5. Exit")
        
        choice = input("Choose an option: ")
        
        try:
            if choice == '1':
                name = input("Enter name: ")
                surname = input("Enter surname: ")
                speciality = input("Enter speciality: ")
                group_number = input("Enter group number: ")
                email = input("Enter email: ")
                print(create_student(name, surname, speciality, group_number, email))
            elif choice == '2':
                students = read_students()
                if not students:
                    print("No student records found.")
                else:
                    for student in students:
                        print(student.strip())
            elif choice == '3':
                student_id = int(input("Enter student ID to update: "))
                name = input("Enter new name (leave blank to keep current): ")
                surname = input("Enter new surname (leave blank to keep current): ")
                speciality = input("Enter new speciality (leave blank to keep current): ")
                group_number = input("Enter new group number (leave blank to keep current): ")
                email = input("Enter new email (leave blank to keep current): ")
                print(update_student(student_id, name, surname, speciality, group_number, email))
            elif choice == '4':
                student_id = int(input("Enter student ID to delete: "))
                print(delete_student(student_id))
            elif choice == '5':
                break
            else:
                print("Invalid choice. Please try again.")
        except (InputError, CRUDOperationError, FileError) as e:
            print(f"Error: {e}")

if __name__ == "__main__":
    main()
