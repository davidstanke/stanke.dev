# stanke.dev

## this is a site generator using Hugo. 

### To generate the site locally (requires [hugo](gohugo.io)):
```
hugo -s hugo -d ../public
```
## To build in Cloud Build
### Prerequisites
* Build and push these builders to GCR:
  * /tools/hugo-builder
  * /tools/pr-status-poster
* Save your GitHub token to a GCP Secrets Manager secret named `github_token`
  * `gcloud secrets create github_token --replication-policy automatic` 
  * `echo -n "${GITHUB_TOKEN}" | gcloud secrets versions add github_token --data-file=-`
* Grant Cloud Build access to the token:
  * `PROJECT_ID=$(gcloud config list --format='value(core.project)')`
  * `PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')`
  * `gcloud secrets add-iam-policy-binding github_token --member serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com -role roles/secretmanager.secretAccessor`
  * (ALSO: grant Cloud Build service account IAM access to Secret Manager / accessor) [TODO: verify if this is necessary]

### Set up two Cloud Build triggers:
1. When a new pull request is openeed, build using `preview.cloudbuild.yaml`
2. When a commit is merged to master, build using `cloudbuild.yaml`

