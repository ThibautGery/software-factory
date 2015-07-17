FROM evarga/jenkins-slave
COPY workspace/id_rsa.pub /home/jenkins/.ssh/authorized_keys
COPY workspace/id_rsa /home/jenkins/.ssh/id_rsa
COPY workspace/id_rsa.pub /home/jenkins/.ssh/id_rsa.pub
RUN chmod 600 /home/jenkins/.ssh/id_rsa

# Install Jenkins runtimes
RUN apt-get update -qq && apt-get install -qqy \
    git
