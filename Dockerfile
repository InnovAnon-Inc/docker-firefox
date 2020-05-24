#FROM debian:10
#FROM debian:8
FROM poobuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}
#RUN apt update

# get parallelized curl script
#RUN apt install -y curl ca-certificates netselect
#RUN mkdir -pv /usr/local/bin
#RUN curl -o /usr/local/bin/pcurl https://raw.githubusercontent.com/InnovAnon-Inc/repo/master/pcurl.sh
#RUN chmod -v +x /usr/local/bin/pcurl

# list fastest mirrors
#RUN apt install -y netselect
#COPY netselect.awk .
#RUN netselect -s 20 -t 40 `pcurl https://www.debian.org/mirror/list | grep -o 'http://[^"]*'` \
#  | awk -f netselect.awk   \
#  | tee /tmp/apt-fast.conf
#RUN rm -v netselect.awk
#RUN apt purge -y netselect

# install parallelized apt wrapper
#RUN apt install -y gnupg gnupg-agent
#RUN echo deb http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main > /etc/apt/sources.list.d/apt-fast.list
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2166B8DE8BDC3367D1901C11EE2FF37CA8DA16B
#RUN apt update
#RUN apt install -y apt-fast
#RUN mv -v /tmp/apt-fast.conf /etc/apt-fast.conf
#RUN apt-fast update

# actually do the thing
#RUN apt-fast install -y xfce4=4.12.5
#RUN apt-fast install -y firefox-esr=68.7.0esr-1~deb10u1
#RUN apt-fast install -y firefox-esr=68.7.0esr\*
RUN apt-fast install firefox
RUN useradd -ms /bin/bash user
RUN usermod -a -G audio user
RUN usermod -a -G video user
USER user
WORKDIR /home/user
#ENTRYPOINT ["/usr/bin/firefox-esr", "https://upload.wikimedia.org/wikipedia/commons/8/81/Pronunciation_cs_milan_kundera.ogg"]
ENTRYPOINT ["/usr/bin/firefox"]

