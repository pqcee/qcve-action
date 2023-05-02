#!/bin/sh -l

USERNAME=$1
QUERYPATH=$2
OUTPUTPATH=$3
DATABASE=$4
NUMBER=$5

cd /action
echo "creating docker image for user: $USERNAME"

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
docker build -t qcve/action --build-arg NUMBER="$NUMBER" --build-arg USERNAME="$USERNAME" --build-arg DATABASE="$DATABASE" . && docker run -v $OUTPUTPATH:/opt/output -v $QUERYPATH:/opt/queries qcve/action