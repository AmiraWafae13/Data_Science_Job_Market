# Data_Science_Job_Market
a project build with SQL to analyze the top_paying roles and skills from a dataset of jobs to help job seekers or looking for a promotion to know what roles/skills they should target 


# Introduction 
A SQL project exploring the 2023 data analyst job market to find the highest-paying roles, most in-demand skills, and skills with strong salary potential.

SQL queries ?  check them out here : 
    [SQL_queries folder](/Data_Science_Job_Market/SQL_queries/)
# 🎯 Questions I Wanted to Answer 
* What are the highest-paying data analyst jobs?
* Which skills are required for these jobs?
* What skills are most in demand?
* Which skills are associated with higher salaries?
* What skills are worth learning?
# Background 

# 🛠️ Tools I Used 
* SQL — querying, filtering, joining, and analyzing the data
* PostgreSQL — database used for the analysis
* VS Code — writing and running SQL queries
* Git & GitHub — version control and project sharing
# The Analysis
## 1. 💰 Top-Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.
``` sql
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
```
### Key Insights

- 💵 The top 10 salaries ranged from **$184K to $650K**.
- 🏢 High-paying opportunities came from companies across different industries, including **SmartAsset, Meta, and AT&T**.
- 📊 Job titles varied from **Data Analyst** to more senior roles such as **Director of Analytics**, showing that the field includes different levels of responsibility and specialization.

## 2. 🛠️ Skills Required for Top-Paying Jobs

Next, I wanted to understand **which skills appear in the highest-paying roles**.
``` sql
WITH top10_jobs_per_salary AS(
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    company.name as company_name
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
LIMIT 10)
SELECT
    top10_jobs_per_salary.*,
    skills.skills
FROM
    top10_jobs_per_salary
INNER JOIN skills_job_dim as skill_to_job
        ON top10_jobs_per_salary.job_id = skiLl_to_job.job_id
    
INNER JOIN skills_dim AS skills 
        ON skill_to_job.skill_id = skills.skill_id
ORDER BY
    salary_year_avg DESC
```

## 3. 🔥 Most In-Demand Skills

I then looked at which skills were most frequently requested across remote data analyst job postings.
```sql
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
```

### Key Insights

**SQL clearly stands out as the most requested skill**, followed by Excel and Python.

The top skills also show an interesting combination of:

- 🗄️ **Data querying:** SQL
- 📊 **Data analysis:** Excel
- 🐍 **Programming:** Python
- 📈 **Visualization & BI:** Tableau and Power BI

For someone starting a career in data analytics, these skills form a strong foundation.

### Top-Paying Skills

| Skill | Average Salary |
|-------|---------------:|
| PySpark | $208,172 |
| Bitbucket | $189,155 |
| Couchbase | $160,515 |
| Watson | $160,515 |
| DataRobot | $155,486 |
| GitLab | $154,500 |
| Swift | $153,750 |
| Jupyter | $152,777 |
| Pandas | $151,821 |
| Elasticsearch | $145,000 |

### What I Found

The highest-paying skills were not limited to traditional data analysis tools.

They included:

- ⚙️ **Big data technologies** such as PySpark
- 🤖 **Machine learning and AI tools**
- 🐍 **Python ecosystem tools** such as Pandas and Jupyter
- ☁️ **Cloud and data platforms**
- 🔧 **Development and deployment tools** such as GitLab and Kubernetes

This points to an important trend: **the higher end of data analytics increasingly overlaps with data engineering, cloud, and machine learning.**

---

## 5. 🚀 Most Optimal Skills to Learn

Finally, I combined **skill demand and average salary** to identify skills that could offer a strong balance between job opportunities and earning potential.

```sql
Data_Science_Job_Market/SQL_queries/5_most_optimal_skills.sql
```



### Key Insights

Three areas stood out to me:

**☁️ Cloud & Data Platforms**

Skills such as **Snowflake, Azure, AWS, and BigQuery** combine solid demand with relatively high salaries.

**🐍 Programming**

Python and R are highly demanded, showing that programming remains an important part of modern data analytics.

**📊 BI & Visualization**

Tools such as **Tableau and Looker** continue to be valuable for turning data into insights that support business decisions.

Overall, the data suggests that the strongest long-term skill set goes beyond simply knowing how to write SQL. Combining **SQL + Python + BI + cloud/data technologies** can open up more opportunities.

---

# 🧠 What I Learned

This project helped me move beyond practicing isolated SQL exercises and use SQL to answer **real-world questions**.

### My main takeaways:

- 🔗 **Complex SQL:** Practiced joins, CTEs, filtering, grouping, and sorting across multiple tables.
- 📊 **Data Aggregation:** Used `COUNT()`, `AVG()`, `GROUP BY`, and `HAVING` to extract meaningful patterns.
- 🧩 **Problem Solving:** Learned how to turn a business question into a SQL query.
- 💡 **Data Storytelling:** Practiced turning query results into insights instead of just looking at numbers.
- 🎯 **Career Research:** Used data to understand which technical skills are actually valuable in the job market.

---

# 📌 Conclusion

This project gave me a clearer picture of what the **data analyst job market looked like in 2023**.

The biggest takeaway for me is that **SQL remains the foundation of data analytics**. However, the highest-value opportunities increasingly connect analytics with **Python, cloud platforms, big data, business intelligence, and data engineering**.

If I were building my skills based on these findings, I would prioritize:

**SQL → Python → BI/Visualization → Cloud & Data Platforms**

This project also reinforced something important: instead of learning technologies randomly, **I can use job market data to make more informed decisions about what to learn next.**

---

## 📂 Project Structure

```text
data-analyst-job-market/

├── CSV&JSON files/
│   ├── top_Paying_jobs.csv
│   ├── top_paying_job's_skills.sql
│   ├── top_paying_job_skills.json
│
├── SQL_queries/
│   ├── 1_top_paying_jobs.sql
│   ├── 2_top_paying_job's_skills.sql
│   ├── 3_In_demand_skills.sql
│   ├── 4_top_paying_skills.sql
│   └── 5_most_optimal_skills.sql
│
└── README.md
```

---

## ⭐ Final Thought

This project started as a SQL practice project, but it became more than that for me.

It helped me connect **SQL, databases, data analysis, and the real job market** — and gave me a better idea of where I want to take my data career next.