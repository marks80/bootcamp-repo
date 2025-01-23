# Student Management System

The **Student Management System** is a Python-based project designed to manage student records efficiently. This system provides features to create, read, update, and delete student data, storing it in a file for persistence.

## Features

- Add new student records.
- View all student records.
- Update existing student records.
- Delete student records.
- Persistent storage of records in `students.txt`.

## Project Structure

```plaintext
task_students/
├── main.py               # Entry point of the application
├── student_operations.py # Functions for CRUD operations
├── file_handler.py       # Handles file reading and writing operations
├── error_handler.py      # Custom error handling
├── students.txt          # Data storage (created automatically if not present)
└── sample_output.txt     # Example output from the application
```

## Getting Started

### Prerequisites
- Python 3.x

### Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd task_students
   ```

### Usage
1. Run the `main.py` script:
   ```bash
   python main.py
   ```
2. Follow the on-screen menu to:
   - Create a new student record
   - View all student records
   - Update an existing student record
   - Delete a student record

### Example Output

Sample interaction with the application:

```plaintext
Student Management System
1. Create Student
2. Read Students
3. Update Student
4. Delete Student
5. Exit
Choose an option: 1
Enter name: John
Enter surname: Doe
Enter speciality: Computer Science
Enter group number: CS101
Enter email: john.doe@example.com
Record successfully created.
```

## Code Overview

### Main Modules
- **`main.py`**: The entry point that provides a user-friendly CLI to interact with the system.
- **`student_operations.py`**: Contains the core CRUD operations (Create, Read, Update, Delete).
- **`file_handler.py`**: Handles all file-related operations like reading, writing, and appending data.
- **`error_handler.py`**: Defines custom exceptions for error handling.

### File Storage
- Student records are stored in a simple text file (`students.txt`) with each record structured as:
  ```csv
  ID,Name,Surname,Speciality,GroupNumber,Email
  ```

## Error Handling
The system includes custom exceptions for robust error handling:
- **FileError**: Raised for file-related issues.
- **CRUDOperationError**: Raised for errors during CRUD operations.
- **InputError**: Raised for invalid user inputs.

## Contributing
Contributions are welcome! Feel free to submit issues or pull requests to enhance the project.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
