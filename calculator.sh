set -f

function calculate () {
  echo "$(( $1 $2 $3 ))"
  return 0
}

function check_input () {
  if [[ $1 =~ [0-9]+ && $3 =~ [0-9]+ ]]; then
   case $2 in
     "+"|"-"|"*"|"/"|"%"|"**")
       return 0 
       ;;
     *)
       echo "error"
       exit
       ;;
   esac
  fi
  echo "error"
  exit
}

while [[ true ]]; do
  read var1 operator var2
  if [[ $var1 == "exit" ]]; then
    echo "bye"
    exit
  fi
  if check_input $var1 $operator $var2; then
    calculate $var1 $operator $var2
  else
    echo "something went wrong!"
  fi
done
