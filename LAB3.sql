----------------EX.1--------------------------
-- A
SELECT * FROM course
WHERE credits>3;

-- B
SELECT * FROM classroom
WHERE building = 'Watson' or building='Packard';

-- C
SELECT * FROM course
WHERE dept_name = 'Comp. Sci.';

-- D
SELECT course.course_id, title, dept_name, credits, semester
FROM course, section
WHERE semester='Fall' AND course.course_id = section.course_id;

--E
SELECT * FROM student
WHERE tot_cred > 45 AND tot_cred < 90;

-- F
SELECT * FROM student
WHERE name~*'[AEWIUOY]$';

--G
SELECT course.course_id, title, dept_name, credits, prereq_id
FROM prereq, course
WHERE prereq_id = 'CS-101' AND course.course_id = prereq.course_id;



----------------EX.2--------------------------
-- A
SELECT dept_name, avg(salary)
FROM instructor
GROUP BY dept_name
ORDER BY avg(salary) ASC;

-- B    Сначала, считаем  course_id, потом ьмаксимум этого чиса и вычесляем
SELECT department.building, count(1)
FROM department, course
WHERE department.dept_name = course.dept_name
GROUP BY department.building
HAVING count(1) = (SELECT max(MX.CNT) FROM (SELECT count(course.course_id) AS CNT FROM department, course
WHERE department.dept_name = course.dept_name
GROUP BY department.building) AS MX);


-- C
SELECT course.dept_name, count(1)
FROM course
GROUP BY course.dept_name
HAVING count(1) = (SELECT min(MN.CNT) FROM (SELECT count(course.course_id) AS CNT FROM course
GROUP BY course.dept_name) AS MN);




-- E
SELECT * FROM instructor
WHERE (instructor.dept_name = 'Biology' OR instructor.dept_name = 'Philosophy' OR instructor.dept_name = 'Music');


-- F
SELECT DISTINCT instructor.id, instructor.name, teaches.year FROM instructor, teaches
WHERE instructor.id = teaches.id
        AND teaches.year = '2018'
        AND teaches.id NOT IN
            (SELECT DISTINCT instructor.id FROM instructor, teaches
            WHERE instructor.id = teaches.id
            AND teaches.year = '2017');







----------------EX.3--------------------------
-- A
SELECT DISTINCT student.id, student.name, student.dept_name, student.tot_cred
FROM student, takes
WHERE student.dept_name = 'Comp. Sci.'
          AND student.id = takes.id
          AND (takes.grade = 'A' OR takes.grade = 'A-')
ORDER BY student.name ASC ;

-- B
SELECT * FROM instructor WHERE instructor.id IN
(SELECT advisor.i_id
FROM instructor, advisor, takes
WHERE instructor.id = advisor.i_id
        AND advisor.s_id = takes.id
        AND (takes.grade != 'A' AND takes.grade != 'A-' AND takes.grade != 'B+' AND takes.grade != 'B' OR takes.grade IS NULL));


-- C
SELECT DISTINCT * FROM department
WHERE department.dept_name NOT IN
(SELECT DISTINCT department.dept_name
FROM student, takes, department
WHERE student.id = takes.id
        AND department.dept_name = student.dept_name
        AND (takes.grade = 'F' OR takes.grade = 'C'));

-- D
--takes.grade = 'A' так как instructor.id NOT IN
SELECT DISTINCT instructor.id, instructor.name
FROM instructor
WHERE instructor.id NOT IN
(SELECT DISTINCT instructor.id
FROM instructor, takes, teaches
WHERE instructor.id = teaches.id
        AND teaches.course_id = takes.course_id
        AND takes.grade = 'A');


-- E
SELECT DISTINCT section.course_id, course.title
FROM section, time_slot, course
WHERE time_slot.time_slot_id = section.time_slot_id
        AND section.course_id = course.course_id
        AND time_slot.end_hr < 13 ;
