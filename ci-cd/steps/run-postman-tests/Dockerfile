FROM ubuntu:18.04

ADD install-dependencies.sh /
RUN /install-dependencies.sh --Debug true

#This is here to keep this machine alive for debugging purposes
ENTRYPOINT ["/bin/bash", "-c", "tail -f"]