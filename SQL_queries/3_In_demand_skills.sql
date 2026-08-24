-- most in demand skills for my role "Data Analyst"
-- Why ? Retrieves the top 5 in demand skills in the job market providing insights into the most valuable skills for job seekers .


SELECT 
    skills,
    count(skill_to_job.job_id) as demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim as skill_to_job
        ON job_postings_fact.job_id = skiLl_to_job.job_id  
INNER JOIN skills_dim AS skills 
        ON skill_to_job.skill_id = skills.skill_id
INNER JOIN company_dim as company 
        ON company.company_id = job_postings_fact.company_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_work_from_home = TRUE
    -- job_location = 'Algeria'
GROUP BY   
    skills
ORDER BY
    demand_count DESC
limit 5;
