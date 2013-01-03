#!/bin/bash
kill `ps -ef | grep jenkins.war | grep -v grep | awk '{ print $2 }'`