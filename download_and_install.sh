#!/bin/bash

dss_user="dss"
home_dir="/home/${dss_user}"
dss_url="https://cdn.downloads.dataiku.com/public/dss/11.3.2/dataiku-dss-11.3.2.tar.gz"
dss_data_dir="${home_dir}/DSS_DATA_DIR"

wget -q "${dss_url}" -O "${home_dir}/dss.tar.gz"
mkdir -p "${dss_data_dir}"
tar xf "${home_dir}/dss.tar.gz" -C ${home_dir} && chown -R ${dss_user}:${dss_user} ${home_dir}/dataiku-dss-11.3.2 && rm -f ${home_dir}/dss.tar.gz
su - ${dss_user} -c '${home_dir}/dataiku-dss-11.3.2/installer.sh -d ${dss_data_dir} -p 11000'
