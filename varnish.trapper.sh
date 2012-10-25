#!/bin/bash

VARNISHSTAT=$(which varnishstat)
$VARNISHSTAT -1  | awk  -v host=$HOSTNAME  '{print host" varnish.stat["$1"] "$2}';
