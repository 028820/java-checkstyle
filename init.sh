#/bin/bash

CONFIG_PRE_COMMIT="./.git/hooks/pre-commit"
CONFIGF_PRE_COMMIT_BACKUP="./.git/hooks/pre-commit.backup"

if [ -f "$CONFIG_PRE_COMMIT" ] 
then
    echo "backup exists pre-commit to $CONFIGF_PRE_COMMIT_BACKUP."
    mv $CONFIG_PRE_COMMIT $CONFIGF_PRE_COMMIT_BACKUP 
fi

echo "copy pre-commit to git hook"
cp ~/Documents/checkstyle/pre-commit ./.git/hooks/pre-commit

echo "java checkstyle installed!"
