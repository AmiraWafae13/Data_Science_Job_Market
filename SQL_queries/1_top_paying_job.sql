
/*
 Question :What are the top_paying data_analyst jobs?
_Identify the top 10 highest_paying Data Analyst roles that are avalaible remotely
_ Focuses on job Postings with specified salaries (removes null)
_ Why ? Highlight the top_paying opportunities for data analysis , offering insights into employers 
*/
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    company.name as company_name,
    job_location,
    job_schedule_type,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim as company
        ON job_postings_fact.company_id = company.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    -- (salary_hour_avg IS NOT NULL or
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
