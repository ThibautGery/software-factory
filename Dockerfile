FROM jenkins

USER jenkins

COPY jobs /var/jenkins_home/jobs/

USER root

RUN chown -R jenkins /var/jenkins_home/jobs
