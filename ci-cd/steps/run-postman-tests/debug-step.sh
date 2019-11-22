#!/bin/bash
# Get the base path for our git repository, so we can mount it as a virtual repo on our container
REPOSITORY_ROOT="$(git rev-parse --show-toplevel)"
# This is the command you want for the entry point of your docker container as you debug it
CONTAINER_ENTRYPOINT="/bin/bash"

# this is the name of the container image you want to build / use for debugging.  The name has no other significance
# than to define its purpose and store it in your local Docker cache.
# See the Dockerfile in this directory for what is set up and how.
CONTAINER_BUILD_IMAGENAME="debug:run-postman-tests"

echo "The repository root is: ${REPOSITORY_ROOT}"

echo "Building our debugging docker container"
docker build --memory=1g --memory-swap=1g -t %CONTAINER_BUILD_IMAGENAME%  .

# Now that we've built our container, let's remote on to it to run some local debugging
# Note we are passing in the entry point
echo "Now remoting you into your docker container to do some local debugging..."
docker run -it  -v //var/run/docker.sock:/var/run/docker.sock  --volume=${REPOSITORY_ROOT}:/local-repo --workdir="/local-repo" --memory=4g --memory-swap=4g --memory-swappiness=0 --entrypoint=${CONTAINER_ENTRYPOINT} ${CONTAINER_BUILD_IMAGENAME}