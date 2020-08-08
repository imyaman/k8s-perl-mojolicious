FROM fedora:latest
MAINTAINER Sangyong Gwak <imyaman@netscape.net>

RUN yum install -y glibc-langpack-en glibc-langpack-ko perl-Mojolicious procps
RUN yum clean all
RUN groupadd -r mojo -g 500
RUN useradd -u 500 -r -g mojo -d /home/mojo -m -s /sbin/nologin -c "Mojolicious user" mojo

# Setup workdir
WORKDIR /home/mojo
COPY . .
RUN chown -R mojo:mojo *
RUN chmod a+rx app.pl

# run
WORKDIR /home/mojo
USER mojo
EXPOSE 3000
CMD ./app.pl prefork -l "http://*:3000" app.pl
