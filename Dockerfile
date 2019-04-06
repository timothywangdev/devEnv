FROM ubuntu:18.04

ENV CODEDEB=https://go.microsoft.com/fwlink/?LinkID=760868
ADD $CODEDEB code.deb

RUN apt-get update && apt-get -y install \
    --no-install-recommends \
    ./code.deb \
    software-properties-common \
    build-essential \
    apt-transport-https \
    libgtk2.0-0 \
    libx11-xcb1 \
    libxtst6 \
    libxss1 \
    libasound2 \
    git \
    openssh-server \
    xauth \
    ttf-ubuntu-font-family \
    wget \
    unzip \
    curl \
    sudo \
 && rm -rf code.deb \
 && rm -rf /var/lib/apt/lists/*

# get nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# update apt cache
RUN apt-get update

# install nodejs
RUN sudo apt-get install -y nodejs

# install hack font
run wget 'https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip'
run unzip Hack*.zip
run mkdir /usr/share/fonts/truetype/Hack
run mv Hack* /usr/share/fonts/truetype/Hack
run fc-cache -f -v

# create our developer user
RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /home/dev

