FROM jenkins

USER jenkins

COPY jobs /var/jenkins_home/jobs/

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN plugins.sh /var/jenkins_home/plugins.txt


USER root

RUN chown -R jenkins /var/jenkins_home/jobs
