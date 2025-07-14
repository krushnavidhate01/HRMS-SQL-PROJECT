1)
create table clients ( client_id number(10) constraint client_id_pk primary key,
                       client_name varchar2(20),
                       industry varchar2(20),
                       email varchar2(50),
                       client_city varchar2(50));

2)
create table projects (project_id number(10) constraint pid_pk primary key,
                       first_name varchar2(30),last_name varchar2(30),
                       description varchar2(50),
                       start_date date,end_date date,status varchar2(20),
                       client_id number(10),
                       constraint client_id_fk foreign key (client_id) references clients(client_id));

3)
create table locations (location_id number(10) constraint location_id_pk primary key,
                        address varchar2(50),
                        city varchar2(20),
                        state varchar2(20),
                        country varchar2(20),
                        postal_code number(10));
4)
create table departments (department_id number(10) constraint department_id_pk primary key,
                          department_name varchar2(30),
                          location_id number(10),
                          constraint location_id_fk foreign key (location_id) references locations(location_id));

5)
create table employees (employee_id number(10) constraint employee_id_pk primary key,
                        first_name varchar2(20),last_name varchar2(20),
                        email varchar2(50),phone_number number(10),
                        hire_date date,salary number(20),
                        address varchar2(50),city varchar2(20),
                        department_id number(10),
                        constraint department_id_fk foreign key (department_id) references departments(department_id));

6)
create table project_employee (project_id number(10),
constraint project_id_fk1 foreign key (project_id) references projects(project_id),
                               employee_id number(10),
constraint employee_id_fk1 foreign key (employee_id)references employees(employee_id));

7)
create table jobs (job_id number(10) constraint job_id_pk primary key,
                   profile varchar2(20),
                   salary number(10),
                   department_id number(10),
                   constraint department_id_fk4 foreign key (department_id) references departments(department_id));

8)
create table training_program (training_id number(10) constraint training_id_pk primary key,
                               training_program_name varchar2(20),
                               description varchar2(50),
                               status varchar2(10),
                               start_date date,end_date date);

9)
create table applications (application_id number(10) constraint application_id_pk primary key,
                           application_name varchar2(30),
                           email varchar2(30),
                           phone_number number(10),
                           status varchar2(20),
                           resume varchar2(50),application_date date,
                           location_id number(10),
                           constraint location_id_fk5 foreign key (location_id) references locations(location_id));

10)

create table recruitment (recruitment_id number(10) constraint recruitment_id_pk primary key,
                          status varchar2(20),
                          posting_date date,closing_date date,
                          training_id number(10),
                          constraint training_id_fk7 foreign key (training_id) references training_program(training_id));

11)
create table application_recruitment (application_id number(10),
constraint application_id_fk2 foreign key (application_id) references applications(application_id),
                               recruitment_id number(10),
constraint recruitment_id_fk2 foreign key (recruitment_id)references recruitment(recruitment_id));

12)
create table promotions (promotion_id number(10) constraint promation_id_fk primary key,
                         employee_id number(10),promotion_date DATE,new_position varchar2(30),
                         old_position varchar2(30),
                         salary_increase number(10),
                         constraint employee_id_fk foreign key (employee_id) references employees(employee_id));

13)
create table leave (leave_id number(10) constraint leave_id_pk primary key,
                    employee_id number(10),
                    leave_type varchar2(30),
                    status varchar2(10),
                    description varchar2(30),
                    start_date date,
                    end_date date,
                    constraint employee_id_fk7 foreign key (employee_id) references employees(employee_id));

14)
create table payroll (payroll_id number(10) constraint patroll_id_pk primary key,
                      employee_id number(10),
                      pay_date date,
                      basic_salary number(10),
                      bonus number(10),
                      deductions number(10),
                      net_salary number(10),
                      constraint employee_id_fk8 foreign key (employee_id) references employees(employee_id),
                      training_id number(10),
                      constraint training_id_fk1 foreign key (training_id) references training_program(training_id),
                      constraint training_id unique (training_id));

15)
create table performance_reviews (performance_id number(10) constraint performance_id_pk primary key,
                                  rating number(10),
                                  comments varchar2(30),
                                  dates date,
                                  recruitment_id number(10),
                                  constraint recruitment_id_fk foreign key (recruitment_id) references recruitment(recruitment_id),
                                  constraint recruitment_id unique  (recruitment_id));

16)
create table requirements (requirement_id number(10),
                           requirement_name varchar2(20),
                           description varchar2(30),
                           performance_id number(10),
                           constraint performance_id_fk foreign key (performance_id) references performance_reviews(performance_id),
                           promotion_id number(10),
                           constraint promotion_id_fk foreign key (promotion_id) references promotions(promotion_id));

17)
CREATE TABLE attendance (
    attendance_id NUMBER(10) CONSTRAINT attendance_id_pk PRIMARY KEY,
    attendance_date DATE,
    check_in_time TIMESTAMP,
    check_out_time TIMESTAMP,
    status VARCHAR2(10),
    employee_id NUMBER(10),
    CONSTRAINT employee_id_fk9 FOREIGN KEY (employee_id) REFERENCES employees(employee_id));
