# #!/bin/sh
 
# Install Embulk Plugins
# if [ -n "$PLUGINS" ] ; then
#   ~/.embulk/bin/embulk gem install $PLUGINS
# fi

# if [ ! -n "$CONFIG" ]; then
#     echo "CONFIG variable is not defined!"
#     exit 1   
# fi

# Convert Embulk Config to generate seed.yml
# python3 converter.py

# ~/.embulk/bin/embulk gem install embulk-input-redshift
# ~/.embulk/bin/embulk gem install embulk-output-mysql

#~/.embulk/bin/embulk guess seed.yml -o config.yml
# ~/.embulk/bin/embulk preview config.yml
#~/.embulk/bin/embulk run -c diff.yml config.yml
# ~/.embulk/bin/embulk run config.yml

#!/usr/bin/env bash

CONFIG_DIR="/tmp/config.yml"

# printf "%s\n" "${@}"
	# BASE64
# printf "Running embulk with base64 config, decoding string to %s\n" "${CONFIG_DIR}"
echo "${BASE64_CONFIG}" | base64 -d > "${CONFIG_DIR}"

/opt/embulk/embulk run "${CONFIG_DIR}"
