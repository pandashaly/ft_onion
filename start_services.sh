#!/bin/bash
service nginx start
service ssh start
service tor start
tor &
nginx -g "daemon off;"

# Tor must run in the foreground to keep the Tor service active.
# Nginx also needs to run in the foreground to keep the web server active.