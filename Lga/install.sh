#!/usr/bin/env bash

cd Lga
cp ../packages_script.sh ./
docker build -t lga .
rm packages_script.sh