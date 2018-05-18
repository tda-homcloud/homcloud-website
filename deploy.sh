#!/bin/sh

bundle exec middleman build
lftp -u hiraokaweb -p 22 sftp://ns5.wpi-aimr.tohoku.ac.jp -e "mirror -R build/ /public_html/homcloud/; exit"
