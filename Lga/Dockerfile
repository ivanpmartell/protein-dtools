FROM python:3.6-slim

LABEL maintainer="Ivan Perez <ivanpmartell@uvic.ca>" \
      license="MIT"

WORKDIR /project

ADD packages_script.sh /packages_script.sh

RUN echo "Installing required packages" \
         && chmod +x /packages_script.sh \
         && bash /packages_script.sh "" \
         && pip3 install githubdl

# Replace token:
# Log into your Github account
# Click the Avatar Menu in the top-right corner, and select Settings
# On the left-hand side menu, select Developer Settings
# On the left-hand side menu, select Personal access tokens
# Click the Generate new token button, and enter its name
# Token should only require the read:org permission
# 1234567890123456789012345678901234567890123
ENV GIT_TOKEN=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

RUN echo "Installing LGA" \
         && githubdl -u "https://github.com/ElofssonLab/bioinfo-toolbox" -d "LGA_package" \
         && cd LGA_package \
         && ulimit -s unlimited

RUN echo "Fixing permissions" \
        && find LGA_package/ -type f -iname "*.pl" -exec chmod +x {} \;
         
ENTRYPOINT [ "/project/LGA_package/runlga.mol_mol.pl" ]