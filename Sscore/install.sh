#!/usr/bin/env bash

cd Sscore
cp ../packages_script.sh ./
docker build -t sscore .
rm packages_script.sh