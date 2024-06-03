.PHONY: build build-webpage build-conda deploy

update: build-webpage build-conda

build-webpage:
	bundle exec middleman build

build-conda:
	sh ./build_conda.sh

deploy:
	gsutil -m rsync -r build gs://homcloud.dev
	gsutil -m rsync -r conda-channel gs://homcloud.dev/conda-channel
	# 以下の行を有効にするとCDNキャッシュが全てクリアされる
	# gcloud compute url-maps invalidate-cdn-cache homcloud-dev-lb --project homcloud-website  --host homcloud.dev --path "/*" 
