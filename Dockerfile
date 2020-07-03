FROM debian:10

WORKDIR /opt

# base layer, non-version-specific
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install dosbox unzip wget wine32

COPY bashrc /root/.bashrc
CMD bash
ENV WINEDEBUG=-all

# version-specific layer
RUN wget http://ftp.digitalmars.com/Digital_Mars_C++/Patch/dm857c.zip && \
    wget http://ftp.digitalmars.com/Digital_Mars_C++/Patch/dm850dos.zip && \
    unzip dm857c.zip && \
    unzip -u dm850dos.zip 
