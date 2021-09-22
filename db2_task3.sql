CREATE TABLE students(
    full_name               VARCHAR(50) NOT NULL UNIQUE,
    age                     INT CHECK ( age > 0 ) NOT NULL,
    birth_date              DATE NOT NULL,
    gender                  VARCHAR NOT NULL,
    gpa                     FLOAT,
    info_about_yourself     TEXT,
    need_for_dormitory      BOOLEAN,
    additional_info         TEXT,
    PRIMARY KEY (full_name)
);

CREATE TABLE instructors(
    full_name               VARCHAR NOT NULL UNIQUE,
    language                VARCHAR,
    experience              TEXT,
    remote_lessons          BOOLEAN,
    PRIMARY KEY (full_name)
);

CREATE TABLE lesson_participants(
    lesson_title            VARCHAR NOT NULL UNIQUE,
    teaching_instructor     VARCHAR NOT NULL,
    student_name            VARCHAR NOT NULL,
    room_number             INTEGER,
    PRIMARY KEY (lesson_title),
    FOREIGN KEY (teaching_instructor) REFERENCES instructors(full_name),
    FOREIGN KEY (student_name) REFERENCES students(full_name)
);

