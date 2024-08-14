// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Student Record Management System
/// @notice This contract allows for the creation, update, and deletion of student records.
/// @dev This contract uses a mapping to store student records and provides functions to manage them.
contract StudentRecord {
    
    /// @dev Struct to hold student details.
    /// @param id The unique identifier for the student.
    /// @param name The name of the student.
    /// @param age The age of the student.
    /// @param grade The grade of the student.
    /// @param status The current status of the student (e.g., Active, Inactive).
    struct Student {
        string id;
        string name;
        uint age;
        string grade;
        string status;
    }

    /// @dev Mapping of student ID to the corresponding Student struct.
    mapping(string => Student) private students;

    /// @notice Emitted when a new student is created.
    /// @param id The unique identifier for the student.
    /// @param name The name of the student.
    /// @param age The age of the student.
    /// @param grade The grade of the student.
    /// @param status The current status of the student.
    event StudentCreated(string id, string name, uint age, string grade, string status);

    /// @notice Emitted when a student's record is updated.
    /// @param id The unique identifier for the student.
    /// @param name The updated name of the student.
    /// @param age The updated age of the student.
    /// @param grade The updated grade of the student.
    /// @param status The updated status of the student.
    event StudentUpdated(string id, string name, uint age, string grade, string status);

    /// @notice Emitted when a student's record is deleted.
    /// @param id The unique identifier for the student.
    event StudentDeleted(string id);

    /// @notice Creates a new student record.
    /// @dev The student ID must be unique and not already exist in the records.
    /// @param id The unique identifier for the student.
    /// @param name The name of the student.
    /// @param age The age of the student.
    /// @param grade The grade of the student.
    /// @param status The current status of the student.
    function createStudent(string memory id, string memory name, uint age, string memory grade, string memory status) public {
        require(bytes(students[id].id).length == 0, "Student already exists");
        
        students[id] = Student(id, name, age, grade, status);
        
        emit StudentCreated(id, name, age, grade, status);
    }

    /// @notice Reads the details of a student.
    /// @dev The student must exist in the records.
    /// @param id The unique identifier for the student.
    /// @return id The unique identifier for the student.
    /// @return name The name of the student.
    /// @return age The age of the student.
    /// @return grade The grade of the student.
    /// @return status The current status of the student.
    function readStudent(string memory id) public view returns (string memory, string memory, uint, string memory, string memory) {
        Student memory student = students[id];
        require(bytes(student.id).length != 0, "Student does not exist");
        
        return (student.id, student.name, student.age, student.grade, student.status);
    }

    /// @notice Updates an existing student record.
    /// @dev The student must exist in the records.
    /// @param id The unique identifier for the student.
    /// @param name The updated name of the student.
    /// @param age The updated age of the student.
    /// @param grade The updated grade of the student.
    /// @param status The updated status of the student.
    function updateStudent(string memory id, string memory name, uint age, string memory grade, string memory status) public {
        require(bytes(students[id].id).length != 0, "Student does not exist");
        
        students[id] = Student(id, name, age, grade, status);
        
        emit StudentUpdated(id, name, age, grade, status);
    }

    /// @notice Deletes an existing student record.
    /// @dev The student must exist in the records.
    /// @param id The unique identifier for the student.
    function deleteStudent(string memory id) public {
        require(bytes(students[id].id).length != 0, "Student does not exist");
        
        delete students[id];
        
        emit StudentDeleted(id);
    }
}
