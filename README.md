# docker-h3270
Running tomcat + h3270 inside a container

h3270 is located at http://h3270.sourceforge.net/

to run this container:
	docker run -d -p 8080:8080 lemmy04/h3270:latest

to use it, browse to http://(containerhost):8080/h3270/servlet


