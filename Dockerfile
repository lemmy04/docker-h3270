FROM opensuse/leap:15.2

# date: 2021-05-07

MAINTAINER lemmy04 <Mathias.Homann@openSUSE.org>

LABEL version=0.0.1 description="Running h3270 in a container"

## install everything needed to run a telegram bot
RUN zypper ar -e -p 75 -r https://download.opensuse.org/repositories/home:/lemmy04/openSUSE_Leap_15.2/home:lemmy04.repo \
	&& zypper --gpg-auto-import-keys ref \
	&& zypper install -y -l tar bzip2 gzip xz ant tomcat tomcat-servlet-4_0-api junit x3270 \
	&& zypper cc --all

ADD ["https://downloads.sourceforge.net/project/h3270/h3270/1.3.3/h3270-1.3.3.tar.gz","/tmp/tarball.tar.gz"]

WORKDIR /tmp
RUN tar xaf /tmp/tarball.tar.gz
WORKDIR /tmp/h3270-1.3.3

ADD ["./build.properties","/tmp/h3270-1.3.3"]
ADD ["h3270-config.xml","webapp/WEB-INF/h3270-config.xml"]

RUN ant war deploy

EXPOSE 8080

CMD /usr/lib/tomcat/server start

