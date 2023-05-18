    
CREATE TABLE Person(
    id BIGINT NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL,
    Surname TEXT NOT NULL
    age int check( age>0 and age<100)
);

CREATE TABLE Student(
    id BIGINT NOT NULL PRIMARY KEY REFERENCES Person(id) 
       ON DELETE CASCADE ON UPDATE CASCADE,
    sgroup BIGINT NOT NULL,
);

CREATE TABLE Professor(
    id BIGINT NOT NULL PRIMARY KEY REFERENCES Person(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Subject(
    id BIGINT NOT NULL PRIMARY KEY,
    Lecturer_id BIGINT NOT NULL REFERENCES Professor(id) ON UPDATE CASCADE ON DELETE SET NULL,
    Title TEXT NOT NULL
);

CREATE TABLE sgroup(
    id BIGINT NOT NULL PRIMARY KEY,
    year BIGINT NOT NULL,
    starosta BIGINT REFERENCES Student(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Marks(
    Student_id BIGINT NOT null references Student(id) on delete cascade on update cascade,
    Subject_id BIGINT NOT null references Subject(id) on delete cascade on update cascade,
    Mark BIGINT NOT NULL,
    Professor_id BIGINT NOT null,
    primary key (Student_id,Subject_id)
);

ALTER TABLE
    Student ADD CONSTRAINT student_sgroup_foreign FOREIGN KEY(sgroup) REFERENCES sgroup(id)  ON DELETE SET NULL ON UPDATE CASCADE;
