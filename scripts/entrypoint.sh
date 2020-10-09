#!/bin/bash

cat /sonar.properties >> /opt/sonarqube/conf/sonar.properties

mkdir -p "$SONARQUBE_DATA" "$SONARQUBE_TEMP"

echo "sonar.path.data=$SONARQUBE_DATA\n" >> /opt/sonarqube/conf/sonar.properties
echo "sonar.path.temp=$SONARQUBE_TEMP\n" >> /opt/sonarqube/conf/sonar.properties

/opt/sonarqube/bin/linux-x86-64/sonar.sh start
tail -f /opt/sonarqube/logs/sonar.log
