#!/bin/bash

if [ "$GIT_BRANCH" = "dev" ]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag nginximage amanikandan16497/dev
    docker push amanikandan16497/dev

elif [ "$GIT_BRANCH" = "master" ]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag nginximage amanikandan16497/prod 
    docker push amanikandan16497/prod
fi
   
