ARG TAG
FROM atlas/analysisbase:21.2.${TAG}-centos7

USER root
RUN \
  yum update -y && \
  yum install -y jq tree bash-completion && \
  yum clean all && \
  true

# python installs
WORKDIR /home/atlas
COPY requirements.txt .
RUN \
  . /home/atlas/release_setup.sh && \
  pip install --upgrade pip && \
  pip install -r requirements.txt

COPY custom-rc.bash /home/atlas/.bashrc

ADD https://raw.githubusercontent.com/dguest/_h5ls/master/_h5ls.sh /etc/
RUN chmod a+r /etc/_h5ls.sh

USER atlas
WORKDIR /workdir

CMD /bin/bash --rcfile /home/atlas/.bashrc
