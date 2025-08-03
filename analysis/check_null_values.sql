/*
-- Bigquery Stored Procedure
DECLARE dataset_name STRING DEFAULT 'healthtail_raw';
DECLARE table_name   STRING DEFAULT 'healthtail_reg_cards';

DECLARE sql_string STRING;

-- Dynamische SQL-Bausteine aus INFORMATION_SCHEMA erzeugen
SET sql_string = (
  SELECT STRING_AGG(
    FORMAT(
      "COUNTIF(%s IS NULL) AS nulls_%s",
      column_name,
      column_name
    ),
    ',\n'
  )
  FROM `dbt-bigquery-10`.`healthtail_raw`.INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = 'healthtail_reg_cards'
);

-- Fertige Abfrage zusammenbauen
SET sql_string = FORMAT("""
SELECT
  %s
FROM `%s.%s`
""",
  sql_string,
  dataset_name,
  table_name
);

-- Ausführen
EXECUTE IMMEDIATE sql_string;
*/
{% set table_ref = "healthtail_raw.healthtail_reg_cards" %}

{% set columns_query %}
SELECT column_name
FROM `{{ project }}.{{ table_ref.split('.')[0] }}`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '{{ table_ref.split('.')[1] }}'
{% endset %}

{% set results = run_query(columns_query) %}
{% set columns = results.columns[0].values() %}

SELECT
{% for col in columns %}
    COUNTIF({{ col }} IS NULL) AS nulls_{{ col }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM `{{ table_ref }}`
