FROM debian:10

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y wget locales
RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN adduser --disabled-password --home /dogecoin --gecos "" dogecoin
RUN echo "dogecoin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /usr/local/src
RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.2/dogecoin-1.14.2-x86_64-linux-gnu.tar.gz
RUN tar -xzvf dogecoin-1.14.2-x86_64-linux-gnu.tar.gz
RUN chmod +x dogecoin-1.14.2/bin/dogecoind dogecoin-1.14.2/bin/dogecoin-cli
RUN ln -s /usr/local/src/dogecoin-1.14.2/bin/dogecoind /usr/local/bin/dogecoind
RUN ln -s /usr/local/src/dogecoin-1.14.2/bin/dogecoin-cli /usr/local/bin/dogecoin-cli

COPY dogecoin.conf /dogecoin/.dogecoin/dogecoin.conf
RUN chown -R dogecoin:dogecoin /dogecoin/.dogecoin

USER dogecoin
WORKDIR /dogecoin

EXPOSE 22555 22556

CMD ["dogecoind"]
