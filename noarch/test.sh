missing='\033[0;31m[Missing]\033[0m'
found='\033[0;32m[Found]\033[0m'

if [ ! -e "/etc/sudoers.d/admin" ]; then
  echo -e "File: /etc/profile.d/vesta.sh $found"
else
  echo -e "File: /etc/sudoers.d/admin $missing"
fi

if [ ! -e "/etc/profile.d/vesta.sh" ]; then
  echo -e "File: /etc/profile.d/vesta.sh $found"
else
  echo -e "File: /etc/profile.d/vesta.sh $missing"
fi

