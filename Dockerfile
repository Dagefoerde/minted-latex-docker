FROM ubuntu:18.04
MAINTAINER Fabian Wrede (forked from Vincent von Hof <vincent@vhof.de>, Andreas Fuchs)

# enable repos
RUN apt-get -qq update
RUN apt-get -qq install software-properties-common
RUN add-apt-repository -y main
RUN add-apt-repository -y restricted
RUN add-apt-repository -y universe
RUN apt-get -qq update

# Install packages
RUN apt-get -qq install texlive-full \
	 texlive-latex-extra \
	 python \
	 python-pygments \
	 biber \
	 latexmk \
	 make

# Clean up APT when done.
RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
