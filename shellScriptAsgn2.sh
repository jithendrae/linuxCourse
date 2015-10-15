#! /bin/bash
# Read Password

PASSWORD_WRONG=1

#Reading password string until correct format is executed

while [ $PASSWORD_WRONG -eq 1 ]
 do
    echo "Enter the password:"
    read -s ENTERED_PASSWORD

    len=$(echo ${#ENTERED_PASSWORD})

    # Using 'AND' operator in grep requires the format ' grep - E "pattern1pattern2|pattern2pattern1" '  
    
    echo "$ENTERED_PASSWORD" | grep -E "[0-9]+[@*&%$]|[@*&%$][0-9]+";

    if [ $? = 0 ] && [ $len -gt 9 ]	
     then 
        echo "PASSWORD ENTERED is as per Specification"
    	
        PASSWORD_WRONG=0;
    
    else
        echo "Please type the password so it has minimum 10 characters and must contaian
              at least one number and one special charachter from (@ * & % $)"
    fi
done
