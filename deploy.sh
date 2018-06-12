#!/bin/sh

lftp -u hiraokaweb -p 22 sftp://ns5.wpi-aimr.tohoku.ac.jp -e "mirror -R build/ /public_html/homcloud/; exit"
