# Kettle-Docker
Pentaho Data Integration project running in a ***Docker*** container with python

### Usage
* First thing to do is use the command `docker-compose -f docker-compose-local.yml build` to prepare image to run

* Second thing to do is use the command `docker-compose -f docker-compose-local.yml up` in root folder

* After with ***Docker*** running, go to the url (http://localhost:8080/job/start.py)[http://localhost:8080/job/start.py], this will execute kettle project and the log can be found in terminal where ***Docker*** was executed
