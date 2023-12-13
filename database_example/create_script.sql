DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enrollments_have_misconducts;
DROP TABLE IF EXISTS misconducts;
DROP TABLE IF EXISTS enrollments_have_extracurriculars;
DROP TABLE IF EXISTS extracurriculars;
DROP TABLE IF EXISTS students_have_guardians;
DROP TABLE IF EXISTS guardians;
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS test_scores;
DROP TABLE IF EXISTS standardized_tests;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
name				VARCHAR(45) 	NOT NULL,
student_id			INT,
birthday			DATE			NOT NULL,
gender				VARCHAR(10)		NOT NULL,
enrollment_date		DATE			NOT NULL,
unenrollment_date	DATE,
CONSTRAINT pk_students PRIMARY KEY(student_id)
);

CREATE TABLE applications(
app_id				INT,
app_date			DATE			NOT NULL,
app_status			VARCHAR(20),
student_to_attend	TINYINT,
student_id			INT				NOT NULL,
school_name			VARCHAR(50)		NOT NULL,
program_name		VARCHAR(50)		NOT NULL,
CONSTRAINT pk_applications PRIMARY KEY(app_id),
CONSTRAINT fk_applications FOREIGN KEY(student_id) REFERENCES students(student_id)
			ON DELETE CASCADE
);

CREATE TABLE guardians(
guardian_name		VARCHAR(45)		NOT NULL,
address				VARCHAR(45),
phone_number		VARCHAR(20),
gender				VARCHAR(10),
birthday			DATE,
CONSTRAINT pk_guardian PRIMARY KEY(phone_number)
);

CREATE TABLE students_have_guardians(
student_id			INT,
phone_number		VARCHAR(10),
CONSTRAINT pk_students_have_guardians PRIMARY KEY(student_id,phone_number),
CONSTRAINT fk_students_guardians FOREIGN KEY(student_id) REFERENCES students(student_id)
		ON DELETE CASCADE,
CONSTRAINT fk_guardians_students FOREIGN KEY(phone_number) REFERENCES guardians(phone_number)
		ON DELETE CASCADE
);

CREATE TABLE enrollments(
enrollment_id		INT,
student_id			INT			NOT NULL,
academic_year		VARCHAR(9)	NOT NULL,
CONSTRAINT pk_enrollments PRIMARY KEY(enrollment_id),
CONSTRAINT fk_enrollments FOREIGN KEY(student_id) REFERENCES students(student_id)
			ON DELETE CASCADE
);

CREATE TABLE standardized_tests(
test_date			DATE,
test_name			VARCHAR(45)		NOT NULL,
test_id				INT,
CONSTRAINT pk_standardized_tests PRIMARY KEY(test_id)
);

CREATE TABLE test_scores(
enrollment_id		INT,
test_id				INT,
test_score			DOUBLE,
CONSTRAINT pk_test_scores PRIMARY KEY(enrollment_id,test_id),
CONSTRAINT fk_tests_enrollments	FOREIGN KEY(test_id) REFERENCES standardized_tests(test_id)
		ON DELETE CASCADE,
CONSTRAINT fk_enrollments_tests FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
		ON DELETE CASCADE
);

CREATE TABLE misconducts(
misconduct_id		INT,
date				DATE			NOT NULL,
type_of_incident	VARCHAR(45)		NOT NULL,
action_taken		VARCHAR(100)	NOT NULL,
CONSTRAINT pk_misconducts PRIMARY KEY(misconduct_id)
);

CREATE TABLE enrollments_have_misconducts(
enrollment_id		INT,
misconduct_id		INT,
CONSTRAINT pk_enrollments_have_misconducts PRIMARY KEY (enrollment_id,misconduct_id),
CONSTRAINT fk_enrollmments_misconducts FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
		ON DELETE CASCADE,
CONSTRAINT fk_misconducts_enrollments FOREIGN KEY(misconduct_id) REFERENCES misconducts(misconduct_id)
		ON DELETE CASCADE
);

CREATE TABLE extracurriculars(
activity_id			INT,
activity_name		VARCHAR(45),
academic_year		VARCHAR(9),
CONSTRAINT pk_extracurriculars PRIMARY KEY(activity_id)
);

CREATE TABLE enrollments_have_extracurriculars(
enrollment_id		INT,
activity_id			INT,
student_role		VARCHAR(30),
CONSTRAINT pk_enrollments_have_extracurriculars PRIMARY KEY(enrollment_id, activity_id),
CONSTRAINT fk_extracurriculars_enrollments FOREIGN KEY(activity_id) REFERENCES extracurriculars(activity_id)
		ON DELETE CASCADE,
CONSTRAINT fk_enrollments_extracurriculars FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
		ON DELETE CASCADE
);

CREATE TABLE staff(
staff_name			VARCHAR(45)			NOT NULL,
staff_id			INT,
position			VARCHAR(20),
CONSTRAINT pk_staff PRIMARY KEY (staff_id)
);


CREATE TABLE courses(
course_id			INT,
course_name			VARCHAR(45)			NOT NULL,
room_number			VARCHAR(10)			NOT NULL,
academic_year		VARCHAR(9)				NOT NULL,
staff_id			INT,
CONSTRAINT pk_courses PRIMARY KEY(course_id),
CONSTRAINT fk_courses FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
		ON DELETE CASCADE
);


CREATE TABLE grades(
enrollment_id		INT,
course_id			INT,
grade				DOUBLE,
grading_period		INT,
CONSTRAINT pk_grades PRIMARY KEY(enrollment_id,course_id),
CONSTRAINT fk_enrollments_courses FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
			ON DELETE CASCADE,
CONSTRAINT fk_courses_enrollments FOREIGN KEY(course_id) REFERENCES courses(course_id)
			ON DELETE CASCADE
);