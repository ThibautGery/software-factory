FROM jenkins

USER root

# Install Docker prerequisites
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    lxc

# Install Jenkins runtimes
RUN apt-get update -qq && apt-get install -qqy \
    git
    
# Install Docker from Docker Inc. repositories.
RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 \
  && apt-get update -qq \
  && apt-get install -qqy lxc-docker

# Add jenkins user to the docker groups so that the jenkins user can run docker without sudo
RUN gpasswd -a jenkins docker

# Install the magic wrapper
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

#Activate http API for jenkins plugin
ENV DOCKER_DAEMON_ARGS -d -H 0.0.0.0:4243 -H unix:///var/run/docker.sock --insecure-registry registry:5000



USER jenkins

#Add plugins
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN plugins.sh /var/jenkins_home/plugins.txt

#Add jobs
COPY jobs /var/jenkins_home/jobs/

#Add Configs file
COPY config/jenkins.xml /var/jenkins_home/config.xml
COPY config/credentials.xml /var/jenkins_home/credentials.xml

RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

USER root
#Change jobs ownership from root to jenkins
RUN chown -R jenkins /var/jenkins_home
RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa


ENTRYPOINT ["/usr/local/bin/wrapdocker", "/usr/local/bin/jenkins.sh"]
