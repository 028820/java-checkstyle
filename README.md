
### step 1 Download
git clone git@github.com:028820/java-checkstyle.git ~/Documents/checkstyle

### step 2 Java Project

mkdir java\_example && cd java\_example && git init

touch Test.java

```java
public class Test{
	public static final int aaa = 2;

	private int b;

	private int c;
}
```

### step 3 Install git pre-commit hook
~/Documents/checkstyle/init.sh

### step 4 Test Commit
git add *

git commit -m 'Test git-hook'

### step 5 Report

Render checkstyle_report.xml by XSLT.

Open checkstyle_report.xml in Safari (Recommend).
![](https://028820.github.io/img/checkstyle/checkstyle_error.png)


Chrome (XSLT doesn't work) see: 
https://stackoverflow.com/questions/2981524/how-can-i-make-xslt-work-in-chrome.

