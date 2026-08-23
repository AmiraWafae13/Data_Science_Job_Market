
SELECT 
    skills.skills as skill_name,
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
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
* Data Engineering is highly valued:
    PySpark ranks #1 ($208K), with Databricks, Airflow,
     Elasticsearch, Kubernetes, and PostgreSQL also appearing strongly.  

* Python is a key foundation:
    Jupyter, Pandas, NumPy, and Scikit-learn 
    all rank among the top-paying skills, 
    showing strong demand for Python-based data analysis and ML.  

* Cloud & engineering skills increase earning potential:
     GCP, Linux, Kubernetes, GitLab/Bitbucket, 
     and Jenkins suggest that higher-paying data roles increasingly combine 
     **analytics + software engineering + cloud/infrastructure**.  
*/

/*
[
  {
    "skill_name": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skill_name": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skill_name": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skill_name": "watson",
    "avg_salary": "160515"
  },
  {
    "skill_name": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skill_name": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skill_name": "swift",
    "avg_salary": "153750"
  },
  {
    "skill_name": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skill_name": "pandas",
    "avg_salary": "151821"
  },
  {
    "skill_name": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skill_name": "golang",
    "avg_salary": "145000"
  },
  {
    "skill_name": "numpy",
    "avg_salary": "143513"
  },
  {
    "skill_name": "databricks",
    "avg_salary": "141907"
  },
  {
    "skill_name": "linux",
    "avg_salary": "136508"
  },
  {
    "skill_name": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skill_name": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skill_name": "twilio",
    "avg_salary": "127000"
  },
  {
    "skill_name": "airflow",
    "avg_salary": "126103"
  },
  {
    "skill_name": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skill_name": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skill_name": "notion",
    "avg_salary": "125000"
  },
  {
    "skill_name": "scala",
    "avg_salary": "124903"
  },
  {
    "skill_name": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skill_name": "gcp",
    "avg_salary": "122500"
  },
  {
    "skill_name": "microstrategy",
    "avg_salary": "121619"
  }
]*/