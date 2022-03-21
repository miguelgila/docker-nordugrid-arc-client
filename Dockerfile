FROM rockylinux/rockylinux:8

LABEL "Author"="Miguel Gila <miguel.gila@cscs.ch"

RUN dnf install epel-release dnf-utils -y
RUN dnf config-manager --set-enabled powertools

RUN curl -o /etc/yum.repos.d/EGI-trustanchors.repo  https://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo -s
RUN dnf install http://linuxsoft.cern.ch/wlcg/centos8/x86_64/wlcg-repo-1.0.0-1.el8.noarch.rpm -y
RUN dnf install wlcg-voms-* wlcg-iam-lsc-* fetch-crl nordugrid-arc-client ca-policy-egi-core -y

RUN yum -y install ca-policy-egi-core wget curl gfal2-util gfal2-all openssl

RUN yum clean all

RUN rm -rf /tmp/*

COPY run.sh /

RUN chmod +x /run.sh

# Set entrypoint
ENTRYPOINT ["/run.sh"]
