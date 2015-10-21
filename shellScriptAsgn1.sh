#!/bin/bash

#Finding list of files that were modified in the last 24 hrs with size <256kb
#and saving the filenames to an "output" file

find ~ -mtime 0 -size -256k 2>/dev/null > output

#Compressing each file (-T option reads each line from the given file )
#and archiving to a tar ball 

tar 2>/dev/null -Pczf tar.gz -T output

#Setting up uname and passwd params to connect to ftp server

HOST="localhost"
USER="anon"
PASSWD="anon"
FILE="tar.gz"

#FTP protocol to send file to server upon authentication

STATUS=`ftp -vn $HOST <<EOF
quote USER $USER
quote PASS $PASSWD
binary
put $FILE
quit
EOF`

#Deleting files upon successful upload and logging failures

if [ "$(echo $STATUS | grep -c 226)" -ge 1 ]; 
then echo "file upload successful";
#rm output temp tar.gz;
else echo "file upload unsuccessful";
echo $STATUS > ftplog
fi

exit 0
