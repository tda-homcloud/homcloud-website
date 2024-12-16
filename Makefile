.PHONY: build build-webpage deploy

update: build-webpage deploy cdn-cache-clear

build-webpage:
	bundle exec middleman build

deploy:
	gsutil -m rsync -r build gs://homcloud.dev

cdn-cache-clear:
	gcloud compute url-maps invalidate-cdn-cache homcloud-dev-lb --project homcloud-website  --host homcloud.dev --path "/*"
