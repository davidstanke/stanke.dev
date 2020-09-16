# stanke.dev

## this is a site generator using Hugo. 
It demonstrates a very simple CI/CD flow, using a "gitops light" delivery proccess.
  * **When a pull request is opened**, a Cloud Build trigger creates a dedicated preview environment in Cloud Run. The unique URL to that environment is posted to the PR as a status check _(credit to [glasnt](https://github.com/glasnt))_
  * **When the PR is merged**, a different Cloud Build trigger deploys from `main` to the production Cloud Run service, which is mapped to [stanke.dev](https://stanke.dev)

## Local Dev
Requires [hugo](gohugo.io) in your PATH.
### To run in watch mode (defaults to port 1313):
`hugo -s hugo serve`

### To generate the site locally:
`hugo -s hugo -d ../public`

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

### Set up two Cloud Build triggers:
1. When a new pull request is opened, build using `preview.cloudbuild.yaml`
2. When a commit is merged to master, build using `cloudbuild.yaml`

