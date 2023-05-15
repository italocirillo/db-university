/*1. Contare quanti iscritti ci sono stati ogni anno*/

    SELECT COUNT(*) as `students_number`,YEAR(`enrolment_date`) AS `YEAR`
    FROM `students` 
    GROUP BY YEAR(`enrolment_date`);

/*2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio*/

    SELECT COUNT(*) as `teacher_number`,`teachers`.`office_address`
    FROM `teachers` 
    GROUP BY `office_address`;

/*3. Calcolare la media dei voti di ogni appello d'esame*/

    SELECT AVG(`vote`) as `avg_media`,`exam_student`.`exam_id`
    FROM `exam_student` 
    GROUP BY `exam_student`.`exam_id`;

/*4. Contare quanti corsi di laurea ci sono per ogni dipartimento*/

    SELECT COUNT(*) AS `courses_departments`,`departments`.`name` AS `departments_name` 
    FROM `degrees` 
    JOIN `departments`
    ON `degrees`.`department_id` = `departments`.`id`
    GROUP BY `degrees`.`department_id`;