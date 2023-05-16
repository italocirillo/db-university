1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

    SELECT `students`.`name` AS `nome_studente`,`students`.`surname`,`degrees`.`name` AS `degrees_coursees`
    FROM `students` 
    JOIN `degrees`
    ON `students`.`degree_id`= `degrees`.`id`
    WHERE `degrees`.`name`= 'Corso di Laurea in Economia';

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

    SELECT `departments`.`name` AS `departments_name`,`degrees`.`level`,`degrees`.`name` AS `degress_name`
    FROM `degrees`
    JOIN `departments` 
    ON `degrees`.`department_id` = `departments`.`id`
    WHERE `degrees`.`level` = "magistrale"
    AND `departments`.`name` = "Dipartimento di Neuroscienze";

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

    SELECT `teachers`.`name`,`teachers`.`surname`,`courses`.`name` AS `courses_name`
    FROM `teachers`
    JOIN `course_teacher`
    ON  `teachers`.`id` = `course_teacher`.`teacher_id`
    JOIN `courses`
    ON `course_teacher`.`course_id` = `courses`.`id`
    WHERE `teachers`.`id`= 44;


4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

    SELECT `students`.`surname`,`students`.`name`,`degrees`.`name` AS `name_degrees`,`departments`.`name` AS `name_departments` FROM `students` 
    JOIN `degrees` 
    ON `students`.`degree_id` = `degrees`.`id` 
    JOIN `departments` 
    ON `degrees`.`department_id` = `departments`.`id` 
    ORDER BY `students`.`surname`,`students`.`name` ASC;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

    SELECT `teachers`.`name` AS `teachers_name` , `teachers`.`surname` AS `teachers_surname`, `degrees`.`name` AS `degrees_name`,`courses`.`name` AS `courses_name`
    FROM `degrees` 
    JOIN `courses`
    ON `degrees`.`id`=`courses`.`degree_id`
    JOIN `course_teacher`
    ON `courses`.`id` = `course_teacher`.`course_id`
    JOIN `teachers`
    ON `teachers`.`id` = `course_teacher`.`teacher_id`;

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

    SELECT DISTINCT `teachers`.`name` AS `teachers_name` , `teachers`.`surname` AS `teachers_surname`,`departments`.`name` AS `departments_name` 
    FROM `teachers` 
    JOIN `course_teacher`
    ON `teachers`.`id` = `course_teacher`.`teacher_id` 
    JOIN `courses` 
    ON `course_teacher`.`course_id` = `courses`.`id` 
    JOIN `degrees` 
    ON `courses`.`degree_id` = `degrees`.`id` 
    JOIN `departments` 
    ON `degrees`.`department_id`=`departments`.`id` 
    WHERE `departments`.`name`= "Dipartimento di Matematica" 
    ORDER BY `teachers_surname` ASC;


7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

    SELECT`students`.`name`,`students`.`surname`,`courses`.`name` AS `courses`,
    COUNT(*) AS `exam_appeal`,MAX(`vote`) AS `max_vote`
    FROM `students` 
    JOIN `exam_student`
    ON `students`.`id` = `exam_student`.`student_id`
    JOIN `exams`
    ON `exam_student`.`exam_id` = `exams`.`id`
    JOIN `courses`
    ON `exams`.`course_id` = `courses`.`id`
    GROUP BY `courses`.`id`,`students`.`id`
    HAVING `max_vote` >= 18