/************** GROUP BY **************/

/* 1. Contare quanti iscritti ci sono stati ogni anno */
    SELECT COUNT(id) AS n_iscritti, YEAR(enrolment_date) AS anno 
    FROM students 
    GROUP BY anno


/* 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio */
    SELECT COUNT(id) AS insegnati, office_address AS indirizzo_ufficio
    FROM teachers 
    GROUP BY indirizzo_ufficio


/* 3. Calcolare la media dei voti di ogni appello d'esame */
    SELECT ROUND(AVG(vote), 2) AS media_voti, exam_id
    FROM exam_student
    GROUP BY exam_id


/* 4. Contare quanti corsi di laurea ci sono per ogni dipartimento */
    SELECT COUNT(id) AS n_corsi, department_id
    FROM degrees
    GROUP BY department_id



/************** JOINS **************/

/*1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */
    SELECT students.id, students.name, students.surname, students.registration_number, students.email
    FROM students
    JOIN degrees
    ON students.degree_id = degrees.id
    WHERE degrees.name = "Corso di Laurea in Economia"


/* 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze */
    SELECT degrees.id AS degree_id, degrees.name, degrees.level, degrees.address, degrees.email, degrees.website
    FROM degrees
    JOIN departments
    ON degrees.department_id = departments.id
    WHERE departments.name = "Dipartimento di Neuroscienze"


/*3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */
    SELECT courses.id AS course_id, courses.name, courses.description, courses.period, courses.year, courses.cfu, courses.website
    FROM course_teacher
    JOIN courses
    ON course_teacher.course_id = courses.id
    JOIN teachers
    ON course_teacher.teacher_id = teachers.id
    WHERE teachers.name = "Fulvio" AND teachers.surname = "Amato"


/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome */
    SELECT students.id AS student_id, students.surname, students.name, degrees.id AS degree_id, degrees.name AS degree_name, degrees.level, departments.id AS department_id, departments.name AS department_name
    FROM students
    JOIN degrees
    ON students.degree_id = degrees.id
    JOIN departments
    ON degrees.department_id = departments.id
    ORDER BY students.surname, students.name ASC


/* 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */
    SELECT degrees.id AS degree_id, degrees.name AS degree_name, degrees.level AS degree_level, courses.id AS course_id, courses.name AS course_name, courses.description, courses.cfu, teachers.id AS teacher_id, teachers.surname AS teacher_surname, teachers.name AS teacher_name, teachers.email AS teacher_email
    FROM degrees
    JOIN courses
    ON degrees.id = courses.degree_id
    JOIN course_teacher
    ON courses.id = course_teacher.course_id
    JOIN teachers
    ON course_teacher.teacher_id = teachers.id
    ORDER BY degrees.name ASC


/* 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) */
    SELECT teachers.id AS teacher_id, teachers.name, teachers.surname, teachers.phone, teachers.email, teachers.office_address, teachers.office_number
    FROM teachers
    JOIN course_teacher
    ON teachers.id = course_teacher.teacher_id
    JOIN courses
    ON course_teacher.course_id = courses.id
    JOIN degrees
    ON courses.degree_id = degrees.id
    JOIN departments
    ON degrees.department_id = departments.id
    WHERE departments.name = "Dipartimento di Matematica"