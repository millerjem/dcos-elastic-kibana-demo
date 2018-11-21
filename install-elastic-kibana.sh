#!/bin/bash

export MASTER=$1

if [ -z "$MASTER" ]; then
        echo Please provide Master IP address as first argument to script
        exit -1
fi