re="^ode*"
if [[ $target_env =~ $re ]]
then
  echo 'Match';
else
  echo 'No Match';
fi
