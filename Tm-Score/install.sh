#!/usr/bin/env bash

cd Tm-Score
cp ../packages_script.sh ./
docker build -t tm-score .
rm packages_script.sh