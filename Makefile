.PHONY: build build-webpage deploy

update: build-webpage

build-webpage:
	bundle exec middleman build

deploy:
	gsutil -m rsync -r build gs://homcloud.dev
	gsutil -m rsync -r conda-channel gs://homcloud.dev/conda-channel

cdn-cache-clear:
	gcloud compute url-maps invalidate-cdn-cache homcloud-dev-lb --project homcloud-website  --host homcloud.dev --path "/*"
