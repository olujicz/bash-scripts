#!/bin/bash
# Simple scipt for nubmer of attempts

AttemptsFunc() {
    counter=$1
    $2
    while [ $? -gt 0 ]; do
       let counter=counter-1
       echo -e "Fail. You have $counter more attempts.\n"

       if [ $counter -eq 0 ]; then
           echo -e "\nTo much unsuccesfull attempts. Quiting."
           exit 1
       fi
       $2
    done
}

# example of successfull attempt
AttemptsFunc "2" "pwd"

# example of unsuccessfull attempt
AttemptsFunc "3" "ls blah"

