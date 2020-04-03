FROM adnrv/texlive:full	
MAINTAINER Jan Dageförde

# avoid interaction during installation
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update
RUN apt-get -qq install apt-utils

# enable repos, not necessary, just to make sure
RUN apt-get -qq install software-properties-common
RUN add-apt-repository -y main
RUN add-apt-repository -y universe
RUN apt-get -qq update

# Install packages
RUN apt-get -qq \
	 python \
	 python-pip \
	 python-pygments \
	 git

# Minted + Pygments
RUN tlmgr update --self && \
    tlmgr install minted

# Clean up APT when done.
RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
