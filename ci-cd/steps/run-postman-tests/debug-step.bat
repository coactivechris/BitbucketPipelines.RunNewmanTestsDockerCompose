@echo off
rem Define the entrypoint for your container.  This is usually either /bin/bash or /bin/sh for docker containers which don't have bash installed
set CONTAINER_ENTRYPOINT=/bin/bash
rem this is the name of the container image you want to build / use for debugging.  The name has no other significance
rem than to define its purpose and store it in your local Docker cache.
rem See the Dockerfile in this directory for what is set up and how.
set CONTAINER_BUILD_IMAGENAME="debug:run-postman-tests"

rem get the base path for the git repository
for /f %%i in ('git rev-parse --show-toplevel') do set REPOSITORY_ROOT=%%i


echo The repository root is: %REPOSITORY_ROOT%


docker build --memory=1g --memory-swap=1g -t %CONTAINER_BUILD_IMAGENAME%  . --no-cache

rem connect us into our container to run local debugging
echo Now remoting you into your docker container to do some local debugging...
docker run -it --volume //var/run/docker.sock:/var/run/docker.sock --volume=%REPOSITORY_ROOT%:/local-repo --workdir="/local-repo" --memory=4g --memory-swap=4g --memory-swappiness=0 --entrypoint=%CONTAINER_ENTRYPOINT% %CONTAINER_BUILD_IMAGENAME%