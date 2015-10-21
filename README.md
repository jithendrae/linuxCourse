# linuxCourse

- [Shell Scripting Assignment 1](#shell-scripting-assignment-1)
- [Shell Scripting Assignment 2](#shell-scripting-assignment-2)

## Shell Scripting Assignment 1

- Setup a cron job to compress as tar.gz all the files in your home directory that have been modified in the last 24 hours. 
- Include only files smaller than 256 KB. Once it's compressed upload the file into a locally running FTP server. 
- It should not overwrite the older compressed files in the FTP server.

**Assignment 1:**
`shellScriptAsgn1.sh` is a bash script file that performs the action of reading files from home directory, verifying the file size and uploading to local ftp server. This script is job-scheduled to run every day 3 A.M. in the crontab file as:

 ```bash
 0 3 * * * jithendrae    bash /home/jithendrae/Desktop/GitWorkspace/linuxCourse/shellScriptAsgn1.sh
```

The FTP Server installed in the local server is `pure-ftpd`. `pureadmin` gui is used to manage users. Ex: `anon` user in our script. The pure-ftpd server is configured with "AutoRename YES" settingn by creating a config file called **AutoRename** and writing **YES** into it. This file is placed in the `/etc/pure-ftpd/conf/`

To install and set up the pure-ftpd server I followed the doc: `https://help.ubuntu.com/community/PureFTP`

This location contains other config fies like AltLog FSCCharset MinUID NoAnonymous PAMAuthentication PureDB UnixAuthentication etc.
- Note: **anon** is the user name I added and not refers to the usual anonymous user which may pre exist in some servers

Upon file upload, if the newly uploaded file name conflicts with an earlier existing file in the user's directory ``/home/ftpusers/anon`` the ftp server renames the file as follows:
- Old file existing in user directory : tar.gz
- Newly Uploaded file name: tar.gz
- New File then saved as tar.gz.1 and so on ...

## Shell Scripting Assignment 2

Write a password checker script to test against the following parameters
- Minimum 10 characters
- Atleast one number and one special character (from @, *, &, %, $)

**Assignment 2:**
`shellScriptAsgn2.sh` is a bash script file that reads string input as user's password and checks for the above 2 conditions. If the conditions are met the program exits otherwise, it repeatedly requests user to type correct string to match the given specification.

* The program checks for character length by using the `${#string}` notation.
* In order to check for at least one number it uses grep pattern `[0-9]+` and for special character `[@*&%$]+`
