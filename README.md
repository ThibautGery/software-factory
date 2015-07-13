Sofware factory
===============

The purpose of this project is to create a software factory that run jobs in containers.

Usages
------

A few usefull commands :

 * run jenkins : `docker-compose up` then use this url [localhost:8080](http://localhost:8080)
 * build the new configuration : `docker-compose build`
 * remove the container : `docker-compose rm -f`  

Requirements
------------

You will need

 * [Docker](https://docs.docker.com/installation/)
 * [Docker Compose](https://docs.docker.com/compose/install/)

Add a new job
-------------

 * create the job in jenkins
 * Using the command `docker exec -it autojenkins_udd_1 bash` you can connect in the container and get the config file of the jobs created here `/var/jenkins_home/jobs/{{ name of the job }}/config.xml`
 * put the config file in the repository in `jobs/{{ name of the job }}/config.xml`
