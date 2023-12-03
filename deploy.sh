#!/bin/sh

gsutil -m rsync -r build gs://homcloud.dev
gsutil -m rsync -r conda-channel gs://homcloud.dev/conda-channel
# gcloud compute url-maps invalidate-cdn-cache homcloud-dev-lb --project homcloud-website  --host homcloud.dev --path "/*" 
