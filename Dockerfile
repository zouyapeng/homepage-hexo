FROM centos:7
MAINTAINER ZouYapeng
LABEL author=ZouYapeng email=zyp19901009@gmail.com site=https://www.zouyapeng.com

ENV LANG en_US.utf-8
ENV LC_ALL en_US.utf-8
WORKDIR /hexo

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y epel-release \
&& yum install -y nodejs git \
&& npm install hexo-cli -g \
&& yum clean all && rm -rf /var/cache/yum \
&& hexo init HomePage

ADD entrypoint.sh /hexo

VOLUME ["/hexo/HomePage"]
EXPOSE 4000
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]