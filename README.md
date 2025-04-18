# TfL Station Footfall Data Analysis Pipeline

## Overview



## Technologies

- Cloud: Google Cloud Platform
- Infrastructure as Code: Terraform
- Workflow Orchestration: Kestra
- Data Warehouse: Google BigQuery
- Transformation: dbt
- Visualization: Google Looker Studio

## How to run

### Clone this repository

```
git clone https://github.com/hbg108/tfl-data-visualization.git
```

### Service account

Create a service account named "tfl-service-account" in your GCP and assign it the following roles:

- BigQuery Admin
- Compute Admin
- Storage Admin

Create a json credential key for the created service account, when created, save the key and rename it to "tfl.json". Create a folder named ".keys" under the repository folder, and move the key into it.

### Infrastructure as Code - Terraform

Go to the terraform folder, modify the values in the variables.tf accordingly and execute the following commands to create a bucket in the Google Cloud Storage and a dataset in the BigQuery for subsequent use.

```bash
terraform init
terraform plan
terraform apply
```

### Workflow Orchestration - Kestra

Go to the kestra folder, and execute the following command to run Kestra in docker.

```bash
docker compose up
```

Execute the following commands to add flows into Kestra.

```bash
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/01_kv.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/02_station_footfall.yaml
```

Open the Kestra UI by visiting http://localhost:8080/ in your browser. Edit the values in the flow 01_kv accordingly and execute it to set needed key-value pairs in Kestra.

Go to the KV Store and see if the following key-value pairs are correctly setted: GCP_LOCATION, GCP_PROJECT_ID, GCP_DATASET, GCP_BUCKET_NAME. 

Manually add a new key-value in the tfl namespace whose key is "GCP_CREDS", type is JSON, and value is the content of the tfl.json file that downloaded when create the service account.

Now you should be able to execute the flow 02_station_footfall to put data into cloud storage bucket and BigQuery dataset. It is suggested that the flow be executed by 6 times, with the input selection of the year from 2019 to 2024_2025. Due to the naming rule of the data file changed from 2023, the flow processes the data file before 2023 and from 2023 differently.

### Transformation - dbt

If you have not installed dbt yet, you can follow the following steps:

https://docs.getdbt.com/docs/core/installation-overview

```bash
python -m pip install dbt-core dbt-bigquery
```
cd ~
mkdir .dbt
touch profiles.yml

In the dbt folder, execute the following commands:

```bash
dbt init tfl

The profile tfl already exists in /home/hbg/.dbt/profiles.yml. Continue and overwrite it? [y/N]: N
cd tfl
dbt debug
to check connection to BigQuery
If All checks passed! the connection is OK
```

dbt build --select station_footfall_daily

in dbt/tfl, dbt build










## Dashboard