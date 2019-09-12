ARG TAG
FROM atlas/analysisbase:21.2.${TAG}-centos7

USER root
RUN \
  yum update -y && \
  yum install -y jq tree bash-completion && \
  pushd /tmp/ && \
  wget https://centos7.iuscommunity.org/ius-release.rpm && \
  rpm -i --nodeps ius-release.rpm && \
  popd && \
  yum remove -y git && \
  yum install -y git2u && \
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
COPY custom_logout.bash /home/atlas/.bash_logout

COPY _h5ls/_h5ls.sh /etc/dguest/
COPY git-fatlas/git-fatlas.sh /etc/dguest
COPY pandamonium/pandamon /usr/local/bin/
COPY mark-and-jump/mark-and-jump.sh /etc/dguest
COPY get-branches /usr/local/bin

USER atlas
WORKDIR /workdir

CMD /bin/bash
