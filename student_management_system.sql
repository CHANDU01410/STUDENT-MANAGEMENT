
-- Student Management System SQL Schema

-- Create Students table
CREATE TABLE Students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  dob DATE NOT NULL,
  gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15)
);

-- Create Courses table
CREATE TABLE Courses (
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  course_name VARCHAR(100) NOT NULL,
  credits INT CHECK (credits > 0)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT,
  course_id INT,
  semester VARCHAR(20) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Grades table
CREATE TABLE Grades (
  grade_id INT PRIMARY KEY AUTO_INCREMENT,
  enrollment_id INT,
  grade VARCHAR(2) CHECK (grade IN ('A', 'B', 'C', 'D', 'F')),
  FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);

-- Create Attendance table
CREATE TABLE Attendance (
  attendance_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT,
  course_id INT,
  date DATE NOT NULL,
  status VARCHAR(10) CHECK (status IN ('Present', 'Absent')),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
