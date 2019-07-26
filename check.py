import os
import webbrowser

CONFIG_CHECK_JAR="c:/java-checkstyle/checkstyle.jar"
CONFIG_CHECK_FILE="c:/java-checkstyle/checkstyle.xml"
CONFIG_ERROR_FILE="c:/java-checkstyle/checkstyle_errors.xml"
CONFIG_ERROR_REPORT_FILE="c:/java-checkstyle/checkstyle_report.xml"

config = 1

if not os.path.exists(CONFIG_CHECK_JAR):
    config = 0
    print("Please confirm checkstyle jar, path: $CONFIG_CHECK_JAR ")

if not os.path.exists(CONFIG_CHECK_FILE):
    config = 0
    print("Please confirm checkstyle file, path: $CONFIG_CHECK_FILE ")

if config == 0:
    print("config error")
    exit(1)

# execute git diff commond
java_files = os.popen("git diff --cached --name-only |findstr .java|findstr /v .Test\.java")

javafiles = java_files.read()

if javafiles.strip()=='':
    java_files.close()
    exit(0)

javafiles = javafiles.replace('\n',' ')

isExists = os.path.exists(CONFIG_ERROR_FILE)
if (isExists):
    os.remove(CONFIG_ERROR_FILE)

java_cmd = "java -cp " + CONFIG_CHECK_JAR + " com.puppycrawl.tools.checkstyle.Main -c " + CONFIG_CHECK_FILE  + " "+ javafiles + " -f xml -o " + CONFIG_ERROR_FILE

# execute java check style
cmd = os.popen(java_cmd).read()

if (not os.path.exists(CONFIG_ERROR_FILE)):
    exit("exit")

# read error file
error_file = open(CONFIG_ERROR_FILE, 'r')
error = error_file.readlines()

findError = False
# read file
lines = []
for line in error:
        lines.append(line)
        if line.find("<error")!=-1:
            findError = True
error_file.close()

if findError:
    # insert xsl
    lines.insert(1,"<?xml-stylesheet xmlns=\"http://www.w3.org/1999/xhtml\" href=\"checkstyle-simple.xsl\" type=\"text/xsl\"?>\n")
    temp = ''.join(lines)
    # write file
    error_file = open(CONFIG_ERROR_FILE, 'w+')
    error_file.write(temp)
    error_file.close()

    del lines[:]
    webbrowser.open(CONFIG_ERROR_FILE)
    exit(1)
else:
    del lines[:]
    exit(0)




