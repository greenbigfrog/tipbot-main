FROM ubuntu:14.04

RUN apt-get update \
	&& apt-get install --no-install-recommends -y software-properties-common \
	&& add-apt-repository ppa:bitcoin/bitcoin \
	&& apt-get update \
	&& apt-get --no-install-recommends -y install build-essential libssl-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev git curl autogen autoconf autotools-dev libtool automake pkg-config libevent-dev libgmp-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8



WORKDIR /usr/local/src
RUN git clone https://github.com/Electra-project/Electra-core

WORKDIR /usr/local/src/Electra-core/
RUN git checkout 81cec8d && ./autogen.sh && ./configure --disable-tests && make

RUN adduser --disabled-password --home /electra --gecos "" electra
RUN echo "electra ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY Electra.conf /electra/.Electra/Electra.conf
RUN chown -R electra:electra /electra/.Electra

RUN cp /usr/local/src/Electra-core/src/electrad /electrad

USER electra
WORKDIR /electra

EXPOSE 5817

CMD ["/electrad", "-printtoconsole"]
