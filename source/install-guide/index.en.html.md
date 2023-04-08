---
title: Install HomCloud
lang: en
---

# Install (recommended)

|OS|Description|OS version|
|:----|:----|:----|
|Ubuntu/Debian|[Install HomCloud into venv's virtual environment](install_guide_for_Ubuntu_venv.en.html)|Confirmed operation on Ubuntu 22.04 LTS|
|Windows|[Install on Windows](install_guide_for_Windows.en.html)|Confirmed operation on Windows10 Pro|
|OS X (Apple Silicon Mac)|[Install with Homebrew](install_guide_for_M1Mac.en.html)|Confirmed operation on macOS 13.3 Venture|
|OS X (Intel Mac)|[Install with Homebrew](install_guide_for_Mac.en.html)||


## Other installation guides

|OS|Description|OS version|
|:----|:----|:----|
|Ubuntu/Debian|[Install HomCloud with apt-get and pip](install_guide_for_Ubuntu.en.html)||

# Upgrading HomCloud

You can upgrade HomCloud as follows if you have installed HomCloud using the pip command.

    pip install -U homcloud
    
If you have installed HomCloud using conda, the following command will update HomCloud:

    conda update -c https://homcloud.dev/conda-channel/ homcloud

However, it is recommended to create a new conda virtual environment for the new HomCloud:
