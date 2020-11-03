FROM registry.hub.docker.com/library/ubuntu:16.04
RUN apt update && apt install software-properties-common apt-transport-https ca-certificates -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
    apt-add-repository https://cli.github.com/packages && \
    apt update && \
    apt install gh -y

# Env var: GITHUB_TOKEN must be provided at runtime
ENTRYPOINT ["gh"]