# Filename: Dockerfile 
FROM centos/systemd
SHELL [ "/bin/bash", "-c" ]

RUN curl https://packages.chef.io/files/current/automate/latest/chef-automate_linux_amd64.zip | gunzip - > chef-automate
RUN chmod +x chef-automate
#COPY installer/chef-automate /
ENV container docker
COPY lbport.toml /
COPY fqdn.toml /
RUN /chef-automate airgap bundle create
RUN /chef-automate init-config
COPY install.sh /
RUN chmod +x install.sh
COPY install.service /usr/lib/systemd/system/
RUN systemctl enable install.service