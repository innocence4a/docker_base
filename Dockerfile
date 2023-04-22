FROM ubuntu:20.04
USER root

# RUN sudo apt install -y nodejs npm
RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y \
        git \
        sudo \
        make \
        vim \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        less \
        libbz2-dev \
        libreadline-dev \
        libgdbm-dev \
        libsqlite3-dev \
        wget \
        curl \
        # llvm \
        tar \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        # tk-dev \
        libffi-dev \
        liblzma-dev \
        # uuid-dev \
        libdb-dev \
        locales
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

RUN wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tar.xz  && \
    tar -xJf ./Python-3.10.9.tar.xz && \
    cd Python-3.10.9  && \
    ./configure  && \
    make  && \
    sudo make install

# RUN wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0a6.tar.xz  && \
#     tar -xJf ./Python-3.12.0a6.tar.xz && \
#     cd Python-3.12.0a6  && \
#     ./configure  && \
#     make  && \
#     sudo make install

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN sudo apt install -y python3-pip
# RUN pip install --upgrade pip
# RUN pip install --upgrade setuptools
RUN cd ..
COPY ./opt/requirements.txt ./requirements.txt
RUN python3.10 -m pip install --upgrade pip
# RUN python3.11 -m pip install --upgrade setuptools
RUN python3.10 -m pip install -r ./requirements.txt
# RUN python -m pip install jupyterlab
EXPOSE 8888