FROM ubuntu:22.04
MAINTAINER Nils Ratusznik <nils.github@anotherhomepage.org>

RUN DEBIAN_FRONTEND=noninteractive apt-get update > /dev/null 2>&1 && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install wget acl curl git libexpat1 libncurses5 nginx unzip zip default-jre-headless python2.7 libpython2.7 libfreetype6 libgomp1 bzip2 libgl1-mesa-glx libsm6 libxrender1 libgomp1 libasound2 r-base-dev libicu-dev libcurl4-openssl-dev libssl-dev libxml2-dev pkg-config npm software-properties-common apt-transport-https > /dev/null 2>&1
RUN apt-add-repository -y -u ppa:deadsnakes/ppa > /dev/null && DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install python3.7 > /dev/null 2>&1
RUN useradd -m -s /bin/bash -U dss && mkdir /home/dss/DSS_DATA_DIR
COPY download_and_install.sh /usr/local/bin/download_and_install.sh

ENTRYPOINT ["/bin/bash"]
