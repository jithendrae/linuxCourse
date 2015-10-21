#! /bin/bash
# Main program calling password checker function from stub

source ./shellScriptAsgn2_stub.sh

PASSWORD_WRONG=1

while [ $PASSWORD_WRONG -eq 1 ]
do
  echo "Enter the password:"
  read -s ENTERED_PASSWORD

  PwdChecker $ENTERED_PASSWORD
  retVal=$?

  if [ "$retVal" == "1" ]
     then 
     echo "Password entered is as per Specification";

     PASSWORD_WRONG=0;

  elif [ "$retVal" == "2" ] then

     echo "Please type the password so it has at least one number and one special charachter from (@ * & % $)";
     
  elif [ "$retVal" == "3" ] then

     echo "Please type the password so it has minimum 10 characters and must contaian at least one number and one special charachter from (@ * & % $)";

  else echo "Program Error"

fi

done

exit 0;
