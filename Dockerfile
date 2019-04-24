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

# install aws cli
RUN apt install -y python3-pip
RUN pip3 install awscli --upgrade


RUN echo "root:root" | sudo chpasswd

# create our developer user
RUN useradd -ms /bin/bash dev && echo "dev:dev" | sudo chpasswd
USER dev
WORKDIR /home/dev

# configure git
RUN git config --global core.editor "code --wait"
RUN git config --global user.email "timothywangdev@gmail.com"
RUN git config --global user.name "Timothy Wang"

# config vscode 
RUN wget https://github.com/shanalikhan/code-settings-sync/releases/download/v3.2.8/code-settings-sync-3.2.8.vsix
RUN code --install-extension code-settings-sync-3.2.8.vsix
RUN rm code-settings-sync-3.2.8.vsix
RUN wget https://raw.githubusercontent.com/timothywangdev/devEnv/master/settings.json -P ~/.config/Code/User


