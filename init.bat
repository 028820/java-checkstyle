rem 拷贝pre-commit

set CONFIG_PRE_COMMIT=.\.git\hooks\pre-commit

set ts=%date%%time%

set CONFIGF_PRE_COMMIT_BACKUP=.\.git\hooks\pre-commit%ts%.backup

if exist %CONFIG_PRE_COMMIT% (
	echo "backup exists pre-commit to %CONFIGF_PRE_COMMIT_BACKUP%"
    move %CONFIG_PRE_COMMIT% %CONFIGF_PRE_COMMIT_BACKUP%
 )

echo "copy pre-commit to git hook"
copy c:\java-checkstyle\pre-commit.win .\.git\hooks\pre-commit
copy c:\java-checkstyle\check.py .\.git\hooks\check.py

echo "java checkstyle installed!"
