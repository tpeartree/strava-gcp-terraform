# Strava data pipeline in GCP

Terraform module for infrastructure supporting receiving Strava data in Google Cloud Platform.

## Prerequisites
This module does not create its own GCP Project. You should do this first.

You should also ensure that you can connect to GCP. If you have a credentials file from GCP then you can load its location as the `GOOGLE_APPLICATION_CREDENTIALS` environment variable, by executing `export GOOGLE_APPLICATION_CREDENTIALS=/path/to/credentials.json`.

You must also create the repository for each of the cloud function. You can do this in one of three ways:
1. Fork the repositories into your own github account, and connect them to Google Source Repositories. Any chances you commit to Github will be reflected in GCP automatically.
2. Clone my repositories locally. Create a new Google Source Repository, add a new remote, and push to GCP. Any changes you commit to Google will be reflected in GCP automatically.
3. Download the repositories locally as a ZIP, add them to Cloud Storage, and modify the Terraform code in storage.tf to point to the Cloud Storage location. You will have to disable or modify the build job if you do this.

Repositories in Google can be pulled using this URL format, which you need to supply as a variable:
`https://source.developers.google.com/projects/${project}/repos/${repo_name}/moveable-aliases/${branch}/paths/'

## Required variables

| Variable | Example |
| --- | --- |
| project | "project_id to deploy to" |
| region  | "region to deploy to". Defaults to us-central1 |
| bigquery_table | "project.dataset.table" |
| bucket_name | "bucket_name" |
| webhook_repo_url | "github_username_strava-webhook" |
| pull_repo_url | "github_username_strava-pull" |
| gcs_to_gbq_repo_url | "github_username_strava-webhook" |

Variables can be set if you call this repo as a module, or using a tfvars file.
