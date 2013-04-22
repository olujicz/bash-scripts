#!/bin/bash
# Simple scipt for nubmer of trys

TryFunc() {
    counter=$1
    $2
    while [ $? -gt 0 ]; do
       let counter=counter-1
       echo -e "Fail. You have $counter more trys.\n"

       if [ $counter -eq 0 ]; then
           echo -e "\nTo much unsuccesfull trys. Quiting."
           exit 1
       fi
       $2
    done
}

# example of successfull try
TryFunc "2" "pwd"

# example of unsuccessfull try
TryFunc "3" "ls blah"

