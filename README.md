# stanke.dev

## this is a site generator using Hugo. 

### To build:
```
hugo -s hugo -d ../public
```

### To deploy to Firebase:

0. enable KMS
1. get a token: `firebase login:ci`
2. encrypt it:
```
echo -n $TOKEN | gcloud kms encrypt \
  --plaintext-file=- \
  --ciphertext-file=- \
  --location=global \
  --keyring=stanke-dev \
  --key=firebase | base64
```
3. paste encrypted token into cloudbuild.yaml

## To build in Cloud Build
### Prerequisites
* Build and push two community builders to GCR:
  * firebase
  * hugo