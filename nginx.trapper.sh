#!/bin/sh
# Script to fetch nginx statuses for zabbix
# Based on Tpl_Tribily_App_Nginx_Extended_v1.0 by krish@tribily.com
# License: GPLv2

# Set Variables

HOST="127.0.0.1"
PORT="80"
FTCH="curl -s"
HOSTNAME=$(hostname)

# Functions to return nginx stats

ACTIVE=$($FTCH "http://$HOST:$PORT/nginx_status" | grep 'Active' | awk '{print $NF}')
READING=$($FTCH "http://$HOST:$PORT/nginx_status" | grep 'Reading' | awk '{print $2}')
WRITING=$($FTCH "http://$HOST:$PORT/nginx_status" | grep 'Writing' | awk '{print $4}')
WAITING=$($FTCH "http://$HOST:$PORT/nginx_status" | grep 'Waiting' | awk '{print $6}')
ACCEPTS=$($FTCH "http://$HOST:$PORT/nginx_status" | awk NR==3 | awk '{print $1}')
HANDLED=$($FTCH "http://$HOST:$PORT/nginx_status" | awk NR==3 | awk '{print $2}')
REQUESTS=$($FTCH "http://$HOST:$PORT/nginx_status" | awk NR==3 | awk '{print $3}')

echo "$HOSTNAME nginx.connections.active $ACTIVE"
echo "$HOSTNAME nginx.requests $REQUESTS";
echo "$HOSTNAME nginx.connections.writing $WRITING";
echo "$HOSTNAME nginx.connections.waiting $WAITING";
echo "$HOSTNAME nginx.connections.reading $READING";
echo "$HOSTNAME nginx.handled $HANDLED";
echo "$HOSTNAME nginx.accepts $ACCEPTS";
