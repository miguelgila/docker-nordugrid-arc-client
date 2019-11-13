FROM centos:8

LABEL "Author"="Miguel Gila <miguel.gila@cscs.ch"
LABEL version="8/"
LABEL description="Very basic Nordugrid ARC client based on CentOS"

ADD http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo /etc/yum.repos.d/
RUN yum -y install https://download.nordugrid.org/packages/nordugrid-release/releases/6/centos/el8/x86_64/nordugrid-release-6-1.el8.noarch.rpm
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

RUN yum -y install dnf-utils
RUN yum config-manager --set-enabled PowerTools
RUN yum -y install nordugrid-arc-client nordugrid-arc-plugins-globus


RUN yum -y install ca-policy-egi-core wget curl gfal2-util gfal2-all

RUN rm -rf /tmp
