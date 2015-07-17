Sofware factory
===============

The purpose of this project is to create a software factory that run jobs in containers.

Usages
------

A few usefull commands :

 * run jenkins : `docker-compose up` then use this url [localhost:8080](http://localhost:8080)
 * build the new configuration : `docker-compose build`
 * remove the container : `docker-compose rm -f`  

Pre-requisite
-------------

You need to run the job `build-job-base` in order to create the `build-base` images locally.

Requirements
------------

You will need

 * [Docker](https://docs.docker.com/installation/)
 * [Docker Compose](https://docs.docker.com/compose/install/)

Add a new docker template
-------------------------

 * create the job in jenkins
 * use a `Dockerfile` it must extend `build-base`
 * add the specific dependencies of your project (eg : maven, node...)
 * add the new template in [jenkins config](jenkins/config/jenkins.xml)
 * Using the command `docker exec -it autojenkins_udd_1 bash` you can connect in the container and get the config file of the jobs created here `/var/jenkins_home/jobs/{{ name of the job }}/config.xml`
 * put the config file in the repository in `jobs/{{ name of the job }}/config.xml`
 * rebuild the image : `docker-compose build`

*TODO* : This is too complicated, it must be easier

Add a new job
-------------

 * create the job in jenkins
 * run it in a docker container and use the correct template
 * Using the command `docker exec -it autojenkins_udd_1 bash` you can connect in the container and get the config file of the jobs created here `/var/jenkins_home/jobs/{{ name of the job }}/config.xml`
 * put the config file in the repository in `jobs/{{ name of the job }}/config.xml`
 * rebuild the image : `docker-compose build`

Add a new plugin
----------------
 * Find the plugin id on [jenkins plugin website](https://wiki.jenkins-ci.org/display/JENKINS/Plugins)
 * add the plugin in `plugins.txt` using the following syntax : `{{ id of the plugin }}:{{ version of the plugin }}`
 * rebuild the image : `docker-compose build`

*BEWARE* : the system doesn't handle plugins dependencies. You should install the dependencies yourself

Todos
-----

 * run jenkins master as jenkins (not as root)
 * run registry with a certificate and https
