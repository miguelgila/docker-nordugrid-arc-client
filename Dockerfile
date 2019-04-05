FROM centos:7

MAINTAINER Miguel Gila <miguel.gila@cscs.ch>

RUN yum -y install https://download.nordugrid.org/packages/nordugrid-release/testing/6rc1/centos/el7/x86_64/nordugrid-release-6-0.rc1.el7.noarch.rpm

RUN yum -y install nordugrid-arc-client nordugrid-arc-plugins-globus

ADD http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo /etc/yum.repos.d/

RUN yum -y install ca-policy-egi-core wget curl

RUN rm -rf /tmp
