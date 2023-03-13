FROM ruby:3.1.2

RUN apt-get update
RUN apt-get -y install tzdata imagemagick make g++ git build-essential ca-certificates curl autoconf automake libtool pkg-config


RUN git clone https://github.com/openvenues/libpostal
WORKDIR /libpostal
RUN ./bootstrap.sh
RUN ./configure
RUN make -j4
RUN make install
WORKDIR /
RUN rm -rf /libpostal