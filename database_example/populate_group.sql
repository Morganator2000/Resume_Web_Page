-- insert data
delete from students;
insert into students values ("Raven Shepherd", 1,"2009-02-11",'female',"2022-05-02", null);
insert into students values ("Echo Joyner",2,"2008-01-16","nonbinary","2022-03-31", null);
insert into students values ("Erasmus Little",3,"2007-09-27","male","2019-09-27", null);
insert into students values ("Audra Matthews",4,"2007-06-23","female","2022-07-19", null);
insert into students values ("Calvin Moore",5,"2008-03-09","male","2018-04-08","2022-04-14");

delete from applications;
insert into applications values(1,'2021-11-25','Declined','No',5,'Algonquin College','Nursing');
insert into applications values(2,'2021-11-25','Declined','No',5,'Second Chance College','Gender Studies');
insert into applications values(3,'2021-11-25','Declined','No',5,'Last Chance College','Nursing');
insert into applications values(4,'2021-11-25','Pending','Yes',5,'Harvard','Law');
insert into applications values(5,'2021-11-25','Accepted','No',5,"St-Paul's University",'Spirits and Energies');

delete from guardians;
insert into guardians values ("Lyle Shepherd","858-4532 Suspendisse Rd.","(835) 317-7584","Male","1985-06-15");
insert into guardians values ("Cedric Joyner","207-3555 Ligula. Rd.","(814) 530-2176","Female","1981-03-04");
insert into guardians values ("Roanna Little","520-5501 Enim Rd.","(507) 577-8998","Male","1987-01-03");
insert into guardians values ("Wayne Matthews","P.O. Box 919, 6786 Magna Rd.","(522) 568-4673","Female","1973-06-11");
insert into guardians values ("Jarrod Moore","805-6823 Nec Ave","(948) 863-7687","Male","1989-07-12");

delete from students_have_guardians;
insert into students_have_guardians values (1,"(835) 317-7584");
insert into students_have_guardians values (2,"(814) 530-2176");
insert into students_have_guardians values (3,"(507) 577-8998");
insert into students_have_guardians values (4,"(522) 568-4673");
insert into students_have_guardians values (5,"(948) 863-7687");

delete from enrollments;
insert into enrollments values (101,1,'2020-21');
insert into enrollments values (102,2,'2020-21');
insert into enrollments values (103,4,'2020-21');

insert into enrollments values (104,1,'2021-22');
insert into enrollments values (105,2,'2021-22');
insert into enrollments values (106,3,'2021-22');
insert into enrollments values (107,4,'2021-22');
insert into enrollments values (108,5,'2021-22');

delete from standardized_tests;
insert into standardized_tests values('2021-04-30','Final Exam: Grade 9 Applied Math',100001);
insert into standardized_tests values('2020-11-25','Final Exam: Grade 9 Applied Physics',100002);
insert into standardized_tests values('2022-04-30','Final Exam: Grade 10 Applied Math',100003);
insert into standardized_tests values('2022-05-01','Final Exam: Grade 10 Applied Math',100004);
insert into standardized_tests values('2022-10-17','Midterm: Grade 12 English Literature',100005);

delete from test_scores;
insert into test_scores values(101,100001,100.0);
insert into test_scores values(102,100001,74.9);
insert into test_scores values(101,100002,82.3);
insert into test_scores values(103,100002,69.8);
insert into test_scores values(106,100003,83.8);
insert into test_scores values(107,100004,75.9);
insert into test_scores values(108,100005,65.3);

delete from misconducts;
insert into misconducts values (1,'2021-12-23','Physical violence','Raven is suspended for punching a student after saying "Merry Christmas, I got you pain"');
insert into misconducts values (2,'2022-03-11','Drug use','Raven and Calvin were told they need to share with the staff.');
insert into misconducts values (3,'2022-04-02','Mischief','Echo received detention for pranking a day late.');
insert into misconducts values (4,'2022-05-13','Public indecency','Erasmus was sent home for forgetting his pants.');
insert into misconducts values (5,'2022-06-20','Theft','Raven was scolded for trying to steal the free lunches.');

delete from enrollments_have_misconducts;
insert into enrollments_have_misconducts values (104,1);
insert into enrollments_have_misconducts values (104,2);
insert into enrollments_have_misconducts values (108,2);
insert into enrollments_have_misconducts values (105,3);
insert into enrollments_have_misconducts values (106,4);
insert into enrollments_have_misconducts values (104,5);

delete from extracurriculars;
insert into extracurriculars values (201,'D&D','2021-2022');
insert into extracurriculars values (202,'Anarchists united','2021-2022');
insert into extracurriculars values (203,'Soccer','2021-2022');
insert into extracurriculars values (204,'Chess club','2021-2022');
insert into extracurriculars values (205,'Club Sandwich','2021-2022');

delete from enrollments_have_extracurriculars;
insert into enrollments_have_extracurriculars values (104,201,'Dungeon Master');
insert into enrollments_have_extracurriculars values (105,201,'Player');
insert into enrollments_have_extracurriculars values (104,202,'Member');
insert into enrollments_have_extracurriculars values (106,202,'Member');
insert into enrollments_have_extracurriculars values (106,203,'Team Captain');
insert into enrollments_have_extracurriculars values (108,204,'Player');
insert into enrollments_have_extracurriculars values (108,205,'Sous-Chef');

delete from staff;
insert into staff values ('Karl Agathon',1001,'Teacher');
insert into staff values ('Kara Thrace',1002,'Principal');
insert into staff values ('Lee Adama',1003,'Teacher');
insert into staff values ('Samuel Anders',1004,'Custodian');
insert into staff values ('Laura Roslin',1005,'Teacher');
insert into staff values ('Tom Zarek',1006,'Teacher');

delete from courses;
insert into courses values (10001,'Applied Mathematics: Grade 9','A101','2020-2021',1001);
insert into courses values (10002,'Applied Physics: Grade 9','A102','2020-2021',1001);
insert into courses values (10003,'Gym: Grade 10','B666','2021-2022',1003);
insert into courses values (10004,'Applied Mathematics: Grade 10','C103','2021-2022',1001);
insert into courses values (10005,'English Literature: Grade 12','A101','2021-2022',1005);
insert into courses values (10006,'Drama and Poetry: Grade 10','B101','2021-2022',1006);

delete from grades;
insert into grades values(101,10001,99.8,3);
insert into grades values(101,10002,73.5,4);
insert into grades values(102,10001,68.9,3);
insert into grades values(103,10002,75.2,4);
insert into grades values(104,10003,85.0,2);
insert into grades values(105,10003,68.3,1);
insert into grades values(105,10003,70.2,2);
insert into grades values(107,10003,68.9,1);
insert into grades values(106,10004,90.3,4);
insert into grades values(107,10004,71.3,3);
insert into grades values(108,10005,67.4,1);
insert into grades values(106,10004,88.3,1);
insert into grades values(106,10006,82.2,2);