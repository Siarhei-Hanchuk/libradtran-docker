FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
	curl \
	build-essential \
	gfortran \
	python \
	flex \
	libnetcdf-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/libradtran/ \
  && curl -SL http://www.libradtran.org/download/history/libRadtran-1.7.tar.gz \
	| tar -xzC /usr/local/libradtran/ \
  && cd /usr/local/libradtran/libRadtran-1.7 \
  && ./configure && make

ENV PATH /usr/local/libradtran/libRadtran-1.7/bin:$PATH
