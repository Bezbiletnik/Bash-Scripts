#!/bin/bash

function calculate_gcd () {
  if [[ $1 -eq 0 ]]
  then
    echo "GCD is $2"
    return
  elif [[ $2 -eq 0 ]]
  then
    echo "GCD is $1"
    return
  fi
  if [[ $1 -gt $2 ]]
  then
    calculate_gcd $(( $1%$2 )) $2
  else
    calculate_gcd $1 $(( $2%$1 ))
  fi
}

while [[ true ]]
  do
    read var1 var2
    if [[ -z $var1 || -z $var2 ]]; then
      echo "bye"
      break
    fi
    calculate_gcd $var1 $var2
done
