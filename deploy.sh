#!/bin/sh

PYTHON_API_DIR="../main/python/apidoc-src/_build/html"

gsutil -m rsync -r build gs://homcloud.dev
gsutil -m rsync -r $PYTHON_API_DIR gs://homcloud.dev/python-api
# gcloud compute url-maps invalidate-cdn-cache homcloud-dev-lb --project homcloud-website  --host homcloud.dev --path "/*" 
