#!/bin/sh
 
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
~/.embulk/bin/embulk run config.yml