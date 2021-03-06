#!/usr/bin/env bash
set -x

# Display containers resources usage before limitation
docker stats --no-stream

#limit memory used by each container
docker update --memory=2Gb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_alfresco_' | awk '{print $1}')
docker update --memory=1200Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_search_' | awk '{print $1}')
#docker update --memory=1Gb --memory-swap -1 $(docker ps -a | grep '_zeppelin_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_postgres_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_transform-router_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_imagemagick_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_alfresco-pdf-renderer_' | awk '{print $1}')
docker update --memory=300Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_shared-file-store_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_tika_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_libreoffice_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_activemq_' | awk '{print $1}')
docker update --memory=512Mb --memory-swap -1 --restart on-failure $(docker ps -a | grep '_transform-misc_' | awk '{print $1}')

#stop not needed containers
docker stop $(docker ps -a | grep '_zeppelin_' | awk '{print $1}')
docker stop $(docker ps -a | grep '_sync-service_' | awk '{print $1}')

# Display containers resources usage after limitation
docker stats --no-stream
