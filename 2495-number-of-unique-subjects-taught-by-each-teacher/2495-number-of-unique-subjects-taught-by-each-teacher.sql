SELECT teacher_id, COUNT(DISTINCT subject_id) as cnt
from teacher
group by teacher_id