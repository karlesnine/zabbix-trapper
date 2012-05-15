#!/bin/bash

#####
# Version: 0.1 - 20011/08/09
# Author: jean-Baptiste Favre <jbfavre@jbfavre.org>

SCRIPT="$0"
APACHE_SCRIPT="$(dirname $SCRIPT)/$(basename $SCRIPT .trapper.sh).py"
PYTHON=$(which python)

$PYTHON $APACHE_SCRIPT
