FROM node:12-buster

ENV RUNNER_TEMP /home/runner/work/_temp
ENV RUNNER_TOOL_CACHE /opt/hostedtoolcache
ENV GITHUB_WORKSPACE /home/runner/work/_actions/__USER__/__REPO__/main
ENV GITHUB_ACTION run3
ENV GITHUB_RUN_NUMBER 52
ENV RUNNER_DEBUG 1
ENV DEPLOYMENT_BASEPATH /opt/runner
ENV GITHUB_ACTIONS true
ENV RUNNER_OS Linux
ENV HOME /home/runner
ENV GITHUB_API_URL https://api.github.com
ENV LANG C.UTF-8
ENV CI true
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
 && apt-get -y dist-upgrade \
 && apt-get -y install openjdk-11-jdk-headless \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /home/runner && echo "runner:x:1001:1001:runner:/home/runner:/bin/bash" >> /etc/passwd \
 && chown -R runner /home/runner

RUN mkdir -p /opt/hostedtoolcache; chmod -R 777 /opt
RUN mkdir -p /home/runner/work/_actions/__USER__/__REPO__/main
RUN mkdir -p /home/runner/work/_actions/__USER__/__REPO__/main.completed
RUN mkdir -p /home/runner/work/_temp
RUN chown -R runner /home/runner
