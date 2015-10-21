#! /bin/bash
# Check Password

#Reading password entered in command line argument '{ $1 }'

PwdChecker() {
   
   retValue=0

   ENTERED_PASSWORD=$1 ;
   
   if [ ${#ENTERED_PASSWORD} -gt 9 ]  then
   
   # Using 'AND' operator in grep requires the format ' grep - E "pattern1pattern2|pattern2pattern1" '  
   echo "$ENTERED_PASSWORD" | grep -E "[0-9]+[@*&%$]+|[@*&%$]+[0-9]+";
   
      if [ $? = 0 ] then retValue=1
      else  retValue=2
      fi
   
   else retValue=3
   fi

   return "$retValue"
}

exit 1;
