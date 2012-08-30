#!/bin/bash
JENKINS_WAR=/opt/jenkins/jenkins.war
JENKINS_LOG=/opt/jenkins/jenkins.log
JAVA=$JAVA_HOME/bin/java
nohup nice $JAVA -jar $JENKINS_WAR > $JENKINS_LOG 2>&1 &