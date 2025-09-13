 #!/usr/bin/env bash

 # Execute this file to install the morrigan cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Morrigan-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Morrigan-Qt.app/Contents/MacOS/morrigand /usr/local/bin/morrigand
 sudo ln -s ${LOCATION}/Morrigan-Qt.app/Contents/MacOS/morrigan-cli /usr/local/bin/morrigan-cli
