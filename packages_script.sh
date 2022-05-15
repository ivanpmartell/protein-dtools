#!/usr/bin/env bash

readonly DEBIAN_PPA="${1}"
readonly DEBIAN_PACKAGES="${2}"
export DEBIAN_FRONTEND=noninteractive

echo "Installing packages"
apt-get update
apt-get install -y \
    wget \
    gnupg2 \
    lsb-release \
    apt-utils \
    software-properties-common \
    build-essential \
    git
if [ -z "$DEBIAN_PACKAGES" ]
then
    echo "done"
else
    echo "Installing project specific packages"
    add-apt-repository -y ${DEBIAN_PPA}
    apt-get update
    apt-get install -y ${DEBIAN_PACKAGES}
fi

apt-get autoremove --purge -y
apt-get autoclean -y
rm -rf /var/cache/apt/*