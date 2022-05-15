FROM ubuntu:20.04

LABEL maintainer="Ivan Perez <ivanpmartell@uvic.ca>" \
      license="MIT"

WORKDIR /project

ADD packages_script.sh /packages_script.sh

RUN echo "Installing required packages" \
         && chmod +x /packages_script.sh \
         && bash /packages_script.sh "ppa:ubuntu-toolchain-r/test" "g++-11 libstdc++6"

RUN echo "Installing TM-Score" \
         && wget https://zhanggroup.org/TM-score/TMscore.cpp \
         && g++ -static -O3 -ffast-math -lm -o TMscore TMscore.cpp
         
ENTRYPOINT [ "/project/TMscore" ]