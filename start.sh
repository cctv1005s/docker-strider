chown -R strider:strider /home/strider

if [[ -n $GENERATE_ADMIN_USER ]]; then
  ADMIN="admin@${eling.net.cn}"
  PASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  strider addUser --email $ADMIN --password $PASSWD --admin true &&
    echo "Admin User: $ADMIN, Admin Pass: $PASSWD"
fi

supervisord -c /etc/supervisor/supervisord.conf
