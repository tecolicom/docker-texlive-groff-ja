FROM paperist/texlive-ja:latest
ENV PATH=/usr/local/bin/texlive:$PATH
ENV HOME=/root
WORKDIR /workdir

ENV LANG=ja_JP.UTF-8
ENV LC_CTYPE=ja_JP.UTF-8
RUN apt-get update && \
    apt-get -y upgrade \
    && apt-get install -y locales \
    && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen \
    && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

RUN apt-get update \
  && apt-get install -y \
    perl cpanminus carton gcc nodejs \
    git wget \
    groff \
    inkscape ghostscript fig2dev \
    bmake \
    less \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm -nq \
    https://github.com/kaz-utashiro/App-Greple-fbsd2.git
COPY inputrc $HOME/.inputrc
CMD [ "bash" ]
