FROM paperist/texlive-ja:latest
ENV PATH /usr/local/bin/texlive:$PATH
WORKDIR /workdir
RUN apt-get update \
  && apt-get install -y \
    perl cpanminus carton gcc nodejs \
    wget \
    groff \
    ghostscript fig2dev \
    bmake \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm -n \
    App::Greple \
    Unicode::EastAsianWidth \
    JSON
COPY inputrc $HOME/.inputrc
CMD [ "bash" ]
