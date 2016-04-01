aws-reset ()
{

  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY \
      AWS_SECURITY_TOKEN AWS_SESSION_TOKEN \
      AWS_ROLE_NAME AWS_ROLE_EXPIRATION
  source "/etc/profile.d/aws-env.sh"
}

assume-role ()
{
  aws-reset
  AWS_ROLE_TMPFILE="$HOME/.aws-role-tmp"
  TOKEN_BIN=$(which get-role-token)

  echo -n "Role name: "
  read ROLE
  echo -n "MFA Token: "
  read TOKEN

  echo -n "Acquiring Token..."
  $TOKEN_BIN 618319395214 618319395214 $ROLE $TOKEN > $AWS_ROLE_TMPFILE
  if [ $? -eq 0 ] && [ -s $AWS_ROLE_TMPFILE ]; then
    source $AWS_ROLE_TMPFILE
    echo " Installed!"
  else
    echo " Failed"
  fi
}

assume-dev-admin-global ()
{
  AWS_ROLE_TMPFILE="$HOME/.aws-role-tmp"
  TOKEN_BIN=$(which get-role-token)
  ROLE="dev_admin_global"

  echo -n "MFA Token: "
  read TOKEN

  echo -n "Acquiring Token..."
  $TOKEN_BIN 240342446256 718988833002 $ROLE $TOKEN > $AWS_ROLE_TMPFILE
  if [ $? -eq 0 ] && [ -s $AWS_ROLE_TMPFILE ]; then
    source $AWS_ROLE_TMPFILE
    echo " Installed!"
  else
    echo " Failed"
  fi
}

assume-dev-read-only ()
{
  AWS_ROLE_TMPFILE="$HOME/.aws-role-tmp"
  TOKEN_BIN=$(which get-role-token)
  ROLE="dev_read_only"
  echo -n "MFA Token: "
  read TOKEN

  echo -n "Acquiring Token..."
  $TOKEN_BIN 240342446256 718988833002 $ROLE $TOKEN > $AWS_ROLE_TMPFILE
  if [ $? -eq 0 ] && [ -s $AWS_ROLE_TMPFILE ]; then
    source $AWS_ROLE_TMPFILE
    echo " Installed!"
  else
    echo " Failed"
  fi
}

assume-prod-admin-global ()
{
  AWS_ROLE_TMPFILE="$HOME/.aws-role-tmp"
  TOKEN_BIN=$(which get-role-token)
  ROLE="prod_admin_global"

  echo -n "MFA Token: "
  read TOKEN

  echo -n "Acquiring Token..."
  $TOKEN_BIN 240342446256 618319395214 $ROLE $TOKEN > $AWS_ROLE_TMPFILE
  if [ $? -eq 0 ] && [ -s $AWS_ROLE_TMPFILE ]; then
    source $AWS_ROLE_TMPFILE
    echo " Installed!"
  else
    echo " Failed"
  fi
}

assume-prod-read-only ()
{
  AWS_ROLE_TMPFILE="$HOME/.aws-role-tmp"
  TOKEN_BIN=$(which get-role-token)
  ROLE="prod_read_only"

  echo -n "MFA Token: "
  read TOKEN

  echo -n "Acquiring Token..."
  $TOKEN_BIN 240342446256 618319395214 $ROLE $TOKEN > $AWS_ROLE_TMPFILE
  if [ $? -eq 0 ] && [ -s $AWS_ROLE_TMPFILE ]; then
    source $AWS_ROLE_TMPFILE
    echo " Installed!"
  else
    echo " Failed"
  fi
}

mins-until ()
{
  target=$(date --date="$1" +"%s")
  now=$(date +"%s")
  echo $(((target - now)/60))
}

aws-prompt ()
{
  if [ -n "${AWS_ROLE_NAME+1}" ] && [ -n "${AWS_ROLE_EXPIRATION+1}" ]; then
    REMAINING=$(mins-until $AWS_ROLE_EXPIRATION)
    printf "[%s:%sm] " $AWS_ROLE_NAME $REMAINING
  fi
}
