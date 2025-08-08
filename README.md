# Healthtail BI Project

**Clinical pet health analytics with dbt & BigQuery**  

Dieses Projekt enthält dbt-Modelle, Seeds und Tests für die Analyse von klinischen Tiergesundheitsdaten.  
Es nutzt **Google BigQuery** als Data Warehouse und **dbt** für Datenmodellierung, Dokumentation und Transformation.

📊 **Dashboard in Google Looker Studio:**  
[Healthtail BI Report](https://lookerstudio.google.com/reporting/831d7db3-8076-4a5d-81f5-d7d51efd741e)

---

## 🚀 Voraussetzungen

- Python 3.9+  
- Zugriff auf Google BigQuery  
- dbt-BigQuery-Adapter  
- Git  

---

## 📦 Installation & Setup

```bash
# Repository klonen
git clone git@github.com:bfreiheit/healthtail-bi.git
cd healthtail-bi/

# Virtuelle Umgebung erstellen & aktivieren
python3 -m venv .venv
source .venv/bin/activate  # macOS/Linux
# oder: .venv\Scripts\activate  # Windows

# Abhängigkeiten installieren
pip install dbt-bigquery
pip install sqlfluff==0.4.0a1

# Installation prüfen
dbt --version

# dbt Projekt initialisieren (falls neu)
dbt init healthtail

# Verbindung testen
dbt debug

# Projektverzeichnisse anlegen
mkdir seeds models tests
mkdir models/staging models/marts
touch dbt_project.yml

# Daten laden
dbt seed
```


