FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    gfortran \
    python \
    flex \
    libnetcdf-dev \
    libgsl-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/ \
  && curl -SL http://www.libradtran.org/download/libRadtran-2.0.2.tar.gz \
    | tar -xzC /opt/ \
  && mv /opt/libRadtran-2.0.2 /opt/libRadtran \
  && cd /opt/libRadtran \
  && ./configure && make

ENV PATH /opt/libRadtran/bin:$PATH

WORKDIR /opt/libRadtran

VOLUME ["/opt/libRadtran/shared"]
