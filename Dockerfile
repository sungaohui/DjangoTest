FROM centos:7
USER root

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

WORKDIR /opt/myblog
RUN yum -y install wget && rm -rf /etc/yum.repos.d/* && wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo && wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
RUN yum -y install python36 python3-devel gcc pcre-devel zlib-devel make net-tools nginx

COPY . .

COPY myblog.conf /etc/nginx/myblog.conf

RUN pip3 install -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com -r requirements.txt

RUN chmod +x run.sh && rm -rf ~/.cache/pip

EXPOSE 8002

CMD ["./run.sh"]
