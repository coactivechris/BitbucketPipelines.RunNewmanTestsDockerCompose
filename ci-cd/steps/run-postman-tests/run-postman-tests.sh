#!/bin/bash
echo "Running Build Step: {0}....................................................................................................................."
echo "............................................................................................................................................"

echo "Building and running up the compose application............................................................................................."
cd src
docker-compose build
docker-compose up -d

$BASE_URL = $(docker-machine ip default)

echo "Base url is $BASE_URL" 

echo "waiting for the API to be up and running and healthy before proceeding......................................................................"
#curl -w ''%{http_code}'' http://localhost:54411/health
#while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:51294/health)" != "200" ]]; do sleep 5; done

echo "Running postman collection.................................................................................................................."
#newman run 'Tests/Postman/price-predict.model-tests.collection.json' -e 'Tests/Postman/price-predict.local-dev.environment.json'

echo "........................................................................................Test run complete.  Downing the compose application."
#docker-compose down

echo "............................................................................................................................................"
echo ".........................................................................................................................Build Step Complete"