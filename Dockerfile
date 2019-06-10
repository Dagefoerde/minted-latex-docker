FROM ubuntu:18.04
MAINTAINER Fabian Wrede (forked from Vincent von Hof <vincent@vhof.de>, Andreas Fuchs)

# enable repos
RUN apt-get -qq update
RUN sudo apt-get -qq install software-properties-common
RUN sudo add-apt-repository -y main
RUN sudo add-apt-repository -y restricted
RUN sudo add-apt-repository -y universe
RUN apt-get -qq update

# Install packages
RUN apt-get install -qq texlive-full \
	 texlive-latex-extra \
	 python \
	 python-pygments \
	 biber \
	 latexmk \
	 make

# Clean up APT when done.
RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
