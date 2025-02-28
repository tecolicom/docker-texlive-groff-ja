FROM paperist/texlive-ja:latest
ENV HOME=/root
WORKDIR /workdir

ENV LANG=ja_JP.UTF-8
ENV LC_CTYPE=ja_JP.UTF-8
RUN apt-get update && \
    apt-get -y upgrade \
    && apt-get install -y locales \
    && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen \
    && :

RUN apt-get update \
    && apt-get install -y \
    gcc nodejs \
    git wget vim \
    groff \
    inkscape ghostscript fig2dev \
    bmake \
    fonts-noto fonts-noto-cjk fonts-noto-cjk-extra \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN apt-get update \
    && apt-get install -y \
       perl perl-doc cpanminus carton \
       less source-highlight \
       mecab mecab-ipadic-utf8 \
    && :

RUN cpanm -nq \
    https://github.com/kaz-utashiro/App-Greple-fbsd2.git \
    https://github.com/kaz-utashiro/App-lms.git \
    && rm -fr ~/.cpanm \
    && :

##
## install docker client
##
# Add Docker's official GPG key:
RUN \
    apt-get update && \
    apt-get install ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
RUN \
    . /etc/os-release && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $VERSION_CODENAME stable" | \
      tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli
#    apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

COPY root /root
RUN  cd /root && for rc in inputrc bashrc; do cat $rc >> $HOME/.$rc; done
RUN  cd /usr/share/source-highlight && mv src-hilite-lesspipe.sh src-hilite-lesspipe.sh-bak
COPY src-hilite-lesspipe.sh /usr/share/source-highlight

CMD [ "bash" ]
