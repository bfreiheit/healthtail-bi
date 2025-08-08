# Healthtail BI Project

**Clinical pet health analytics with dbt & BigQuery**  

This project contains dbt models, seeds, and tests for analyzing clinical pet health data.
It uses Google BigQuery as the data warehouse and dbt for data modeling, documentation, and transformation.

**Dashboard in Google Looker Studio:**  
[Healthtail BI Report](https://lookerstudio.google.com/reporting/831d7db3-8076-4a5d-81f5-d7d51efd741e)

---

## Requirements

- Python 3.9+  
- Access to Google BigQuery
- dbt BigQuery adapter

---

## Installation & Setup

```bash
# Clone the repository
git clone git@github.com:bfreiheit/healthtail-bi.git
cd healthtail-bi/

# Create and activate a virtual environment
python3 -m venv .venv
source .venv/bin/activate  # macOS/Linux
# or: .venv\Scripts\activate  # Windows

# Install dependencies
pip install dbt-bigquery
pip install sqlfluff==0.4.0a1

# Verify installation
dbt --version

# Initialize the dbt project (if not already initialized)
dbt init healthtail

# Test the connection
dbt debug

# Create project directories
mkdir seeds models tests
mkdir models/staging models/marts
touch dbt_project.yml

# Load seed data
dbt seed

# Run specific models
dbt run -s models/staging/stg_reg_cards.sql
dbt run -s models/staging/stg_visits.sql
dbt run -s models/staging/stg_invoices.sql
dbt run -s models/marts/med_audits.sql

# Generate and serve documentation
dbt docs generate
dbt docs serve
```


