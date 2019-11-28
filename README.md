### Step 1 Download

**Mac/Linux**: git clone https://github.com/028820/java-checkstyle.git ~/Documents/java-checkstyle

**Windows**: git clone https://github.com/028820/java-checkstyle.git c:/java-checkstyle

### Step 2 Java Project

mkdir java\_example && cd java\_example && git init

touch Test.java

```java

public class Test{
	public static final int aaa = 2;

	private int b;

	private int c;
}

```

### Step 3 Install git pre-commit hook for java_example
**Mac/Linux**: ~/Documents/java-checkstyle/init.sh

**Windows**: c:/java-checkstyle/init.bat

### Step 4 Test Commit
git add *

git commit -m 'Test git-hook'

### Step 5 Report

Render checkstyle_report.xml by XSLT.

**Mac/Liunx**: Open checkstyle_report.xml in Safari (Recommend).

**Windows**: Open checkstyle_errors.xml in IE (Recommend).


#### Safari Requires
1. Safari -> Preferences -> Advanced -> Show Develop menu in menu bar (MUST CHECK)
2. Develop -> Disable Local File Restrictions (MUST CHECK)
3. Make sure the "~/Documents/java-checkstyle/checkstyle_report.xml" Open With Safari (Default), it's for convenience. git-hook will be auto-open the report if your code with checkstyle problem

#### Windows Depend On Python 2.7 or later 


![](https://028820.github.io/img/checkstyle/checkstyle_error.png)


Chrome (XSLT doesn't work) see: 
https://stackoverflow.com/questions/2981524/how-can-i-make-xslt-work-in-chrome.