FROM ubuntu:18.04
RUN apt-get update \
    && apt-get -y install \
       wget \
       unzip \
       tar \
       g++ \
       make \
       build-essential \
       libkrb5-dev \
       subversion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget https://sourceforge.net/p/cntlm/feature-requests/_discuss/thread/4a3be422/22d0/attachment/201211-cntlm-kerberos-authentication.patch
COPY cntlm-0.92.3 /root/cntlm-0.92.3
WORKDIR /root/cntlm-0.92.3
RUN chmod u+x configure && \
    ./configure --enable-kerberos && \
    make &&\
    make install
EXPOSE 3128
ENTRYPOINT [ "cntlm","-a gss" ]