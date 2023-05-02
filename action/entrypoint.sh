#!/bin/sh -l

echo "$NUMBER: analyzing db: $DATABASE with query from: $USERNAME"

cd /opt/queries && codeql pack install

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
codeql database analyze /opt/databases/$DATABASE --format=sarif-latest --output=/opt/output/$USERNAME-$NUMBER-result.sarif /opt/queries/