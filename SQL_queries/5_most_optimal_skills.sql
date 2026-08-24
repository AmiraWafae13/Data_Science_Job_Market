--What are the most optimal skills (high demand and a high_paying skill)?


WITH In_demand_skills AS(
    SELECT 
        skills.skill_id,
        skills.skills,
        count(skill_to_job.job_id) as demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim as skill_to_job
            ON job_postings_fact.job_id = skiLl_to_job.job_id  
    INNER JOIN skills_dim AS skills 
            ON skill_to_job.skill_id = skills.skill_id
    WHERE 
        job_postings_fact.job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_postings_fact.job_work_from_home = TRUE
        -- job_location = 'Algeria'
    GROUP BY   
        skills.skill_id
), top_paying_skills AS(
    SELECT 
        skill_to_job.skill_id,
        ROUND(AVG(salary_year_avg)) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim as skill_to_job
            ON job_postings_fact.job_id = skill_to_job.job_id
    INNER JOIN skills_dim as skills
            ON skiLl_to_job.skill_id = skills.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skill_to_job.skill_id
)
SELECT 
    In_demand_skills.skill_id,
    In_demand_skills.skills,
    demand_count,
    avg_salary
FROM
    In_demand_skills
INNER JOIN top_paying_skills
        ON In_demand_skills.skill_id = top_paying_skills.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;