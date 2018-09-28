#!/bin/bash


CONFIG_CHECK_JAR=~/Documents/java-checkstyle/checkstyle.jar;
CONFIG_CHECK_FILE=~/Documents/java-checkstyle/checkstyle.xml;
CONFIG_ERROR_FILE=~/Documents/java-checkstyle/checkstyle_errors.xml;
CONFIG_ERROR_REPORT_FILE=~/Documents/java-checkstyle/checkstyle_report.xml;

echo "scaning project..."
JAVA_CMD="java -cp $CONFIG_CHECK_JAR com.puppycrawl.tools.checkstyle.Main -c $CONFIG_CHECK_FILE */src/ -f xml -o $CONFIG_ERROR_FILE"
$JAVA_CMD

response=`cat $CONFIG_ERROR_FILE|grep \<error|head -n 1`;
if [[ $response == *"error"* ]]
then
  awk '{print;} NR == 1 { print "<?xml-stylesheet xmlns=\"http://www.w3.org/1999/xhtml\" href=\"checkstyle-simple.xsl\" type=\"text/xsl\"?>"}' $CONFIG_ERROR_FILE > $CONFIG_ERROR_REPORT_FILE;
  echo "Check your code. Open by Safari or Chrome ( --allow-file-access-from-files ): $CONFIG_ERROR_REPORT_FILE";
  open $CONFIG_ERROR_REPORT_FILE
  exit -1
else
  echo "Ok"
fi